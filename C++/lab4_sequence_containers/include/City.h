//
// Created by haenim on 10/28/24.
//

#ifndef CITY_H
#define CITY_H

#include <iostream>
#include <vector>

#include "Citizen.h"

class City {
private:
    std::vector<Citizen> citizens;
    std::string cityName;
public:
    City(std::string cityName);
    void addCitizen(Citizen citizen);
    void deleteCitizen(std::string name, int age);
    void showCitizens();
    void showCityInfo();
    int women();
    int citizensNumber();
    int adults();
    void postalCodes();
    std::vector<Citizen> getCitizenList();
    std::string getCityName();
};

class PostalCode {
private:
    std::string code;
    int count;
public:
    PostalCode(std::string code) {
        this->code = code;
        count = 1;
    }
    std::string getCode() {return code;};
    int getCount() {return count;};
    void increment() {count++;};
    void show() {
        std::cout <<"Kod: " << code << ", liczba mieszkancow: " << count << std::endl;
    }
};

#endif //CITY_H
