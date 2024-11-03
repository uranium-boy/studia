//
// Created by haenim on 10/28/24.
//
#include <iostream>
#include <string>
#include "Citizen.h"

Citizen::Citizen(std::string name, std::string surname, std::string postal_code, int age, char sex) {
    this->name = name;
    this->surname = surname;
    this->postal_code = postal_code;
    this->age = age;
    this->sex = sex;
}

void Citizen::show() {
    std::cout << "Name: " << name << std::endl;
    std::cout << "Surname: " << surname << std::endl;
    std::cout << "Age: " << age << std::endl;
    std::cout << "Sex: " << sex << std::endl;
    std::cout << "Postal code: " << postal_code << std::endl;
}

std::string Citizen::getName() {
    return name;
}

int Citizen::getAge() {
    return age;
}

char Citizen::getSex() {
    return sex;
}

std::string Citizen::getPostalCode() {
    return postal_code;
}
