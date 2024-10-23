#include <iostream>
#include "Developer.h"
#include "TeamLeader.h"

void whoWorkMoreThan5Years(Employee** arr);
void howManyEarnLessThanMeanBonus(Employee** arr);

int main()
{
	Employee* arr[10];

	for (int i = 0; i < 10; i++) {
		arr[i] = new Developer("Kowalski", 30 + i, 10 + i, 3000 * i);
	}

	whoWorkMoreThan5Years(arr);
}

void whoWorkMoreThan5Years(Employee** arr)
{
	int length = sizeof(**arr) / sizeof(arr[0]);

	for (int i = 0; i < length; i++) {
		if (arr[i]->getExperience() > 5) {
			arr[i]->show();
		}
	}
}
void howManyEarnLessThanMeanBonus(Employee** array)
{

}
