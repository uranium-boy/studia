#include <iostream>
#include "Dog.h"
#include "Animal.h"

Dog::Dog(int limbNr, std::string name, bool protectedAnimal, std::string breed, int levelOfGuideSkills, int levelOfTrackerSkills)
{
	setLimbNr(limbNr);
	setName(name);
	setProtectedAnimal(protectedAnimal);
	this->breed = breed;
	this->levelOfGuideSkills = levelOfGuideSkills;
	this->levelOfTrackerSkills = levelOfTrackerSkills;
}

Dog::Dog(int limbNr, std::string name, bool protectedAnimal) : Animal(limbNr, name, protectedAnimal)
{
	std::cout << "Dog class member variables are unitialized\n";
}

Dog::Dog()
{
	std::cout << "Do nothing\n";
}

void Dog::setSkillLevel(int type, int value)
{
	switch (type)
	{
	case ID_GUIDE:
		levelOfGuideSkills = value;
		break;
	case ID_TRACK:
		levelOfTrackerSkills = value;
		break;
	default:
		std::cout << "Incorrect value.\n";
	}
}

int Dog::getSkillLevel(int type)
{
	switch (type)
	{
	case ID_GUIDE:
		return levelOfGuideSkills;
		break;
	case ID_TRACK:
		return levelOfTrackerSkills;
		break;
	default:
		std::cout << "Incorrect value.\n";

	}
}

void Dog::giveVoice()
{
	std::cout << "Hau, hau\n";
}

void Dog::info()
{
	Animal::info();
	std::cout << "Breed: " << breed << "\nLevel of Guidance skills: " << levelOfGuideSkills << "\nLevel of tracking skills: " << levelOfTrackerSkills << std::endl;
}
