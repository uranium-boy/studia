//
// Created by haenim on 10/28/24.
//

#ifndef CITIZEN_H
#define CITIZEN_H
#include <string>

class Citizen {
private:
    std::string name;
    std::string surname;
    std::string postal_code;
    int age;
    char sex;

public:
    Citizen();
    Citizen(std::string name, std::string surname, std::string postal_code, int age, char sex);
    void show();
    std::string getName();
    int getAge();
    char getSex();
    std::string getPostalCode();
};

#endif //CITIZEN_H
