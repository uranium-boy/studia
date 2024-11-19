#include "Contact.h"
#include <string>

Contact::Contact(std::string firstname, std::string lastname, std::string number, std::string street, int age) {
    this->firstName = firstname;
    this->lastName = lastname;
    this->number = number;
    this->street = street;
    this->age = age;
}
