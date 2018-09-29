# 1 "text.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "text.c"
# 1 "myLib.h" 1




typedef unsigned short u16;
# 25 "myLib.h"
extern unsigned short *videoBuffer;
# 43 "myLib.h"
void setPixel(int row, int col, unsigned short color);
void drawRect(int row, int col, int height, int width, unsigned short color);
void fillScreen(unsigned short color);


void waitForVBlank();
# 68 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 79 "myLib.h"
int collision(int rowA, int colA, int heightA, int widthA, int rowB, int colB, int heightB, int widthB);
# 2 "text.c" 2
# 1 "text.h" 1

void drawChar(int, int, char, unsigned short);
void drawString(int, int, char *, unsigned short);
# 3 "text.c" 2
# 1 "font.h" 1

extern const unsigned char fontdata_6x8[12288];
# 4 "text.c" 2


void drawChar(int row, int col, char ch, unsigned short color) {

 int r,c;
 for(r = 0; r < 8; r++) {
  for(c = 0; c < 6; c++) {
   if(fontdata_6x8[((r)*(6)+(c)) + ch*48]) {
    setPixel(row+r, col+c, color);
   }
  }
 }
}


void drawString(int row, int col, char *str, unsigned short color) {

 while(*str) {
  drawChar(row, col, *str++, color);
  col += 6;
 }

}
