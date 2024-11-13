//
// Created by haenim on 10/28/24.
//

#include "City.h"
#include "Citizen.h"
#include <algorithm>
#include <cstdio>
#include <iostream>
#include <list>
#include <string>
#include <vector>

City::City(std::string cityName) {
    this->cityName = cityName;
}

void City::addCitizen(Citizen citizen) {
    citizens.push_back(citizen);
}

void City::deleteCitizen(std::string name, int age) {
    auto it = std::find_if(citizens.begin(), citizens.end(), [&](Citizen c) {
        return c.getName() == name && c.getAge() == age;
    });

    if (it != citizens.end()) {
        citizens.erase(it);
    } else {
        std::cout << "Nie znaleziono osobnika!" << std::endl;
    }
}

void City::showCitizens() {
    std::cout << "Lista mieszkancow:" << std::endl;
    for (auto it = citizens.begin(); it != citizens.end(); ++it) {
        it->show();
        printf("\n");
    }
}

void City::showCityInfo() {
    std::cout << "Nazwa miasta: " << cityName << std::endl;
}

int City::women() {
    return std::count_if(citizens.begin(), citizens.end(), [](Citizen c) {
        return c.getSex() == 'K';
    });
}
int City::citizensNumber() {
    return citizens.size();
}
int City::adults() {
    return std::count_if(citizens.begin(), citizens.end(), [](Citizen c) {
        return c.getAge() >= 18;
    });
}
// better way:
// void City::postalCodes() {
//     std::unordered_map<std::string, int> postalCodes;
//     
//     std::for_each(citizens.begin(), citizens.end(), [&postalCodes](Citizen c) {
//         std::string code = c.getPostalCode();
//         postalCodes[code]++;
//     });
// 
//     for (auto entry : postalCodes) {
//         std::cout << "Kod: " << entry.first << ", liczba mieszkancow: " << entry.second << std::endl;
//     }
// }


// worse way:
void City::postalCodes() {
    std::list<PostalCode> postalCodes;

    for (auto citizen : citizens) {
        auto it = std::find_if(postalCodes.begin(), postalCodes.end(), [&citizen](PostalCode pc) {
            return pc.getCode() == citizen.getPostalCode();
        });

        if (it != postalCodes.end()) {
            it->increment();
        } else {
            postalCodes.push_back(PostalCode(citizen.getPostalCode()));
        }
    }

    for (auto pc : postalCodes) {
        pc.show();
    }
}

std::vector<Citizen> City::getCitizenList() {
    return citizens;
}

std::string City::getCityName() {
    return cityName;
}
