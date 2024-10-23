#pragma once
#include <iostream>
class Employee
{
private:
	std::string surname;
	int age;
	int experience;
	float salary;
public:
	Employee() {};
	Employee(std::string surname, int age, int experience, float salary);
	virtual ~Employee() {};

	virtual void show();
	virtual	int calculateSalary(int value) = 0;
	int ageEmployment();
	
	std::string getSurname();
	int getAge();
	int getExperience();
	float getSalary();
};

