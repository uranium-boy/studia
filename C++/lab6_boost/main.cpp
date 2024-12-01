#include <iostream>
#include "Contacts.h"

int main() {
    std::cout << "Goodbye, World!" << std::endl;

    Contacts contacts;

    contacts.addContact({"Deez", "Nuts", "123456789", "Street 1", 30});
    contacts.addContact({"Ligma", "Balls", "987654321", "Street 2", 40});
    contacts.addContact({"Sigma", "Lublin", "694202137", "Street 1", 20});

    contacts.showAll();

    std::cout << "Kontakty Street 1:\n";
    contacts.showbyStreet("Street 1");

    std::cout << "Kontakt do usunięcia:\n";
    contacts.deleteContact("123456789");

    contacts.showAll();

    return 0;
}
