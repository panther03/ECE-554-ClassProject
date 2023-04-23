/*
Test byte alignment for drawing text.
3/30/23
*/

#include "lib/inttypes.h"
#include "lib/vga.h"

void test_draw_diag() {
  int i = 0;
  int c = 0;
  while (i < 240) {
    draw_px(i,i,c);
    //draw_px(0,i,c);
    //draw_px(i,0,c);
    i++;
    c++;
    if (c > 15) {
      c = 0;
    }
  }
}

uint8_t* msg_data;

void test_draw_charset() {
  int i = 0;
  uint8_t curr_char = 0;
  uint8_t c = 0;
  while (i < 2400) {
    *msg_data = curr_char;
    vga_print(i,0,msg_data,(((c+1) & 0x07) << 4) + 0x0f);
    curr_char++;
    i++;
    c++;
    if (c > 15) {
      c = 0;
    }
  }
  // print bounds
  vga_print(0,0,"X",0x0f);
  vga_print(2400,0,"X",0x0f);
}

void test_draw_px() {
  int i = 0;
  int c = 0;
  while (i < 76800) {
    draw_px(i,0,c);
    i++;
    c++;
    if (c > 15) {
      c = 0;
    }
  }
}

__attribute__((section(".text")))
int main() {
  test_draw_charset();
  test_draw_px();
  while(1) {
    continue;
  }
  return 0;
}
