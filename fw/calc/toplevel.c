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
#define STATE_TETRIS     5
int window_state = STATE_WELCOME;

#define MAX_LINE_SIZE         78
#define MAX_EQ_LINE_SIZE      70
#define MAX_EQ_OUT_LINE_SIZE  20
#define MAX_SETTING_LINE_SIZE 10

const char SPIN_CURSOR[4] = {0x5C, 0xB3, 0x2F, 0xC4};

void draw_state_bar(int st) {
  vga_print(0,0, "CALCULATE (F1) ",                  (st == STATE_CALC     ? 0x60 : 0x4E));
  vga_print(15,0,"\xB3",                             0x4E);
  vga_print(16,0," EQUATIONS (F2) ",                 (st == STATE_EQUATION ? 0x60 : 0x4E));
  vga_print(32,0,"\xB3",                             0x4E);
  vga_print(33,0," GRAPHER (F3) ",                   (st == STATE_GRAPH    ? 0x60 : 0x4E));
  vga_print(46,0,"\xB3",                             0x4E);
  vga_print(47,0," SETTINGS (F4) ",                  (st == STATE_SETTINGS ? 0x60 : 0x4E));
  vga_print(62,0,"\xB3",                             0x4E);
  vga_print(63,0," TETRIS (F5)     ",                (st == STATE_TETRIS ? 0x60 : 0x4E));
}

/////////////////////////////////////
// now, for the entirety of tetris //
/////////////////////////////////////

// stuck in frontend.c so we assume we have everything we need included
int last_time = 0;
// should cap out at 19
unsigned int tetris_level = 0;
#define TETRIS_MAX_LEVEL 20
unsigned int tetris_score = 0;
#define MAX_SCORE_LEN 8
unsigned int tetris_lines = 0;
unsigned int tetris_pieces = 0;

int tetris_lost = 0;

// player data
int tetris_curr_idx = 0;
int tetris_curr_rot = 0;
// cursor pos for tetris
int tetris_curr_x   = 4;
int tetris_curr_row = 20;
#define CURR_PIECE_ROT_MAX 3
int tetris_nxt_idx = 0;

// these are to NES standard
const int TETRIS_LINE_SCORES[] = {40, 100, 300, 1200};
#define TETRIS_SOFT_DROP_POINT 1
#define TETRIS_HARD_DROP_POINT 2

// drop rates (slightly off NES)
const int TETRIS_G_TABLE[] = 
    {48, 43, 38, 33, 28, 23, 18, 13, 8, 6, //0-9
    5, 5, 5, 4, 4, 4, 3, 3, 2, 2, 1}; //10-19
// track index
int tetris_curr_g = 0;

// the well is 22 large, idx 0 is bottom, 22 is top
// upper 4 bits are the color data, lower 4 bits are the piece data
// (0 = not present, 1-3 = various states of being present);
// but as always only the bottom 20 rows are drawn
uint8_t tetris_well[22][10];
#define TETRIS_WELL_WIDTH 10
#define TETRIS_WELL_DWIDTH 20
#define TETRIS_WELL_MID_X4 20
#define TETRIS_WELL_USABLE_DEPTH 20
#define TETRIS_WELL_DEPTH 22
char tetris_score_buf[16];
char tetris_line_buf[16];

#define TETRIS_WELL_TOP_X 35
#define TETRIS_WELL_TOP_Y 6

#define TETRIS_ARE 8

// fade gradient (4 chars because timing nicely divides it)
const uint8_t TETRIS_BLOCK_DISPLAY[] = {0x2E, 0xB0, 0xB1, 0xDB}; 
#define TETRIS_FULL  3
#define TETRIS_EMPTY 0

// these are the tetris guideline standardized colors
// I = light blue, J = dark blue, L = orange, O = yellow, S = green, Z = red, T = magenta
const uint8_t TETRIS_BLOCK_COLORS[]  = {9, 1, 6, 14, 10, 12, 13};

// byte encoded tetris pieces
const uint16_t TETRIS_I[] = {0x00f0, 0x2222, 0x00f0, 0x2222};
const uint16_t TETRIS_J[] = {0x0039, 0x0096, 0x0138, 0x00d2};
const uint16_t TETRIS_L[] = {0x003c, 0x0192, 0x0078, 0x0093};
const uint16_t TETRIS_O[] = {0x000f, 0x000f, 0x000f, 0x000f};
const uint16_t TETRIS_S[] = {0x001e, 0x0099, 0x001e, 0x0099};
const uint16_t TETRIS_Z[] = {0x0033, 0x005a, 0x0033, 0x005a};
const uint16_t TETRIS_T[] = {0x003a, 0x00b2, 0x00b8, 0x009a};

const int TETROMINO_SIZES[] = {4,3,3,2,3,3,3};
const uint16_t* TETROMINOS[] = {TETRIS_I, TETRIS_J, TETRIS_L, TETRIS_O, TETRIS_S, TETRIS_Z, TETRIS_T};

// the rng mechanisms
int rseed = 0;
#define N_TETROMINOS 7

// keybinds
// WASD does movement, KL does rotation
// fairly arbitrary -- you may change these
#define KEYBIND_HDROP_UPPER 0x57
#define KEYBIND_HDROP_LOWER 0x77
#define KEYBIND_SDROP_UPPER 0x53
#define KEYBIND_SDROP_LOWER 0x73
#define KEYBIND_LEFT_UPPER  0x41
#define KEYBIND_LEFT_LOWER  0x61
#define KEYBIND_RIGHT_UPPER 0x44
#define KEYBIND_RIGHT_LOWER 0x64
#define KEYBIND_CW_UPPER    0x4B
#define KEYBIND_CW_LOWER    0x6B
#define KEYBIND_CCW_UPPER   0x4C
#define KEYBIND_CCW_LOWER   0x6C

// ticks to clear the well on a "tetris"
#define TETRIS_LCLEAR_TIME 40

// block data is stored in two parts of the char to save space
const uint8_t TETRIS_BLOCK_COLOR_MASK = 0xf0;
const uint8_t TETRIS_BLOCK_DISP_MASK = 0x0f;

//https://rosettacode.org/wiki/Linear_congruential_generator#C
void srand(int x) {
  rseed = x;
}

int rand() {
  rseed = (rseed * 1103515245 + 12345);// & RAND_MAX;
  return rseed;
}

// get a piece number, reset pos vars
// no grab bag for now
void get_next_piece() {
  tetris_curr_idx = tetris_nxt_idx;
  tetris_nxt_idx = *TIMER % 7;
  tetris_curr_x = 3;
  tetris_curr_row = 19;
}

// get length assuming buf string is null
int char_buf_size(char *buf) {
  int i = 0;
  while (*buf != 0)
    i++;
  return i;
}

void tetris_reset() {
  // ensure window will run at least once!
  last_time = 0;
  // clear game values
  tetris_level = 0;
  tetris_score = 0;
  tetris_lines = 0;
  
  // clear game position
  tetris_curr_rot = 0;
  tetris_curr_x   = 3;
  // piece put at the very top (slightly above seeable space)
  tetris_curr_row = 19;
  
  // reset rng
  srand(*TIMER);
  // set next piece to always be i
  tetris_curr_idx = *TIMER % 7; 
  tetris_nxt_idx = *TIMER % 7;
  
  // clear buffer
  int i = 0;
  int j = 0;
  
  // reset well
  while (i < TETRIS_WELL_WIDTH) {
    while (j < TETRIS_WELL_DEPTH) {
      tetris_well[j][i] = 0x00;
      j++;
    }
    j = 0;
    i++;
  }
}

///////////////
// TRAVERSAL //
///////////////

// check if coords are out of bounds of the well
int oob(int x, int y) {
  return (x < 0 || x >= TETRIS_WELL_WIDTH || y < 0);
}

// idx 0 = no entry!
// idx 1 to 3 = various states of block
// (1 to 2 are anim frames, 3 is full)
int has_cell(int x, int y) {
  // OOB entries are considered cells
  if (oob(x,y))
    return 1;
  else
    return (tetris_well[y][x] & TETRIS_BLOCK_DISP_MASK);
}

#define FN_TETRIS_VGA_DRAW   0
#define FN_TETRIS_SET_WELL   1
#define FN_TETRIS_COLLIDE    2
#define FN_TETRIS_VGA_NEXT   3

// previously took in a function pointer that defined the behavior 
// upon reading in a block bit, now just does a conditional

int piece_traversal(int fn_type, int piece_num, int rot, int x, int y) {
  // treat the integer as an x by x grid where each bit is an entry in the grid
  int t_size = TETROMINO_SIZES[piece_num];
  // result may be returned
  // used exclusively by collision, ignored by everything else
  int result = 0;
  // rot's between 0 to 3 (0 -> 90 -> 180 -> 270)
  uint16_t piece_data = TETROMINOS[piece_num][rot];
  int off_x = 0;
  int off_y = 0;

  int i = 0;
  int j = 0;
  // start from (t_size, t_size) 
  while (j < t_size) {
    while (i < t_size) {
      // rotate according to how the tetrominos are laid out in memory
      off_x = x + (t_size - i);
      off_y = y + j;
      int shift_amount = (j * t_size) + i;
      // has a bit in the pos?
      int has_solid_cell = (piece_data & (0x01 << shift_amount));

      // do something different depending on the functionality fn int given
      // used to use FPs but i had a hunch it was screwing with the compiler
      
      
      if (has_solid_cell) {
        if (fn_type == FN_TETRIS_VGA_DRAW) {
          // dont draw over other chars
          // used for drawing the piece
          vga_print_char(TETRIS_WELL_TOP_X + off_x, TETRIS_WELL_TOP_Y + TETRIS_WELL_USABLE_DEPTH - off_y, 0xDB, TETRIS_BLOCK_COLORS[piece_num]);
          // print top right
          //vga_print_char(TETRIS_WELL_TOP_X + x, TETRIS_WELL_TOP_Y + TETRIS_WELL_USABLE_DEPTH - y, 0x0a, 0x0f);
        } else if(fn_type == FN_TETRIS_SET_WELL) {
          // do some bounds checking
          // its surprisingly easy to corrupt a lot of the memory via a bad write
          if(!oob(off_x,off_y)) {
            // color is the hi nybble, present data is the lower nybble
            tetris_well[off_y][off_x] = (TETRIS_FULL | (TETRIS_BLOCK_COLORS[piece_num] << 4));
          }
        } else if(fn_type == FN_TETRIS_COLLIDE) {
          // bounds check
          if(has_cell(off_x,off_y))
            result = 1;
        } else if(fn_type == FN_TETRIS_VGA_NEXT) {
          vga_print_char(off_x, off_y, 0xDB, TETRIS_BLOCK_COLORS[piece_num]);
        }
      }
      i++;
    }
    i = 0;
    j++;
  }
  return result;
}


// draw the well from memory to VGA
void tetris_display_well(int x, int y) {
  int i = 0;
  int j = 0;
  while (j < TETRIS_WELL_USABLE_DEPTH) {
    while (i < TETRIS_WELL_WIDTH) {
      // print row 0 at the bottom and so on
      // the char we get is determined by the last 4 bits
      //int d_idx = (i >> 1);
      //int d_idx = i;
      char block = TETRIS_BLOCK_DISPLAY[tetris_well[j][i] & TETRIS_BLOCK_DISP_MASK];
      char color = (tetris_well[j][i] & TETRIS_BLOCK_COLOR_MASK) ? (tetris_well[j][i] & TETRIS_BLOCK_COLOR_MASK) >> 4 : 0x0f;
      vga_print_char(
          x + i, // draw double width 
          y + (TETRIS_WELL_USABLE_DEPTH - j),
          block,
          color
      );
      i++;
    }
    i = 0;
    j++;
  }
}

//////////////
// GAMEPLAY //
//////////////

// do we have a full line?
int tetris_row_full(int row) {
  int i = 0;
  while (i < TETRIS_WELL_WIDTH) {
    if (!has_cell(i,row))
      return 0;
    i++;
  }
  return 1;
}

// do we have ANYTHING in a line?
int tetris_has_in_row(int row) {
  int i = 0;
  while (i < TETRIS_WELL_WIDTH) {
    if (has_cell(i,row))
      return 1;
    i++;
  }
  return 0;
}

// test that a piece is in a well given a proposed change in coords
int tetris_collides_in_well(int offx, int offy, int offrot) {
  return piece_traversal(
      FN_TETRIS_COLLIDE,
      tetris_curr_idx,
      (tetris_curr_rot + offrot) & 0x03,
      tetris_curr_x + offx,
      tetris_curr_row + offy
  );
}

// relies on clock timing, abuse the fact that everything is blocking
// pretty complicated
// clear one row at a time bidirectionally
void tetris_clear_line(int row) {
  // (thus no game updates will happen during this)
  
  // (4 (each disappear state) * 10 (well size)) / 2 (we clear the row in two directions
  // in addition we have frames after a clear for giving the player a break:
  // these are the mysterious ARE frames you may have heard about
  // thus it adds up to be 28 frames (~0.5sec) to clear the well
  int max_frames = TETRIS_LCLEAR_TIME + TETRIS_ARE;
  int curr_frame = 0;
  int init_frame = 0;
  int curr_time = *TIMER;
  int i = 0;
  while(max_frames > curr_frame) {
    i = 0;
    // do some well manip stuff
    while (i < TETRIS_WELL_WIDTH) {
      int l_offset = i;
      int r_offset = TETRIS_WELL_WIDTH - i - 1;
      // delta between the two frames
      int disappear_time = curr_frame - init_frame;
      // certified insane ternary, makes these frame offsets:
      // 20 16 12 8 4 4 8 12 16 20
      // 0  ->                    <- 9
      int mirror_row_frames = i < 5 ? ((5-i) << 2) : (((i-4) << 2));
      int anim_frame = mirror_row_frames - disappear_time;
      // evil ternary to pick char index
      char cell_data = anim_frame >= 3 ? 3 : (anim_frame >= 0 ? anim_frame : 0);
      // clear in two directions
      // don't clear color bits, but set disappear bits
      tetris_well[row][l_offset] = cell_data ? ((tetris_well[row][l_offset] & (TETRIS_BLOCK_COLOR_MASK)) | cell_data) : 0;
      tetris_well[row][r_offset] = cell_data ? ((tetris_well[row][r_offset] & (TETRIS_BLOCK_COLOR_MASK)) | cell_data) : 0;
      i++;
    }
    // if we got a VGA clock edge in,
    // draw again
    if (*TIMER != curr_time) {
      curr_frame++;
      curr_time = *TIMER;
      tetris_display_well(35,6);
    }
  }
  // we're done? ok, move the well down
  // this happens instantly after the animation + ARE resolves
  i = 0;
  int j = row;
  while (j < TETRIS_WELL_DEPTH) {
    // move ALL lines above this row offset down
    while (i < TETRIS_WELL_WIDTH) {
      // move down THE ROW ABOVE IT into this row
      // be careful to not move garbage into the row
      if (j < TETRIS_WELL_DEPTH-1)
        tetris_well[j][i] = tetris_well[j+1][i];
      else
        tetris_well[j][i] = 0;
      i++;
    }
    i = 0;
    j++;
  }
    
  
}

// will lock a piece down if it scrolls down into a collision
// since the wells can't be moved into by this,
// we can safely assume that a collision into the grid = bad
int tetris_move_piece_down() {
  // if we get a collision,
  int col = tetris_collides_in_well(0,-1,0);
  if (col) {
    // instantly snap and set the piece! (it can't move down anymore)
    // this is how NES tetris works
    piece_traversal(
      FN_TETRIS_SET_WELL,
      tetris_curr_idx,
      tetris_curr_rot,
      tetris_curr_x,
      tetris_curr_row
    );
    // reset variables, get a new piece
    tetris_pieces++;
    // check for cleared rows clear rows
    int j = TETRIS_WELL_USABLE_DEPTH;
    int rows_cleared = 0;
    while (j >= 0) {
      if (tetris_row_full(j)) {
        tetris_clear_line(j);
        rows_cleared++;
      }
      j--;
    }

    // is there a tetromino on the 2nd to top row?
    if (tetris_has_in_row(20)) {
      tetris_lost = 1;
    } else {

      // award lines on line clear, will advance the level if > (level * 10)
      tetris_lines += rows_cleared;
      if (tetris_lines > (tetris_level * 10) && tetris_level < TETRIS_MAX_LEVEL)
        tetris_level++;
      
      // award points on row clear (if any)
      if (rows_cleared > 0)
        tetris_score += ((tetris_level + 1) * TETRIS_LINE_SCORES[rows_cleared-1]);
      // done!
      get_next_piece();
    }
  } else {
    // we didn't get a collision; move the piece down one row
    tetris_curr_row--;
  }
  return col;
}

void tetris_apply_gravity() {
  tetris_curr_g++;
  // did we get the right amount of frames? move the piece down then
  if (tetris_curr_g > TETRIS_G_TABLE[tetris_level]) {
    tetris_curr_g = 0;
    tetris_move_piece_down();
  }
}

// may do only one action per frame
// this IS very bad for responsiveness, do not get me wrong
void tetris_control(uint8_t c) {
  // movement L/R
  if (c == KEYBIND_LEFT_LOWER || c == KEYBIND_LEFT_UPPER) {
    // now check collision
    if (!tetris_collides_in_well(-1, 0, 0)) {
      tetris_curr_x--;
    }
  }
  
  else if (c == KEYBIND_RIGHT_LOWER || c == KEYBIND_RIGHT_UPPER) {
    // now check collision
    if (!tetris_collides_in_well(1, 0, 0)) {
      tetris_curr_x++;
    }
  }

  // rotation 90* clockwise (so + rot)
  else if (c == KEYBIND_CW_UPPER || c == KEYBIND_CW_LOWER) {
    if (!tetris_collides_in_well(0, 0, 1)) {
      // wrap around between 0 and 3
      tetris_curr_rot = (tetris_curr_rot + 1) & 0x03;
    }
  }

  // rotation 90* counter-clockwise (so - rot)
  else if (c == KEYBIND_CCW_UPPER || c == KEYBIND_CCW_LOWER) {
    if (!tetris_collides_in_well(0, 0, -1)) {
      tetris_curr_rot = (tetris_curr_rot - 1) & 0x03;
    }
  }
  
  // dropping (hard = instantly, soft = one at a time)
  else if (c == KEYBIND_SDROP_LOWER || c == KEYBIND_SDROP_UPPER) {
    // apply gravity instantly, do independently of gravity lowering
    tetris_move_piece_down();
  }

  else if (c == KEYBIND_HDROP_LOWER || c == KEYBIND_HDROP_UPPER) {
    // apply gravity instantly
    while(!tetris_move_piece_down()) {}
  }
}



// display a "GAME OVER!" message
void tetris_game_over() {
  vga_draw_box(47,21,56,24,0x0f,0x0f);
  vga_print_plain(48,22,"GAME");
  vga_print_plain(49,23,"OVER!");
}


void tetris_window() {
  // clear the screen
  set_text_buffer(0x0000);

  // draw debug strings
  /*
  vga_print_plain(0,0,"-PLAYER DATA-");
  vga_draw_hex_debug_str(0,1,tetris_curr_idx); vga_print_plain(9,1,"IDX");
  vga_draw_hex_debug_str(0,2,tetris_curr_x);   vga_print_plain(9,2,"X");
  vga_draw_hex_debug_str(0,3,tetris_curr_row); vga_print_plain(9,3,"ROW");
  vga_draw_hex_debug_str(0,4,tetris_curr_rot); vga_print_plain(9,4,"ROT");

  vga_print_plain(0,6,"-TIME-");
  vga_draw_hex_debug_str(0,7,*TIMER);
  vga_draw_hex_debug_str(0,8,tetris_curr_g);

  vga_print_plain(0,10,"-SCOREKEEPING-");
  vga_draw_hex_debug_str(0,11,tetris_score); vga_print_plain(9,11,"SCORE");
  vga_draw_hex_debug_str(0,12,tetris_lines);   vga_print_plain(9,12,"#LINES");
  vga_draw_hex_debug_str(0,13,tetris_pieces);   vga_print_plain(9,13,"#DROPS");
  */
  // draw state window to make sure the user understands they can
  // switch to another state while playing tetris
  draw_state_bar(STATE_TETRIS);
  
  // draw line count
  vga_draw_box(34,1,45,3,0x0f,0x0f);
  //write_integer(tetris_lines, tetris_line_buf);
  vga_print_plain(35,2,"LINES - ");
  vga_print_plain_buf(43,2,tetris_line_buf,3);
  
  // draw well
  vga_draw_box(TETRIS_WELL_TOP_X-1,5,TETRIS_WELL_TOP_X+10,27,0x0f,0x0f);
  tetris_display_well(TETRIS_WELL_TOP_X, TETRIS_WELL_TOP_Y);
  
  // draw score
  vga_draw_box(47,1,57,7,0x0f,0x0f);
  //write_integer(tetris_score, tetris_score_buf);
  vga_print_plain(48,2,"-SCORE-");
  
  // get # of 0s
  int score_len = char_buf_size(tetris_score_buf);
  for(int i = 0; i < (MAX_SCORE_LEN - score_len); i++) {
    vga_print_char(48+i,3,'0',0x0f);
  }
  // draw score amount after 0s
  vga_print_plain_buf(48 + (MAX_SCORE_LEN - score_len),3,tetris_score_buf,score_len);
  
  // draw "next" window
  vga_draw_box(47,9,57,15,0x0f,0x0f);
  vga_print_plain(48,10,"-NEXT-");
  // always draw at "normal" rotation (0 degrees)
  piece_traversal(FN_TETRIS_VGA_NEXT, tetris_nxt_idx, 0, 48, 12);
  
  // draw current piece
  piece_traversal(FN_TETRIS_VGA_DRAW, tetris_curr_idx, tetris_curr_rot, tetris_curr_x, tetris_curr_row); 
}

///////////////
// MAIN LOOP //
///////////////
int tetris(char c) {
  // we are already in a loop
  // wait for time to change
  // we set last_time to init to 0, should always run at least once
  int input = 0;
  int time = *TIMER;
  if (time != last_time) {
    // we HAVE to poll input sparingly
    volatile unsigned int *KEY    = (volatile unsigned int*)0xfffec13c;
    input = *KEY;
    // we only get a char and status on break
    uint8_t c = (input & 0xffffff00) ? (char)input : 0x00;
      
    if (!tetris_lost) {
      tetris_control(c);
      // apply "gravity" until the frame count lets the game move the piece down
      tetris_apply_gravity();
      // piece setting is done with the gravity check,
      // no more needs to be done
    }
      
    // now draw the window
    tetris_window();
    // reset time
    last_time = *TIMER;
  }
  
  // return key to see if the user requests to switch to another state
  return input;
}



//////////////////////
// ACTUAL FRONTEND  //
//////////////////////



struct line_buf_t {
  char buf[80];
  int i;
  uint8_t color;
};
int fn_status = 0;
int last_status = 0;

// one line for the calc...
struct line_buf_t calc_line = {.color = 0x0f};

// reserve space for up to 10 lines of equation history
char eq_output[10][20];
uint8_t eq_output_colors[10];
int eq_hist_size = 0;
#define EQ_HIST_MAX 10
int eq_err = 0;
int has_eq_result = 0;
// ... and four lines for the equations
struct line_buf_t eq_lines[] = {
  [0] = {.color = 0x09},
  [1] = {.color = 0x0c},
  [2] = {.color = 0x02},
  [3] = {.color = 0x0d}
};
int curr_eq_line = 0;
// also five lines for user defined settings
struct line_buf_t setting_lines[] = {
  [0] = {.color = 0x0f, .buf = "-10.0"},
  [1] = {.color = 0x0f, .buf = "10.0"},
  [2] = {.color = 0x0f, .buf = "-10.0"},
  [3] = {.color = 0x0f, .buf = "10.0"},
  [4] = {.color = 0x0f, .buf = "0.0"},
};
int setting_err = 0;
int curr_setting_line = 0;
int line_sel = 0;

// for editing lines
void add_char(struct line_buf_t *line, uint8_t c, int max) {
  if(line->i < max) {
    line->buf[line->i] = c;
    line->i++;
  }
}

void remove_char(struct line_buf_t *line) {
  if(line->i > 0) {
    int back = (line->i-1);
    line->buf[line->i] = 0;
    line->buf[back] = 0;
    line->i--;
  }
}

void clear_line(struct line_buf_t *line) {
  int i = 0;
  while (i < MAX_LINE_SIZE) {
    line->buf[i] = 0x00;
    i++;
  }
  line->i = 0;
}

void strncpy(char *dst, char *src, int len) {
  int i = 0;
  while (i < len) {
    *(dst+i) = *(src+i);
    i++;
  }
}

void draw_line_box(int x, int y, int box_w, int sel, int draw_color, char* header, int header_len, struct line_buf_t *line) {
  vga_draw_box(x,y,x+box_w,y+2,0x0f,0x0f);
  
  if (draw_color) {
    vga_print_char(x+1,y+1,0xdb,line->color);
    vga_print_plain(x+2,y+1,header);
  } else {
    vga_print_plain(x+1,y+1,header);
  }
  if (sel)
    // spinning cursor
    vga_print_char (x+39,y+1, SPIN_CURSOR[((*TIMER) & 0x0C) >> 2], 0x0f);
  else
    vga_print_char (x+39,y+1, ' ', 0x0f);

  // don't forget to draw the line buffer
  vga_print_buf(x+header_len,y+1,line->buf,0x0f,MAX_EQ_LINE_SIZE);
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
    // reset 
    clearGraph();
  }
  // set bg to black
  set_text_buffer(0x0000);

  // show the current "window"
  draw_state_bar(window_state);

  char ws_sig[6] = "012345";
  vga_print_char(79,0,ws_sig[window_state],0x6f);

  window_state = st;
}

// parses given line as a constant (any var is assumed to be 0.0)
float get_line_constant(struct line_buf_t *line, int *err) {
  Queue equation;
  structureQueue_Queue(&equation);
  parse_equation(&line->buf, &equation);
          
  // grab default x
  int x_err = 0;
  float output = solveEquation(&equation, 0.0, &x_err);
  *err = x_err;
  return output;
}

void kb_stroke_to_buf(struct line_buf_t *line, int input, int max_buf_len) {
  uint8_t c = ((char)input);
  int status = (input & 0xffffff00) >> 8;
  int make = status & MASK_MAKE;
  if (make && c && !(status & MASK_BACK))
    add_char(line, c, max_buf_len);
  else if (make && (status & MASK_BACK))
    remove_char(line);
}

__attribute__((section(".text")))
int main() {
  sw_state(STATE_WELCOME);
  // start main GUI loop
  while(1) {
    // c is always current input
    volatile unsigned int *KEY    = (volatile unsigned int*)0xfffec13c;
    int input = 0;
    int status = 0;
    if (window_state != STATE_TETRIS) {
      input = *KEY;
      status = (input & 0xffffff00) >> 8;
    }

    if (window_state == STATE_WELCOME) {
      // draw credits
      vga_draw_box(5,6,75,14,0x0f,0x0f);
      vga_print_plain(6,7,"-WISC-23 GRAPHING CALCULATOR-");
      vga_print_plain(6,8,"Julien de Castelnau        WI-23 Compiler, ISA");
      vga_print_plain(6,9,"Ayaz Franz                 Floating Point + Grapher");
      vga_print_plain(6,10,"Elan Graupe                Equation Parser");
      vga_print_plain(6,11,"Aidan McEllistrem \x01        Peripherals + Frontend, Tetris");
      vga_print_plain(6,12,"Madhav Rathi               FP Pipeline, ISA");
      
      // print general info
      vga_print_plain(6,17,"\x07State-of-the-art dual-issue floating point RISC processor");
      vga_print_plain(6,18,"\x07Blazing-fast equation evaluation");
      vga_print_plain(6,19,"\x07Vibrant 16-color display with instantaneous graphing");
      vga_print_plain(6,20,"\x07Astounding entertainment software");
      
      // any key is fine, don't go back to this state
      if (input) {
        sw_state(STATE_CALC);
        window_state = STATE_CALC;
      }
    }
    else if (window_state == STATE_CALC) {
      vga_print_plain(0,1,"Enter in an equation, and press = to evaluate.");
      
      kb_stroke_to_buf(&calc_line, input, MAX_EQ_LINE_SIZE); 
      if((status & MASK_ENTER) && (calc_line.buf[0] != 0x00)) {
        Queue equation;
        structureQueue_Queue(&equation);
        parse_equation(calc_line.buf, &equation);
        
        // grab default x from settings
        int x_err = 0;
        float use_x = get_line_constant(&setting_lines[4], &x_err);
        
        float output = 0.0;
        if (!x_err)
          output = solveEquation(&equation, use_x, &eq_err);
        else
          eq_err = 1;
        
        //remove all chars in line, reset the cursor
        clear_line(&calc_line);
        
        //output result on next line
        if (!eq_err) {
          eq_output_colors[0] = 0x02;
          // set buffer to output
          fp_to_str(output, eq_output[0]);
          // max of 10 entries in the history table
          if (eq_hist_size < EQ_HIST_MAX)
              eq_hist_size++;
          // add output to history
          for(int i = eq_hist_size-1; i > 0; i--) {
            strncpy(eq_output[i], eq_output[i-1], MAX_EQ_OUT_LINE_SIZE);
            eq_output_colors[i] = eq_output_colors[i-1];
          }
        } else {
          strncpy(eq_output[0], "SYNTAX ERROR       ", MAX_EQ_OUT_LINE_SIZE);
          eq_output_colors[0] = 0x04;
        }
        vga_print_char(0,3,'=',eq_output_colors[0]);
        vga_print_buf(1,3,eq_output[0],eq_output_colors[0],MAX_EQ_OUT_LINE_SIZE);
      }
      
      // display blinking cursor
      char carat = ((*TIMER) & 0x08) ? 0x3E : 0x20;
      vga_print_char(0,2,carat,0x0f);
      // display current line     
      vga_print_buf(2,2,calc_line.buf,0x0f,MAX_LINE_SIZE);
      
      // print history (if we have any)
      vga_print_plain(0,5,"-HISTORY-");
      for (int i = 0; i < eq_hist_size; i++) {
        vga_print_char(0,6,'=',eq_output_colors[i]);
        vga_print_buf(1,6,eq_output[i],eq_output_colors[i],MAX_EQ_OUT_LINE_SIZE);
      }
      
    }
    else if (window_state == STATE_EQUATION) {
      vga_draw_box(0,2,40,6,0x0f,0x0f);
      vga_print_plain(1,3,"PLEASE ENTER AN EQUATION:");
      vga_print_plain(1,4,"(F9 - F12 selects the graph row)");
      
      // draw equation boxes
      draw_line_box(0,10,80,line_sel == 0,1,"Y1 = ", 5, &eq_lines[0]);
      draw_line_box(0,15,80,line_sel == 1,1,"Y2 = ", 5, &eq_lines[1]);
      draw_line_box(0,20,80,line_sel == 2,1,"Y3 = ", 5, &eq_lines[2]);
      draw_line_box(0,25,80,line_sel == 3,1,"Y4 = ", 5, &eq_lines[3]);

      // route key input to the line which will modify it accordingly
      kb_stroke_to_buf(&eq_lines[line_sel], input, MAX_EQ_LINE_SIZE); 
      
      // delete with ESC (DELETE isn't mapped for some reason)
      if (status & MASK_ESC) {
        int i = 0;
        while(i < 4) {
          clear_line(&eq_lines[i]);
          i++;
        }
      }
    }
    else if (window_state == STATE_GRAPH) {
      // proposed behavior: have a infinite loop, break when try to switch screen
      //                    before enter loop, have the if statement to check if equation input and clear screen
      //                    then in the loop: draw the 4 lines once, and keep polling for input to switch screens
      if (!has_eq_to_plot() || eq_err || setting_err) {
         vga_draw_box(12,4,68,8,0x0f,0x0f);
         if(!has_eq_to_plot()) {
           vga_print(13,5,"No Equation to Plot!",0x09);
           vga_print_plain(13,6,"Please enter in an equation in the EQUATIONS (F2) menu.");
         } else if(eq_err) {
           vga_print(13,5,"Graph Syntax Error!",0x04);
           vga_print_plain(13,6,"Equation recieved, but there was an error parsing.");
         } else {
           vga_print(13,5,"Settings Syntax Error!",0x04);
           vga_print_plain(13,6,"Please check that the bounds are valid numbers.");
         }
      } else {
         int i = 0;
         while (i < 4) {
           // if there is text in a buffer (has something to graph)...
           if (eq_lines[i].buf[0]) {
             // graph(char *eq, char color) 
	     // include error handling for parsing equations (graph will return 1 if there is an error)
             // get all four x/y bounds
             int bound_err = 0;
             float x1 = get_line_constant(&setting_lines[0], &bound_err);
             float x2 = get_line_constant(&setting_lines[1], &bound_err);
             float y1 = get_line_constant(&setting_lines[2], &bound_err);
             float y2 = get_line_constant(&setting_lines[3], &bound_err);
             eq_err = graph(eq_lines[i].buf, eq_lines[i].color, x1, x2, y1, y2);
           }
           i++;
         }
         // didn't get an error? switch to graph mode
         if (!eq_err) {
           *VGA_CONFIG = 1;
         }
      }
    } else if (window_state == STATE_SETTINGS) {
      vga_draw_box(0,2,60,5,0x0f,0x0f);
      vga_print_plain(1,3,"USER DEFINED SETTINGS - GRAPHING");
      vga_print_plain(1,3,"(F9 - F12 selects the setting entry)");

      draw_line_box(0,7,18, line_sel == 0, 0,"-x: ", 5, &setting_lines[0]);
      draw_line_box(20,7,18,line_sel == 1,0,"+x: ", 5,  &setting_lines[1]);
      draw_line_box(40,7,18,line_sel == 2, 0,"-y: ", 5, &setting_lines[2]);
      draw_line_box(60,7,18,line_sel == 3,0,"+y: ", 5,  &setting_lines[3]);

      vga_print_plain(0,10,"-Value to use for 'x' when parsing (F8)-");
      draw_line_box(0,11,80,line_sel == 4, 0,"x=? ", 5, &setting_lines[4]);

      // route key input to the line which will modify it accordingly
      kb_stroke_to_buf(&setting_lines[line_sel], input, MAX_SETTING_LINE_SIZE); 

      // delete with ESC (DELETE isn't mapped for some reason)
      if (status & MASK_ESC) {
        int i = 0;
        while(i < 4) {
          setting_lines[i].i = 0;
          i++;
        }
        *setting_lines[0].buf = "-10.0";
        *setting_lines[1].buf = "10.0";
        *setting_lines[2].buf = "-10.0";
        *setting_lines[3].buf = "10.0";
        *setting_lines[4].buf = "0.0";
      }
   
    } else if (window_state == STATE_TETRIS) {
      int tetris_input = 0;
      int tetris_status = 0;
      int tetris_goto = 0;
      if (!tetris_lost) {
        // tetris consumes input in its state function
        // this is required as it only checks input on VBLANK
        tetris_input = tetris(0);
      } else {
        tetris_game_over();
        tetris_input = *KEY;
      }
      
      // check if we pressed FN
      tetris_status = (tetris_input & 0xffffff00) >> 8;
      tetris_goto = (tetris_status & MASK_FN_KEY);
      
      if(tetris_input) {
        if (!(tetris_status & MASK_FN_KEY)) {
          tetris_reset();
          tetris_lost = 0;
        } else {
          if (tetris_goto >= 0 && tetris_goto <= 5)
            sw_state(tetris_goto);
        }
      }
    }

    // pressing FN 1-5 will cycle states
    fn_status = status & MASK_FN_KEY;
    if (fn_status > 0 && fn_status <= 5) {
      //last_status = fn_status;
      sw_state(fn_status);
    } else {
      // pressing FN 9-12 will change the selected box
      if (fn_status >= 9 && fn_status <= 12) {
        line_sel = fn_status - 9; 
      // only let the 5th select be set if in settings
      } else if (fn_status == 8 && window_state == STATE_SETTINGS) {
        line_sel = 4;
      }
    }
    
    // pressing TAB also cycles states
    if (status & MASK_TAB) {
      sw_state((window_state + 1) % 6);
    }
    
  }
  return 0;
}