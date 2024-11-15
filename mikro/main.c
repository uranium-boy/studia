#define F_CPU 1000000

#include <avr/io.h>
#include <util/delay.h>

#define LCD_PORT PORTC
#define RS (1 << PC0)
#define E (1 << PC1)
#define D4 (1 << PC4)
#define D5 (1 << PC5)
#define D6 (1 << PC6)
#define D7 (1 << PC7)

volatile uint8_t previousKey = 0;

const char translation[] = {
	'0',
	'1',
	'2',
	'3',
	'4',
	'5',
	'6',
	'7',
	'8',
	'9',
	'A',
	'B',
	'C',
	'D',
	'E',
	'F'
};


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

void LCD_clear() {
	sendByte(0x01);
	_delay_ms(2);
}

void lcdInit() {
	DDRC = 0xFF;			// set PORTA for output
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

void readKeypad() {
	uint8_t pind = PIND & 0x0F;
	if (pind == 0x0F) {
		return;
	}
	
	// switch port directions
	DDRD = 0x0F;
	PORTD = 0xF0;
	_delay_us(1);
	pind |= PIND & 0xF0;
	
	// return to normal operation
	DDRD = 0xF0;
	PORTD = 0x0F;
	
	uint8_t result = 0;
	
	// read rows
	switch (pind & 0x0F) {
		case 0b00001101:
			result += 4;
			break;
		case 0b00001011:
			result += 8;
			break;
		case 0b00000111:
			result += 12;
			break;
	}
	
	switch (pind & 0xF0) {
		case 0b11010000:
			result += 1;
			break;
		case 0b10110000:
			result += 2;
			break;
		case 0b01110000:
			result += 3;
			break;
	}
	
	if (result != previousKey) {
		char x = translation[result];
		sendByte(x);
		previousKey = result;
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
//	printText("LACHOCIONG");
	
	// PD0 - PD3 rows
	// PD4 - PD7 cols
	DDRD = 0xF0;		// rows - input
	PORTD = 0x0F;		// pullup, columns to ground
	
    while (1) 
    {
		readKeypad();
		_delay_ms(100);
    }
}

