#include <plugin.h>

struct Simplei : csnd::Plugin<1,1> {
  int init() {
    outargs[0] = inargs[0];
return OK; }
};

#include <modload.h>
void csnd::on_load(Csound *csound) {
  csnd::plugin<Simplei>(csound, "Simplei", "i", "i", csnd::thread::i);