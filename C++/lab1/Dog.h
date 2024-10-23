#pragma once
#include <iostream>
#include "Animal.h"

#define ID_GUIDE 0
#define ID_TRACK 1

class Dog : public Animal
{
private:
	std::string breed;
	int levelOfGuideSkills;
	int levelOfTrackerSkills;
public:
	Dog(int limbNr, std::string name, bool protectedAnimal ,std::string breed, int levelOfGuideSkills, int levelOfTrackerSkills);
	Dog(int limbNr, std::string name, bool protectedAnimal);
	Dog();
	void setSkillLevel(int type, int value);
	int getSkillLevel(int type);
	void giveVoice();
	void info();
};

