/*
Simple VGA helloworld
Aidan McEllistrem & Julien de Castelnau
3/30/23
*/

#define STATE_WELCOME   0
#define STATE_CALC      1
#define STATE_EQUATION  2
#define STATE_GRAPH     3
#define STATE_SETTINGS  4
int window_state = STATE_WELCOME;

// Using wide chars for the time being..
#define char int

// user-defined settings
unsigned int USER_MAX_LINES = 10

// In-hardware MM addresses
const int *VGA_TEXT_BUFFER = 0xFFFFE000;
const int VGA_TEXT_BUFFER_LINE_SIZE = 80;
const int LINE_BUF_START = 160;
const int VGA_TEXT_BUFFER_SIZE = 4800;

const int *PS2_KEY         = 0x0000C008;
const int *PS2_KEY_AWAIT   = 0x0000C009;
const int *PS2_KEY_ENTER   = 0x0000C00A;

const char TOP_BORDER[]          = {0x00CD};
const char SIDE_BORDER[]         = {0x00BA};
const char TOP_LEFT_BORDER[]     = {0x00C9};
const char TOP_RIGHT_BORDER[]    = {0x00BB};
const char BOTTOM_LEFT_BORDER[]  = {0x00C8};
const char BOTTOM_RIGHT_BORDER[] = {0x00BC};

// define the text buffer for the calculate line
char curr_line[80];
int cursor_pos = 0;
int line_pos = 0;

// define text buffer(s) for graphing equations
char eq_line[80]

// Grab the keycode from the MM'd address that connects to the KB
int poll_kb() {
 /if(*PS2_KEY_AWAIT) {
    // set flag down: we may grab a new char
    *PS2_KEY_AWAIT = 0;
  return *PS2_KEY;
  } else  {
    return 0;
  }
}

int kb_enter() {
  return *PS2_KEY_ENTER;
}

int kb_tab() {
  return 0;
}

void vga_print(int x, int y, const char* msg_data, int c) {
  int* buff_addr = VGA_TEXT_BUFFER + (y << 4) + (y << 6) + x;
  int i = 0;
  // assume string is NULL-terminated
  while (*(msg_data + i) != 0) {
    // set text data
    *(buff_addr + i) = *(msg_data + i) | c;
    i += 1;
  }
}

void vga_print_plain(int x, int y, const char* msg_data) {
  vga_print(x,y,msg_data,0x0F00);
}

// fancy VGA text mode boxes
void vga_draw_box(int x1, int y1, int x2, int y2, int c) {
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


void clear_screen() {
  int* buff_addr = VGA_TEXT_BUFFER;
  int i = 0;
  while (i < VGA_TEXT_BUFFER_SIZE) {
    // set text data
    *(buff_addr + i) = 0;
    i += 1;
  }
}

// draw the fancy banner
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
  // go to welcome state
  // (should be left and not returned to)
  sw_state(STATE_WELCOME);

  // start main GUI loop
  while(1) {
    if (window_state == STATE_WELCOME) {
      vga_draw_box(5,20,75,26,0x0F00);
      vga_print_plain(6,21,L"WISC-23 GRAPHING CALCULATOR");
      vga_print_plain(6,22,L"-PRESS ANY KEY-");
      if (poll_kb()) {
        sw_state(STATE_EQUATION);
        window_state = STATE_EQUATION;
      } 
    }
    else if (window_state == STATE_CALC) {
      vga_print_plain(0,line_pos,curr_line);
      if(poll_kb() && (cursor_pos >= 0 && cursor_pos <= 79)) {
        curr_line[cursor_pos] = poll_kb();
        cursor_pos++;
      }
      // once enter is pressed, evaluate
      // TODO ELAN -- edit this please to route to your settings
      if(kb_enter()) {
        // echo back
        vga_print(0,line_pos+1,curr_line,0x02);
        cursor_pos = 0;
        line_pos += 2;
      }
    }
    else if (window_state == STATE_EQUATION) {
      vga_draw_box(0,2,40,6,0x0F00);
      vga_print_plain(1,4,L"PLEASE ENTER AN EQUATION:");
      
      vga_draw_box(0,8,40,10,0x0F00);
      vga_print_plain(1,9,L"Y=");
    }
    else if (window_state == STATE_GRAPH) {
      
    }

    // pressing TAB will cycle states
    if (kb_tab())
      sw_state(window_state + 1);
    
  }
  return 0;
}
