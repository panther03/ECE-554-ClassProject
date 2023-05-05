/*
WI-23 Simple Frontend Test
Aidan McEllistrem
3/30/23
*/

#include "lib/mmap.h"
#include "lib/kb.h"
#include "lib/vga.h"

#define STATE_WELCOME   0
#define STATE_CALC      1
#define STATE_EQUATION  2
#define STATE_GRAPH     3
#define STATE_SETTINGS  4
int window_state = STATE_WELCOME;

const int MAX_LINE_SIZE = 80;
const int MAX_EQ_LINE_SIZE = 76;

const uint8_t TOP_BORDER[]           = {0xCD};
const uint8_t SIDE_BORDER[]          = {0xBA};
const uint8_t TOP_LEFT_BORDER[]      = {0xC9};
const uint8_t TOP_RIGHT_BORDER[]     = {0xBB};
const uint8_t BOTTOM_LEFT_BORDER[]   = {0xC8};
const uint8_t BOTTOM_RIGHT_BORDER[]  = {0xBC};

struct line_buf_t {
  char buf[80];
  int i = 0;
  uint8_t color = 0x0f;
}

// one line for the calc...
struct line_buf_t calc_line;
// ... and four lines for the equations
struct line_buf_t eq_lines[4];
int curr_eq_line = 0;

// for editing lines
void add_char(line_buf_t *line, uint8_t c, int max) {
  if(line->i < max) {
    line->buf[line->i] = c;
    line->i++;
  }
}

void delete_char(line_buf_t *line) {
  if(line->i > 0) {
    line->i--;
  }
}

// fancy VGA text mode boxes
void vga_draw_box(int x1, int y1, int x2, int y2, uint8_t c) {
  int i = (x2 - x1);
  int p = 1;
  while (i > 1) {
    vga_print(p + x1, y1, TOP_BORDER, c);
    vga_print(p + x1, y2, TOP_BORDER, c);
    p++;
    i--;
  }
  
  i = (y2 - y1);
  p = 1;
  // draw left and right side
  while (i > 1) {
    vga_print(x1, p + y1, SIDE_BORDER, c);
    vga_print(x2, p + y1, SIDE_BORDER, c);
    p++;
    i--;
  }

  // draw top left corner
  vga_print(x1, y1, TOP_LEFT_BORDER, c);

  // draw top right corner
  vga_print(x2, y1, TOP_RIGHT_BORDER, c);

  // draw bottom left corner
  vga_print(x1, y2, BOTTOM_LEFT_BORDER, c);

  // draw bottom right corner
  vga_print(x2, y2, BOTTOM_RIGHT_BORDER, c);
}


// draw the fancy banner always upon state entry
void sw_state(int st) {
  window_state = st;
  // wrap around, don't go back to welcome
  if(window_state > STATE_SETTINGS) {
    window_state = STATE_CALC;
  }
  //clear_screen();

  // show the current "window"
  vga_print(0,0,L"CALCULATE (F1) ",                   (st == STATE_CALC     ? 0x6000 : 0x4E00));
  vga_print(15,0,L"\xB3",                             0x6000);
  vga_print(16,0,L" EQUATIONS (F2) ",                 (st == STATE_EQUATION ? 0x6000 : 0x4E00));
  vga_print(32,0,L"\xB3",                             0x6000);
  vga_print(33,0,L" GRAPHER (F3) ",                   (st == STATE_GRAPH    ? 0x6000 : 0x4E00));
  vga_print(46,0,L"\xB3",                             0x6000);
  vga_print(47,0,L" SETTINGS (F4)        0123456789", (st == STATE_SETTINGS ? 0x6000 : 0x4E00));
}

__attribute__((section(".text")))
int main() {
  // start main GUI loop
  while(1) {
    // c is always current input
    uint8_t c = kb_char();

    if (window_state == STATE_WELCOME) {
      vga_draw_box(5,20,75,26,0x0F00);
      vga_print_plain(6,21,L"WISC-23 GRAPHING CALCULATOR");
      vga_print_plain(6,22,L"-PRESS ANY KEY-");
      if (kb_char()) {
        sw_state(STATE_EQUATION);
        window_state = STATE_EQUATION;
      } 
    }
    else if (window_state == STATE_CALC) {
      if (c != 0) {
        add_char(&calc_line, c, MAX_LINE_SIZE);
        // once enter is pressed, evaluate
        // TODO ELAN -- edit this please to route to your settings
        if(kb_delete()) {
           remove_char(&calc_line);
        }
      }
      // display the current line
      vga_print_buf(0,0,calc_line->buf,calc_line->color);
    }
    else if (window_state == STATE_EQUATION) {
      vga_draw_box(0,2,40,6,0x0F00);
      vga_print_plain(1,4,L"PLEASE ENTER AN EQUATION:");
      
      vga_draw_box(0,8,40,10,0x0F00);
      vga_print_plain(1,9,L"Y=");
    }
    else if (window_state == STATE_GRAPH) {
      plot(0x02);
    }

    // pressing FN 1-4 will cycle states
    int status = kb_status() & MASK_FN_KEY;
    if (status <= 4)
      sw_state(status);
    
  }
  return 0;
}
