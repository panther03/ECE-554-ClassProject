//void vga_print(int x, int y, const uint8_t* msg_data, uint16_t c);
//void vga_print_plain(int x, int y, const uint8_t* msg_data);
//void draw_px(int x, int y, uint8_t c);

/*
VGA PERIPHERAL LIBRARY
For drawing out to the screen.
Has a lot of convenience methods.

Aidan McEllistrem
4/22/2023
*/

#ifndef VGA_H
#define VGA_H

#include "mmap.h"

#define VGA_TEXT_BUFFER_BYTE_SIZE 2400

#define TOP_BORDER           0xCD
#define SIDE_BORDER          0xBA
#define TOP_LEFT_BORDER      0xC9
#define TOP_RIGHT_BORDER     0xBB
#define BOTTOM_LEFT_BORDER   0xC8
#define BOTTOM_RIGHT_BORDER  0xBC
#define W_SHADOW             0xB0

void vga_print_char(int x, int y, char msg_data, uint8_t c) {
  volatile uint16_t* buff_addr = (volatile uint16_t*)VGA_TEXT_BUFFER + (y << 4) + (y << 6) + x;
  // assume string is NULL-terminated
  *(buff_addr) = ((uint16_t)(msg_data)) | (((uint16_t)c) << 8);
}

// print a null-terminated string to the VGA text buffer
void vga_print(int x, int y, char* msg_data, uint8_t c) {
  volatile uint16_t* buff_addr = (volatile uint16_t*)VGA_TEXT_BUFFER + (y << 4) + (y << 6) + x;
  int i = 0;
  // assume string is NULL-terminated
  while (*(msg_data + i) != 0) {
    // set text data in lo byte, increment to next set of bytes
    *(buff_addr) = ((uint16_t)*(msg_data + i)) | (((uint16_t)c) << 8);

    // increment pointer to next wchar
    buff_addr++;
    
    // increment msg byte
    i++;
  }
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

// pretty much the same thing, but for buffers with a constant size known
void vga_print_buf(int x, int y, char* msg_data, uint8_t c, int size) {
  volatile uint16_t* buff_addr = (volatile uint16_t*)VGA_TEXT_BUFFER + (y << 4) + (y << 6) + x;
  int i = 0;
  // assume string is NULL-terminated
  while (i < size) {
    // set text data in lo byte, increment to next set of bytes
    *(buff_addr) = ((uint16_t)*(msg_data + i)) | (((uint16_t)c) << 8);

    // increment pointer to next wchar
    buff_addr++;
    
    // increment msg byte
    i++;
  }
}

void vga_draw_32bit_debug_str(int x, int y, int data) {
  volatile uint16_t* buff_addr = (volatile uint16_t*)VGA_TEXT_BUFFER + (y << 4) + (y << 6) + x;
  int i = 0;
  while (i < 32) {
    *(buff_addr) = (data & (1 << i)) ? 0x2a31 : 0x4c30;
    buff_addr++;
    i++;
  }
}

// prints data in white
void vga_print_plain(int x, int y, char* msg_data) {
  vga_print(x, y, msg_data, 0x0f);
}

void vga_print_plain_buf(int x, int y, char* msg_data, int size) {
  vga_print_buf(x, y, msg_data, 0x0f, size);
}

void draw_px(int x, int y, uint8_t c) {
 volatile uint8_t* addr = VGA_GRAPH_BUFFER + (y << 6) + (y << 8) + x;
  *(addr) = c; 
}

void set_text_buffer(uint16_t data) {
  int i = 0;
  while (i < VGA_TEXT_BUFFER_BYTE_SIZE) {
    // set text data
    *((volatile uint16_t*)(VGA_TEXT_BUFFER) + i) = data;
    i++;
  }
}

#endif