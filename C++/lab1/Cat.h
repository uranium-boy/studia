#pragma once

#include <iostream>
#include "Animal.h"
class Cat :
    private Animal
{
private:
    int levelOfMouseHunting;
    int mice[5];
public:
    Cat(int limbNr, std::string name, bool protectedAnimal) : Animal(limbNr, name, protectedAnimal) {}
    Cat();
    void initMice(int mice[]);
};

