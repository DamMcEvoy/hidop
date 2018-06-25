/*******************************************************************************
 * HID opcodes
 * (c) VL, 2018
 *
 * Licensed under the BSD license (see ../../LICENSE-bsd.txt)
 *******************************************************************************/
#include "hidapi.h"
#include <plugin.h>
#include <sstream>

// HDI device list printing
struct hidprint : csnd::Plugin<0, 0> {

  int init() {
    int i = 0;
    struct hid_device_info *devs, *cur_dev;
    std::stringstream sstr;
    hid_init();
    devs = hid_enumerate(0, 0);
    cur_dev = devs;
    sstr << "HID devices connected:\n";
    while (cur_dev) {
      sstr << "====================\n";
      sstr << std::dec;
      sstr << "device #" << i << std::endl;
      sstr << std::hex;
      sstr << "path: " << cur_dev->path << std::endl;
      sstr << "VID: 0x" << cur_dev->vendor_id << std::endl;
      sstr << "PID: 0x" << cur_dev->product_id << std::endl;
      sstr << "usage page: 0x" << cur_dev->usage_page << std::endl;
      sstr << "usage: 0x" << cur_dev->usage << std::endl;
      cur_dev = cur_dev->next;
      csound->message(sstr.str().c_str());
      sstr.str(std::string());
      i++;
    }
    hid_free_enumeration(devs);
    hid_exit();
    return OK;
  }
};
struct hidout : csnd::Plugin<1,2> { // csound struct: name , 1 out and 2 ins

      hid_device *handle;

  int init(){//initialise i-time performance:

      int i = 0; //counter 
      struct hid_device_info *devs, *cur_dev;// get info from the device via HIDlib
      
      //Find Device:
    devs = hid_enumerate(0, 0);//returns list to devs
      cur_dev = devs;
      while (cur_dev) {//begin looking for the device
      if (cur_dev->usage_page == 1 && cur_dev->usage == 5 &&
          cur_dev->vendor_id == 0x54C && cur_dev->product_id == 0x5C4) {
          break;
      }
      cur_dev = cur_dev->next;
      i++;
      }

      // if the device was found:
      if (cur_dev) {
        handle = hid_open_path(cur_dev->path);// open path to device
        if (!handle) {
            printf("unable to open device\n");
            return NOTOK;
          }
        }
        hid_set_nonblocking(handle, 1); //sends a Feature report to the device
        hid_free_enumeration(devs);
        csound->plugin_deinit(this);
        csound->init_error("error message");
    return OK;
  }

  int deinit() {
       hid_close(handle);
       return OK;
  }

  int kperf(){
    // I am assuming I need to recall these variable in the krate performance.
    //I get errors otherwise
    int res = 0;
      unsigned char buf[256];


      //assign the 
      int arg1 = (int)inargs[0];//first
      int arg2 = (int)inargs[1];//second

    res = hid_read(handle, buf, sizeof(buf));
        if (res > 0) {
          int val;
          // if arg2 is given, use it as a bitmask
          if(arg2) val = buf[arg1] & arg2 ? 1 : 0;
          // else just retrieve the value
          else val = buf[arg1];

          outargs[0] = (MYFLT)val;
      }
    csound->perf_error("error message", insdshead); 
    return OK;
  }
};

#include <modload.h>
void csnd::on_load(Csound *csound) {
  csnd::plugin<hidprint>(csound, "hidprint", "", "", csnd::thread::i);
  csnd::plugin<hidout>(csound, "hidout", "k", "ii", csnd::thread::ik);
  // tracing for debugging purposes, remove when ready.
  csound->message("HID opcode library loaded \n");
}
