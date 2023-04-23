#include "lib/inttypes.h"
#include "lib/vga.h"
#include "lib/kb.h"

__attribute__((section(".text")))
int main() {
  uint8_t input_buf[80];
  input_buf[1] = '>';
  
  uint32_t cp = 0;
  vga_print_plain(0,0,"KEYBOARD TEST");
  vga_print_plain(0,1,"Please press a key, any key...");
  while(1) {
    input_buf[0] = kb_char();
    if(kb_status()) {
      input_buf[2 + cp] = kb_char(); 
      cp++;
    }
    if(cp > 78) {
      cp = 0;
    }
    vga_print_plain_buf(0,2,input_buf,80);
    if(input_buf[0]) {
      vga_print_plain(0,3,"PRESSED A KEY!");
    }
  }
  return 0;
}
