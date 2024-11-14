/*
 * lab4.c
 *
 * Created: 08.11.2024 13:56:09
 * Author : Student_PL
 */ 

#define F_CPU 8000000

#include <avr/io.h>
#include <util/delay.h>

#define LCD_PORT PORTA
#define RS (1 << PA5)
#define E (1 << PA4)
#define D4 (1 << PA0)
#define D5 (1 << PA1)
#define D6 (1 << PA2)
#define D7 (1 << PA3)



void lcdSendMSB(char byte) {
	LCD_PORT |= E;
	asm("nop");
	LCD_PORT = (byte & 0xF0) | (LCD_PORT & 0x0F);
	asm("nop");
	LCD_PORT &= ~E;
	_delay_us(40);
}

void lcdSendByte(char byte) {
	lcdSendMSB(byte);
	LCD_PORT |= E;
	asm("nop");
	LCD_PORT = ((byte & 0x0F) << 4) | (LCD_PORT & 0x0F);
	asm("nop");
	LCD_PORT &= ~E;
	_delay_us(40);
}
 
void lcdSendInstruction(char byte) {
	LCD_PORT &= ~RS;
	lcdSendByte(byte);
	LCD_PORT |= RS;
}
  
void lcdInit() {
	LCD_PORT &= ~RS;
	
	lcdSendByte(0x20);
	_delay_us(100);
	lcdSendByte(0x20);
	_delay_us(100);
	lcdSendByte(0b00101100);
	lcdSendByte(0x01);
	lcdSendByte(0b00001111);
	lcdSendByte(
	LCD_PORT |= RS;
}

int main(void)
{
	lcdInit();
    /* Replace with your application code */
    while (1) 
    {
    }
}

