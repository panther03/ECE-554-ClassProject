/*
Top-Level Frontend
*/
#include "lib/inttypes.h"
#include "lib/mmap.h"
#include "lib/kb.h"
#include "lib/vga.h"

#include "solver.h"
#include "str_fp.h"
//#include "grapher.h"

#define STATE_WELCOME   0
#define STATE_CALC      1
#define STATE_EQUATION  2
#define STATE_GRAPH     3
#define STATE_SETTINGS  4
int window_state = STATE_WELCOME;

#define MAX_LINE_SIZE      80
#define MAX_EQ_LINE_SIZE   76

char TOP_BORDER[]           = {0xCD};
char SIDE_BORDER[]          = {0xBA};
char TOP_LEFT_BORDER[]      = {0xC9};
char TOP_RIGHT_BORDER[]     = {0xBB};
char BOTTOM_LEFT_BORDER[]   = {0xC8};
char BOTTOM_RIGHT_BORDER[]  = {0xBC};

struct line_buf_t {
  char buf[80];
  int i;
  uint8_t color;
};
int last_status = 0;

// one line for the calc...
struct line_buf_t calc_line = {.i = 0, .color = 0x0f};
char eq_output[80];
int eq_err = 0;
// ... and four lines for the equations
struct line_buf_t eq_lines[4];
int curr_eq_line = 0;

// for editing lines
void add_char(struct line_buf_t *line, uint8_t c, int max) {
  if(line->i < max) {
    line->buf[line->i] = c;
    line->i++;
  }
}

void remove_char(struct line_buf_t *line) {
  if(line->i > 0) {
    line->i--;
  }
}

void clear_line(struct line_buf_t *line) {
  for(int i = 0; i < MAX_LINE_SIZE; i++) {
    line->buf[i] = 0x00;
  }
  line->i = 0;
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
  clear_text_buffer();

  // show the current "window"
  vga_print(0,0, "CALCULATE (F1) ",                  (st == STATE_CALC     ? 0x60 : 0x4E));
  vga_print(15,0,"\xB3",                             0x60);
  vga_print(16,0," EQUATIONS (F2) ",                 (st == STATE_EQUATION ? 0x60 : 0x4E));
  vga_print(32,0,"\xB3",                             0x60);
  vga_print(33,0," GRAPHER (F3) ",                   (st == STATE_GRAPH    ? 0x60 : 0x4E));
  vga_print(46,0,"\xB3",                             0x60);
  vga_print(47,0," SETTINGS (F4)        0123456789", (st == STATE_SETTINGS ? 0x60 : 0x4E));
}

__attribute__((section(".text")))
int main() {
  sw_state(STATE_WELCOME);
  // start main GUI loop
  while(1) {
    // c is always current input
    uint8_t c = kb_char();

    if (window_state == STATE_WELCOME) {
      vga_draw_box(5,20,75,28,0x0f);
      vga_print_plain(6,21,"-WISC-23 GRAPHING CALCULATOR-");
      vga_print_plain(6,23,"Julien de Castelnau        WI-23 Compiler");
      vga_print_plain(6,24,"Ayaz Franz                 Floating Point + Grapher");
      vga_print_plain(6,25,"Elan Graupe                Equation Parser");
      vga_print_plain(6,26,"Aidan McEllistrem \x01        Peripherals + Frontend");
      vga_print_plain(6,27,"Madhav Rathi               FP Pipeline");
      // any key is fine
      //if (kb_char() || kb_status()) {
      //  sw_state(STATE_CALC);
      //  window_state = STATE_CALC;
      //}
    }
    else if (window_state == STATE_CALC) {
      if (c != 0) {
        add_char(&calc_line, c, MAX_LINE_SIZE);
        // once enter is pressed, evaluate
        if(kb_enter()) {
          Queue equation;
          structureQueue_Queue(&equation);
          parse_equation(&calc_line.buf, &equation);
          
          float output = solveEquation(&equation, 1.0, &eq_err);
          //output result on next line
          fp_to_str(output, eq_output);
          //remove all chars in line, reset the cursor
          clear_line(&calc_line);
        }
        if(kb_back()) {
           remove_char(&calc_line);
        }
      }
      // display the current line
      vga_print_buf(0,1,calc_line.buf,0x0f,MAX_LINE_SIZE);
      if (eq_err == 0)
        vga_print_buf(0,2,calc_line.buf,0x02,MAX_LINE_SIZE);
      else
        vga_print(0,2,"SYNTAX ERROR",0x04);
    }
    else if (window_state == STATE_EQUATION) {
      vga_draw_box(0,2,40,6,0x0f);
      vga_print_plain(1,4,"PLEASE ENTER AN EQUATION:");
      
      vga_draw_box(0,8,40,10,0x0f);
      vga_print_plain(1,9,"Y=");
    }
    else if (window_state == STATE_GRAPH) {
      //plot(0x02);
      // proper line is plot(eq_lines[curr_eq_line].buf, eq_lines[curr_eq_line].color);
    }

    // pressing FN 1-4 will cycle states
    int status = kb_status() & MASK_FN_KEY;
    if (status != last_status && window_state != 0 && status <= 4) {
      last_status = status;
      sw_state(status);
    }
    
  }
  return 0;
}
