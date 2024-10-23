#include "Developer.h"
#include <iostream>

float Developer::calculateBonus(int value)
{
	return value = 0.2 * (getSalary() + getExperience());
}

int Developer::calculateSalary(int value)
{
	return (int)getSalary() * value;
}

void Developer::show()
{
	Employee::show();
}
