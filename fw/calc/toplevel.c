/*
Top-Level Frontend
Aidan McEllistrem
4/30/2023
*/
#include "lib/inttypes.h"
#include "lib/mmap.h"
#include "lib/kb.h"
#include "lib/vga.h"

#include "solver.h"
#include "str_fp.h"
#include "grapher.h"

#define STATE_WELCOME   0
#define STATE_CALC      1
#define STATE_EQUATION  2
#define STATE_GRAPH     3
#define STATE_SETTINGS  4
#define STATE_DEBUG     5
int window_state = STATE_WELCOME;

#define MAX_LINE_SIZE      80
#define MAX_EQ_LINE_SIZE   30

#define TOP_BORDER           0xCD
#define SIDE_BORDER          0xBA
#define TOP_LEFT_BORDER      0xC9
#define TOP_RIGHT_BORDER     0xBB
#define BOTTOM_LEFT_BORDER   0xC8
#define BOTTOM_RIGHT_BORDER  0xBC
#define W_SHADOW             0xB0

const char SPIN_CURSOR[4] = {0x5C, 0xB3, 0x2F, 0xC4};

struct line_buf_t {
  char buf[80];
  int i;
  uint8_t color;
};
int status = 0;
int last_status = 0;
int last_eq_line_sel = 0;

// one line for the calc...
struct line_buf_t calc_line = {.i = 0, .color = 0x0f};
char eq_output[80];
int eq_err = 0;
int has_eq_result = 0;
// ... and four lines for the equations
struct line_buf_t eq_lines[] = {
  [0] = {.i = 0, .color = 0x09},
  [1] = {.i = 0, .color = 0x0c},
  [2] = {.i = 0, .color = 0x02},
  [3] = {.i = 0, .color = 0x0d}
};
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
void vga_draw_box(int x1, int y1, int x2, int y2, uint8_t c, uint8_t sh) {
  int i = (x2 - x1);
  int p = 1;
  // draw top and bottom side
  while (i > 1) {
    vga_print_char(p + x1, y1, TOP_BORDER, c);
    vga_print_char(p + x1, y2, TOP_BORDER, c);
    p++;
    i--;
  }
  
  i = (y2 - y1);
  p = 1;
  // draw left and right side
  while (i > 1) {
    vga_print_char(x1, p + y1, SIDE_BORDER, c);
    vga_print_char(x2, p + y1, SIDE_BORDER, c);
    p++;
    i--;
  }
  
  // draw shadow
  i = (x2 - x1);
  p = 1;
  while (i > 0) {
    vga_print_char(p + x1, y2 + 1, W_SHADOW, sh);
    p++;
    i--;
  }

  i = (y2 - y1) + 1;
  p = 1;
  while (i > 0) {
    vga_print_char(x2 + 1, p + y1, W_SHADOW, sh);
    p++;
    i--;
  } 

  // draw top left corner
  vga_print_char(x1, y1, TOP_LEFT_BORDER, c);

  // draw top right corner
  vga_print_char(x2, y1, TOP_RIGHT_BORDER, c);

  // draw bottom left corner
  vga_print_char(x1, y2, BOTTOM_LEFT_BORDER, c);

  // draw bottom right corner
  vga_print_char(x2, y2, BOTTOM_RIGHT_BORDER, c);
}


void draw_eq_line_box(int x, int y, int sel, struct line_buf_t *line) {
  vga_draw_box(x,y,x+40,y+2,0x0f,0x0f);
  vga_print_plain(x+1,y+1,"  Y=");
  //vga_print_char(x+2,y,0xCB,0x0f);
  //vga_print_char(x+2,y+2,0xCA,0x0f);
  vga_print_char(x+1,y+1,0xdb,line->color);
  if (sel)
    // spinning cursor
    vga_print_char (x+39,y+1, SPIN_CURSOR[((*TIMER) & 0x0C) >> 2], 0x0f);
  else
    vga_print_char (x+39,y+1, ' ', 0x0f);

  // don't forget to draw the line buffer
  vga_print_buf(x+5,y+1,line->buf,0x0f,MAX_EQ_LINE_SIZE);
}


int has_eq_to_plot() {
  // check if we have an equation to plot
  return (eq_lines[0].buf[0] || eq_lines[1].buf[0] || eq_lines[2].buf[0] || eq_lines[3].buf[0]);
}


// draw the fancy banner always upon state entry
void sw_state(int st) {
  // by default 
  *VGA_CONFIG = 0;
  // on window state transition
  if (st == STATE_CALC) {
    // reset calc line buffer for new equation
    clear_line(&calc_line);
    // we haven't solved an equation yet, reset flag 
    has_eq_result = 0;
  } else if (st == STATE_GRAPH) {
    *VGA_CONFIG = 1;
  }
  // set bg to black
  set_text_buffer(0x0000);

  // show the current "window"
  vga_print(0,0, "CALCULATE (F1) ",                  (st == STATE_CALC     ? 0x60 : 0x4E));
  vga_print(15,0,"\xB3",                             0x4E);
  vga_print(16,0," EQUATIONS (F2) ",                 (st == STATE_EQUATION ? 0x60 : 0x4E));
  vga_print(32,0,"\xB3",                             0x4E);
  vga_print(33,0," GRAPHER (F3) ",                   (st == STATE_GRAPH    ? 0x60 : 0x4E));
  vga_print(46,0,"\xB3",                             0x4E);
  vga_print(47,0," SETTINGS (F4) ",                  (st == STATE_SETTINGS ? 0x60 : 0x4E));
  vga_print(62,0,"\xB3",                             0x4E);
  vga_print(63,0," DEBUG (F5)      ",                (st == STATE_DEBUG ? 0x60 : 0x4E));

  char ws_sig[6] = "012345";
  vga_print_char(79,0,ws_sig[window_state],0x6f);

  window_state = st;
}

void init_bufs() {
  int i = 0;
  while(i < 4) {
    clear_line(&eq_lines[i]);
    i++;
  }
}

__attribute__((section(".text")))
int main() {
  init_bufs();
  sw_state(STATE_WELCOME);
  // start main GUI loop
  while(1) {
    // c is always current input
    uint8_t c = kb_char();

    if (window_state == STATE_WELCOME) {
      vga_draw_box(5,20,75,28,0x0f,0x0f);
      vga_print_plain(6,21,"-WISC-23 GRAPHING CALCULATOR-");
      vga_print_plain(6,23,"Julien de Castelnau        WI-23 Compiler");
      vga_print_plain(6,24,"Ayaz Franz                 Floating Point + Grapher");
      vga_print_plain(6,25,"Elan Graupe                Equation Parser");
      vga_print_plain(6,26,"Aidan McEllistrem \x01        Peripherals + Frontend");
      vga_print_plain(6,27,"Madhav Rathi               FP Pipeline");
      // any key is fine
      if (kb_char()) {
        sw_state(STATE_CALC);
        window_state = STATE_CALC;
      }
    }
    else if (window_state == STATE_CALC) {
      vga_print_plain(0,4,"Please enter in an equation, and press = to evaluate.");
      if (c != 0) {
        if (c != 0x3d) {
          add_char(&calc_line, c, MAX_LINE_SIZE);
          // once accept key is pressed, evaluate
	  // ensure that there is a line at all!
        } else if(c && (calc_line.buf[0] != 0x00)) {
          Queue equation;
          structureQueue_Queue(&equation);
          parse_equation(&calc_line.buf, &equation);
          
          float output = solveEquation(&equation, 1.0, &eq_err);
          //output result on next line
          fp_to_str(output, eq_output);
          //remove all chars in line, reset the cursor
          clear_line(&calc_line);
          if (eq_err == 0) {
            vga_print_char(0,2,'=',0x02);
            vga_print_buf(1,2,eq_output,0x02,MAX_LINE_SIZE-1);
          } else {
            vga_print(0,2,"SYNTAX ERROR",0x04);
          }
          // clear equation data after use
          for (int i = 0; i < MAX_LINE_SIZE; i++)
            eq_output[i] = 0;
        }
        if(kb_back())
           remove_char(&calc_line);
      }
      // display the current line
      vga_print_buf(0,1,calc_line.buf,0x0f,MAX_LINE_SIZE);
      
    }
    else if (window_state == STATE_EQUATION) {
      vga_draw_box(0,2,40,6,0x0f,0x0f);
      vga_print_plain(1,3,"PLEASE ENTER AN EQUATION:");
      vga_print_plain(1,4,"(F9 - F12 selects the graph row)");
      
      // draw boxes
      draw_eq_line_box(0,10,last_eq_line_sel == 0,&eq_lines[0]);
      draw_eq_line_box(0,15,last_eq_line_sel == 1,&eq_lines[1]);
      draw_eq_line_box(0,20,last_eq_line_sel == 2,&eq_lines[2]);
      draw_eq_line_box(0,25,last_eq_line_sel == 3,&eq_lines[3]);

      // check if you can edit an equation line
      if (status >= 9 && status <= 12) {
        last_eq_line_sel = status - 9; 
      }
      if (c != 0) {
        add_char(&eq_lines[last_eq_line_sel], c, MAX_EQ_LINE_SIZE);
      }
      // delete with F8 (TODO make this DELETE)
      /*if (status == 8) {
        int i = 0;
        while(i < 4) {
          clear_line(&eq_lines[i]);
          i++;
        }
      }*/
      
    }
    else if (window_state == STATE_GRAPH) {
      //plot(0x02);
      // proper line is plot(eq_lines[curr_eq_line].buf, eq_lines[curr_eq_line].color);
      //
      // proposed behavior: have a infinite loop, break when try to switch screen
      //                    before enter loop, have the if statement to check if equation input and clear screen
      //                    then in the loop: draw the 4 lines once, and keep polling for input to switch screens
      if (!has_eq_to_plot()) {
         vga_draw_box(12,4,48,8,0x0f,0x0f);
         vga_print_plain(13,5,"No equation to plot!");
         vga_print_plain(13,6,"Please enter in an equation in the EQUATIONS (F2) menu.");
         vga_print_plain(13,7,"(as long as there is input, this message will not show)");
      } else {
         int i = 0;
         while (i < 4) {
           // if there is text in a buffer (has something to graph)...
           if (eq_lines[i].buf[0]) {
             // graph(char *eq, char color) 
	     // include error handling for parsing equations (graph will return 1 if there is an error)
             graph(eq_lines[i].buf, eq_lines[i].color);
           }
           i++;
         }
      }
    }
    else if (window_state == STATE_DEBUG) {
      vga_print_plain(0,1,"-KB STATUS-");
      vga_draw_32bit_debug_str(0,2,kb_status());

      vga_print_plain(0,4,"-KB CHAR-");
      if (c != 0)
        vga_draw_32bit_debug_str(0,5,(int)c);
    }

    // pressing FN 1-4 will cycle states
    status = kb_status() & MASK_FN_KEY;
    if (status != last_status && status > 0 && status <= 5) {
      last_status = status;
      sw_state(status);
    }
    
  }
  return 0;
}
