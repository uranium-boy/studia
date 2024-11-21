#define F_CPU 1000000

#include <avr/io.h>
#include <avr/interrupt.h>
#include <util/delay.h>

#define BAUD 2400
#define UBRR ((F_CPU / (BAUD * 16UL)) - 1)
#define BUFFER_SIZE 32

char buf[BUFFER_SIZE];
volatile uint8_t buf_index = 0;

void USART_init() {
	// set baud rate
	UBRRH = (unsigned char) (UBRR >> 8);	// not necessary in our case
	UBRRL = (unsigned char) UBRR;
	
	// enable receiver and transmitter, enable RX Complete Interrupt
	UCSRB |= (1 << RXCIE) | (1 << RXEN) | (1 << TXEN);
	
	// set frame format: 8bit data, 1bit stop, no parity
	// ! URSEL must be one when writing the UCSRC !
	UCSRC |= (1 << URSEL) |(1 << UCSZ1) | (1 << UCSZ0);
}

void USART_transmit_byte(unsigned char byte) {
	while (!(UCSRA & (1 << UDRE)));
	
	UDR = byte;
}

unsigned char USART_receive() {
	while (!(UCSRA & (1 << RXC)));
	
	return UDR;
}

void USART_transmit_text(const char* text) {
	while (*text != '\0') {
		USART_transmit_byte(*text);
		text++;
	}
	USART_transmit_byte('\r');
	USART_transmit_byte('\n');
}

ISR (USART_RXC_vect) {
	char data = USART_receive();
	
	if (data == '\r') {
		buf[buf_index] = '\0';
		USART_transmit_text(buf);
		USART_transmit_text("PS: Jebac Lacha!");
		buf_index = 0;
	} else if (buf_index < BUFFER_SIZE - 1) {
		buf[buf_index] = data;
		buf_index++;
	} else {
		buf_index = 0;
	}
}

int main(void)
{
	char text[] = "Enter instruction:";
	
	USART_init();
	USART_transmit_text(text);
	sei();

    while (1) 
    {
		asm("nop");
    }
}

