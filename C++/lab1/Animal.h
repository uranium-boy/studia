#include <iostream>

#pragma once
class Animal
{
private:
	int limbNr;
	std::string name;
	bool protectedAnimal;
public:
	Animal();
	Animal(int limbNr, std::string name, bool protectedAnimal = true);
	void setLimbNr(int LimbNr);
	void setName(std::string name);
	void setProtectedAnimal(bool protectedAnimal);
	int getLimbNr();
	std::string getName();
	bool getProtectedAnimal();
	void giveVoice();
	void info();
};

