#include "Contacts.h"
#include <iostream>
#include <set>
#include <string>

void Contacts::addContact(const Contact& contact) {
    contactList.insert(contact);
}

void Contacts::showAll() {
    for (auto it = contactList.begin(); it != contactList.end(); ++it) {
        it->show();
    }
}

void Contacts::deleteContact(std::string number) {
    auto& index_number = contactList.get<0>();
    auto it = contactList.get<0>().find(number);

    if (it != index_number.end()) {
        std::cout << "Deleted contact:" << std::endl;
        it->show();
        index_number.erase(it);
    } else {
        std::cout << "Contact not found" << std::endl;
    }

}

void Contacts::showbyStreet(std::string street) {
    auto& street_index = contactList.get<3>();
    auto range = street_index.equal_range(street);

    for (auto it = range.first; it != range.second; ++it) {
        it->show();
    }
}

void Contacts::showByAge(int min, int max) {
    auto& index_age = contactList.get<4>();
    auto start = index_age.equal_range(min);    // a field need to be of type ordered_non_unique to use lower_bound and upper_bound functions
    auto stop = index_age.equal_range(max);

    for (auto it = start.first; it != stop.second; ++it) {
        it->show();
    }
}

void Contacts::findByNumber(std::string number) {
    auto& index_number = contactList.get<0>();
    auto it = index_number.find(number);

    if (it != index_number.end()) {
        it->show();
    } else {
        std::cout << "Number not found" << std::endl;
    }
}

void Contacts::countAdults() {
    auto& index_number = contactList.get<4>();
    auto start = index_number.find(18);
    int count = 0;

    for (auto it = start; it != index_number.end(); ++it) {
        count++;
    }

    std::cout << "Number of adults (>= 18): " << count << std::endl;
}

void Contacts::countUniqueLastNames() const {
    std::set<std::string> uniqueLastNames;
    auto& index_lastname = contactList.get<2>();

    for (const auto& contact : index_lastname) {
        uniqueLastNames.insert(contact.lastName);
    }

    std::cout << "Unique last names: " << uniqueLastNames.size() << std::endl;
}
