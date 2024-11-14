#define F_CPU 1000000

#include <avr/io.h>
#include <util/delay.h>

#define LCD_PORT PORTA
#define RS (1 << PA0)
#define E (1 << PA1)
#define D4 (1 << PA4)
#define D5 (1 << PA5)
#define D6 (1 << PA6)
#define D7 (1 << PA7)


void send4MSB(uint8_t byte) {
	LCD_PORT |= E;			// (E)nable transmission mode
	asm volatile("nop");
	LCD_PORT = (byte & 0xF0) | (LCD_PORT & 0x0F);
	asm volatile("nop");
	LCD_PORT &= ~E;
	_delay_us(40);
}

void sendByte(uint8_t byte) {
	// send upper half
	LCD_PORT |= E;			// (E)nable transmission mode
	asm volatile("nop");
	LCD_PORT = (byte & 0xF0) | (LCD_PORT & 0x0F);
	asm volatile("nop");
	LCD_PORT &= ~E;
	_delay_us(40);
	
	// send lower half
	LCD_PORT |= E;
	asm volatile("nop");
	LCD_PORT = ((byte & 0x0F) << 4) | (LCD_PORT & 0x0F);
	asm volatile("nop");
	LCD_PORT &= ~E;
	_delay_us(40);
}

void lcdInit() {
	DDRA = 0xFF;			// set PORTA for output
	LCD_PORT &= ~RS;		// instruction mode
	
	send4MSB(0b00100000);	// 4-bit mode
	_delay_ms(2);
	sendByte(0b00101000);	// 4-bit, 2 lines, 5x7 dots
	_delay_ms(2);
	sendByte(0b00000001);	// clear display
	_delay_ms(2);
//	sendByte(0b00000010);
//	_delay_ms(2);
	sendByte(0b00001100);	// display on, cursor off, blink off
	
	LCD_PORT |= RS;			// return to data mode
}

void sendInstruction(uint8_t byte) {
	LCD_PORT &= ~RS;		// enter instruction mode
	sendByte(byte);			// send instruction
	LCD_PORT |= RS;			// exit instruction mode
}

void printText(char* text) {
	sendInstruction(0b00000110);	// move cursor to the right
	while (*text != '\0') {
		sendByte(*text);
		text++;
		_delay_ms(5);
	}
}

int main(void)
{
	lcdInit();
	_delay_ms(10);
	printText("Jebac Lacha");
	_delay_ms(10);
	sendInstruction(0b10000000 + 0x40);	// jump DDRAM address to next line (0x40)
	_delay_ms(2);
	printText("LACHOCIONG");
    while (1) 
    {
		asm("nop");
    }
}

