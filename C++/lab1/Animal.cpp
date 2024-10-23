#include <iostream>
#include "Animal.h"


Animal::Animal()
{
	std::cout << "Name: ";
	std::cin >> name;

	std::cout << "Limb number: ";
	std::cin >> limbNr;

	std::cout << "Is protected: ";
	std::cin >> protectedAnimal;
}
Animal::Animal(int limbNr, std::string name, bool protectedAnimal)
{
	this->limbNr = limbNr;
	this->name = name;
	this->protectedAnimal = protectedAnimal;
}
void Animal::setLimbNr(int LimbNr)
{
	this->limbNr = LimbNr;
}
void Animal::setName(std::string name)
{
	this->name = name;
}
void Animal::setProtectedAnimal(bool protectedAnimal)
{
	this->protectedAnimal = protectedAnimal;
}
int Animal::getLimbNr()
{
	return limbNr;
}
std::string Animal::getName()
{
	return name;
}
bool Animal::getProtectedAnimal()
{
	return protectedAnimal;
}
void Animal::giveVoice()
{
	std::cout << "Chrum, miau, hau, piiii\n";
}
void Animal::info()
{
	std::cout << "Name: " << name << "\nLimb number: " << limbNr << "\nIs protected: " << protectedAnimal << "\n";
}
