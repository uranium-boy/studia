#include <algorithm>
#include <iostream>
#include <list>
#include <string>
#include <unordered_set>
#include <vector>
#include "Citizen.h"
#include "City.h"

void losowanie();
void print(int num);

void the_most(std::vector<City> cities, int mode);
void statistic(std::vector<City> cities);
void sort(std::vector<City> cities);

int main() {
    City city("Khabarovsk");

    // Generating 10 dummy Citizen objects
    Citizen c1("Donald", "Tusk", "00-123", 78, 'M');
    Citizen c2("Janusz", "Korwin-Mikke", "12-345", 80, 'M');
    Citizen c3("Vladimir", "Putin", "99-999", 60, 'K');
    Citizen c4("Angela", "Merkel", "00-123", 65, 'K');
    Citizen c5("Barack", "Obama", "12-345", 62, 'M');
    Citizen c6("Elon", "Musk", "33-444", 50, 'M');
    Citizen c7("Greta", "Thunberg", "55-666", 21, 'K');
    Citizen c8("Adele", "Adkins", "88-777", 35, 'K');
    Citizen c9("Nicolas", "Cage", "99-888", 59, 'M');
    Citizen c10("Emma", "Watson", "00-123", 34, 'K');

    // Adding citizens to the city
    city.addCitizen(c1);
    city.addCitizen(c2);
    city.addCitizen(c3);
    city.addCitizen(c4);
    city.addCitizen(c5);
    city.addCitizen(c6);
    city.addCitizen(c7);
    city.addCitizen(c8);
    city.addCitizen(c9);
    city.addCitizen(c10);

    city.showCitizens();
    std::cout << "Liczba kobiet: " << city.women() << std::endl;
    std::cout << "Liczba doroslych: " << city.adults() << std::endl;

    city.postalCodes();
    
//    city.showCitizens();
//    city.deleteCitizen("Janusz", 80);
//    city.showCitizens();
    return 0;
}

void losowanie() {
    srand(static_cast<unsigned int>(time(nullptr)));

    std::list<int> list;
    int n = rand() % 100;
    for (int i = 0; i < n; i++) {
        int num  = rand() % 200 - 100;
        if (num >= 0) {
            list.push_front(num);
        } else {
            list.push_back(num);
        }
    }

    std::cout << "Dlugosc listy: " << n << std::endl;

    // std::list<int>::iterator begin = list.begin();
    // std::list<int>::iterator end = list.end();

    std::list<int>::iterator it;
    std::cout << "printowanie listy za pomoca iteratorow" << std::endl;
    for (it = list.begin(); it != list.end(); ++it) {
        std::cout << *it << std::endl;
    }

    std::cout << "petla wyliczeniowa" << std::endl;
    std::for_each(list.begin(), list.end(), print);

    std::cout << "petla for z typem auto" << std::endl;
    for (auto it = list.begin(); it != list.end(); ++it) {
        std::cout << *it << std::endl;
    }
}

void print(int num) {
    std::cout << num << std::endl;
}


void the_most(std::vector<City> cities, int mode) {
    switch (mode) {
        case 1: {
            std::string cityName;
            int uniqueCodesNumber = 0;
            for (auto city : cities) {
                std::unordered_set<std::string> uniqueCodes;
                for (auto citizen : city.getCitizenList()) {
                    uniqueCodes.insert(citizen.getPostalCode());
                }
                int codesNumber = uniqueCodes.size();
                std::cout << "Miasto " << city.getCityName() << ": " << codesNumber << "unikalnych kodow pocztowych" << std::endl;
                if (codesNumber > uniqueCodesNumber) {
                    cityName = city.getCityName();
                    uniqueCodesNumber = codesNumber;
                }
            }
            std::cout << "Miasto z najwieksza iloscia kodow pocztowtch: " << cityName << "(" << uniqueCodesNumber << ")" << std::endl;
            }
            break;
    }
}
