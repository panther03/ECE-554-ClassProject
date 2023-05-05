#include "lib/inttypes.h"
#include "lib/vga.h"
#include "lib/kb.h"

__attribute__((section(".text")))
int main() {
  uint8_t input_buf[80];
  input_buf[1] = '>';
  
  uint32_t cp = 0;
  vga_print_plain(0,0,"KEYBOARD TEST V2");
  vga_print_plain(0,1,"Please press a key, any key...");
  while(1) {
    uint8_t c = kb_char();
    if (c != 0) {
      input_buf[0] = c;
      input_buf[2 + cp] = c;
      cp++;
      if(cp > 78) {
        cp = 2;
      }
      vga_print_plain(0,3,"PRESSED A KEY!");
    }
    vga_print_plain_buf(0,2,input_buf,80);
    uint8_t s = kb_status();
  }
  return 0;
}
