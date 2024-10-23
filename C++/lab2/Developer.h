#pragma once
#include "Employee.h"
class Developer :
    public Employee
{
public:
    Developer() {};
    Developer(std::string name, int age, int experience, float salary) : Employee::Employee(name, age, experience, salary) {};
    float calculateBonus(int value);
    int calculateSalary(int value) override;
    void show() override;
};

