/*
 * lab2.c
 *
 * Created: 11.10.2024 12:30:29
 * Author : Student_PL
 */

#include <avr/io.h>

#define F_CPU 4000000
#include <util/delay.h>

#define ID_PORTA 0
#define ID_PORTB 1
#define ID_PORTC 2
#define ID_PORTD 3
#define INPUT 0
#define OUTPUT 1

void PORT_Data_Direction(uint8_t port, uint8_t lineNumber, uint8_t state)
{
	switch (port)
	{
		case ID_PORTA:
			if (state) {
				DDRA |= 1 << lineNumber;
			}
			else {
				DDRA &= ~(1 << lineNumber);
			}
			break;
		case ID_PORTB:
			if (state)	{
				DDRB |= 1 << lineNumber;
			}
			else {
				DDRB &= ~(1 << lineNumber);
			}
			break;
		case ID_PORTC:
			if (state) {
				DDRC |= 1 << lineNumber;
			}
			else {
				DDRC &= ~(1 << lineNumber);
			}
			break;
		case ID_PORTD:
			if (state) {
				DDRD |= 1 << lineNumber;
			}
			else {
				DDRD &= ~(1 << lineNumber);
			}
			break;
	}
}
void Pullup_enable(uint8_t port, uint8_t lineNumber)
{
	switch (port)
	{
		case ID_PORTA:
			if ((DDRA & (1 << lineNumber)) == 0) {
				PORTA |= (1 << lineNumber);
			}
			break;
		case ID_PORTB:
			if ((DDRB & (1 << lineNumber)) == 0) {
				PORTB |= (1 << lineNumber);
			}
			break;
		case ID_PORTC:
			if ((DDRC & (1 << lineNumber)) == 0) {
				PORTC |= (1 << lineNumber);
			}
			break;
		case ID_PORTD:
			if ((DDRD & (1 << lineNumber)) == 0) {
				PORTD |= (1 << lineNumber);
			}
			break;
	}
}
void OUTPUT_SET(uint8_t port, uint8_t lineNumber)
{
	switch (port)
	{
		case ID_PORTA:
			if (DDRA & (1 << lineNumber)) {
				PORTA |= (1 << lineNumber);
			}
			break;
		case ID_PORTB:
			if (DDRB & (1 << lineNumber)) {
				PORTB |= (1 << lineNumber);
			}
			break;
		case ID_PORTC:
			if (DDRC & (1 << lineNumber)) {
				PORTC |= (1 << lineNumber);
			}
			break;
		case ID_PORTD:
			if (DDRD & (1 << lineNumber)) {
				PORTD |= (1 << lineNumber);
			}
			break;
	}
}
void OUTPUT_CLR(uint8_t port, uint8_t lineNumber)
{
	switch (port)
	{
		case ID_PORTA:
			if (DDRA & (1 << lineNumber)) {
				PORTA &= ~(1 << lineNumber);
			}
			break;
		case ID_PORTB:
			if (DDRB & (1 << lineNumber)) {
				PORTB &= ~(1 << lineNumber);
			}
			break;
		case ID_PORTC:
			if (DDRC & (1 << lineNumber)) {
				PORTC &= ~(1 << lineNumber);
			}
			break;
		case ID_PORTD:
			if (DDRD & (1 << lineNumber)) {
				PORTD &= ~(1 << lineNumber);
			}
			break;
	}
}
void OUTPUT_TOGGLE(uint8_t port, uint8_t lineNumber)
{
		switch (port)
	{
		case ID_PORTA:
			if (DDRA & (1 << lineNumber)) {
				PORTA ^= (1 << lineNumber);
			}
			break;
		case ID_PORTB:
			if (DDRB & (1 << lineNumber)) {
				PORTB ^= (1 << lineNumber);
			}
			break;
		case ID_PORTC:
			if (DDRC & (1 << lineNumber)) {
				PORTC ^= (1 << lineNumber);
			}
			break;
		case ID_PORTD:
			if (DDRD & (1 << lineNumber)) {
				PORTD &= ~(1 << lineNumber);
			}
			break;
	}
}
unsigned int SW_READ(uint8_t port, uint8_t lineNumber)
{
	switch (port)
	{
		case ID_PORTA:
			if (PINA & (1 << lineNumber)) {
				return 1;
			}
			else {
				return 0;
			}
			break;
		case ID_PORTB:
			if (PINB & (1 << lineNumber)) {
				return 1;
			}
			else {
				return 0;
			}
			break;
		case ID_PORTC:
			if (PINC & (1 << lineNumber)) {
				return 1;
			}
			else {
				return 0;
			}
			break;
		case ID_PORTD:
			if (PIND & (1 << lineNumber)) {
				return 1;
			}
			else {
				return 0;
			}
			break;
	}
	return 0;
}

int main(void)
{
//	PORT_Data_Direction(ID_PORTA);
    /* Replace with your application code */
	PORT_Data_Direction(ID_PORTA, 4, INPUT);
	PORT_Data_Direction(ID_PORTA, 5, INPUT);
	PORT_Data_Direction(ID_PORTA, 6, INPUT);

	Pullup_enable(ID_PORTA, 4);
	Pullup_enable(ID_PORTA, 5);
	Pullup_enable(ID_PORTA, 6);

	PORT_Data_Direction(ID_PORTA, 7, OUTPUT);

	OUTPUT_SET(ID_PORTA, 7);
	_delay_ms(500);
	OUTPUT_CLR(ID_PORTA, 7);
	_delay_ms(500);

    while (1)
    {
		if ((SW_READ(ID_PORTA, 4)) == 0) {
			OUTPUT_CLR(ID_PORTA, 7);
		}
		else if ((SW_READ(ID_PORTA, 5)) == 0) {
			OUTPUT_SET(ID_PORTA, 7);
		}
		else if ((SW_READ(ID_PORTA, 6)) == 0) {
			// debouncing do poprawy
			_delay_ms(10);
			if ((SW_READ(ID_PORTA, 6)) == 0) {
				OUTPUT_TOGGLE(ID_PORTA, 7);
			}
		}
		_delay_ms(200);
    }
}

