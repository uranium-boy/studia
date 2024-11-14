/*
 * lab3.c
 *
 * Created: 25.10.2024 12:49:14
 * Author : Student_PL
 */

#include <avr/io.h>
#include <avr/interrupt.h>

// 1. LED miga co jedna sekunde	--> PA0
// TIMER 1 prescaler 64 OCR0 15625
// 2. LED zaswiecony gasnie po przycisnieciu SW1 10 razy --> PA1
// TIMER 0 CTC
// 3. INT0 gasi diode, INT1 zapala diode   --> PA3

ISR(TIMER1_COMPA_vect) {
	PORTA ^= 0x01;
}
ISR(TIMER0_COMP_vect) {
	PORTA &= ~(0x02);
}
ISR(INT0_vect) {
	PORTA &= ~(1 << PA3);
}
ISR(INT1_vect) {
	PORTA |=  (1 << PA3);
}


int main(void)
{
	// PB0 = input (DDB = 0, PORTB = 1 pull up)
	PORTB |= (1 << PB0);
	// PA0, PA1 output
	DDRA |= (1 << PA0) | (1 << PA1) | (1 << PA3);
	// zapal diode PA1
	PORTA |= (1 << PA1);
	// INT0 INT1
	PORTD |= (1 << PD2) | (1 << PD3);
	// interrupt on falling edge
	MCUCR |= (1 << ISC01) | (1 << ISC11);
	GICR |= (1 << INT1) | (1 << INT0);
	// TIMER 1
	// MAX timer value
    OCR1A = 15625;
	// presclarer 64
	TCCR1B |= ((1 << CS11) | (1 << CS10));
	// CTC, toggle OC1A on compare
	TCCR1B |= (1 << WGM12);


	// TIMER 0
	OCR0 = 10;
	// CTC + clock on falling edge
	TCCR0 |=  (1 << WGM01) | (1 << CS02) | (1 << CS01);

	// enable interrupt
	TIMSK |= (1 << OCIE1A) | (1 << OCIE0);

	// global interrupt enable
	sei();
    while (1)
    {
		asm("nop");
    }
}

