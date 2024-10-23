#include <iostream>
#include "Employee.h"
#include "TeamLeader.h"

float TeamLeader::calculateBonus(int value)
{
	return value * (1 + getSalary() + getExperience());
}

void TeamLeader::show()
{
	Employee::show();
	std::cout << "Jestem Team Leaderem z " << Employee::getExperience() << " letnim doœwiadczeniem.\n";
}
