#include "Contact.h"
#include <iostream>
#include <string>

Contact::Contact(std::string firstname, std::string lastname, std::string number, std::string street, int age) {
    this->firstName = firstname;
    this->lastName = lastname;
    this->number = number;
    this->street = street;
    this->age = age;
}

void Contact::show() const {
    std::cout << "Imie: " << this->firstName
              << ", Nazwisko: " << this->lastName
              << ", Numer: " << this->number
              << ", Ulica: " << this->street
              << ", Wiek: " << this->age << std::endl;
}
