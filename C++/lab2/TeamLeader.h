#pragma once
#include "Employee.h"
class TeamLeader :
    public Employee
{
public:
    TeamLeader() {};
    TeamLeader(std::string name, int age, int experience, float salary) : Employee::Employee(name, age, experience, salary) {};
    float calculateBonus(int value);
    void show() override;
};

