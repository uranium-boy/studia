#include "Employee.h"
#include <iostream>

Employee::Employee(std::string surname, int age, int experience, float salary)
{
	this->surname = surname;
	this->age = age;
	this->experience = experience;
	this->salary = salary;
}

void Employee::show()
{
	std::cout << "Surname: " << surname << "\nAge: " << age << "\nExperience: " << experience << "\nSalary: " << salary << std::endl;
}

int Employee::ageEmployment()
{
	return age - experience;
}

std::string Employee::getSurname()
{
	return surname;
}

int Employee::getAge()
{
	return age;
}

int Employee::getExperience()
{
	return experience;
}

float Employee::getSalary()
{
	return salary;
}
