#include "mmap.h"

// will return 0 if there is no key available
int kb_char() {
  return *PS2_KEY;
}

int kb_status() {
  return *PS2_STATUS;
}

// no way to wipe this (read only)
// ...so not very useful
int kb_char_present() {
  return *PS2_STATUS & MASK_RDY;
}

int kb_enter() {
  return *PS2_STATUS & MASK_ENTER;
}

int kb_tab() {
  return *PS2_STATUS & MASK_TAB;
}