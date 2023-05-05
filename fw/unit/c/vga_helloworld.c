/*
Simple VGA helloworld
Aidan McEllistrem & Julien de Castelnau
3/30/23
*/

#include "lib/vga.h"

__attribute__((section(".text")))
int main() {
  vga_print_plain(0,0,"Hello World!");
  while(1) {
    continue;
  }
  return 0;
}
