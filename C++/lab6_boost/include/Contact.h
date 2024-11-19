#include <string>
class Contact {
public:
    std::string firstName;
    std::string lastName;
    std::string number;
    std::string street;
    int age;

public:
    Contact(std::string firstName, std::string lastName, std::string number, std::string street, int age);
};
