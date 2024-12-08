#include "GrupaDziekanska.h"
#include <iostream>
#include <string>

void GrupaDziekanska::wyswietlGrupe() {
    for (const auto& [indeks, adresy] : grupa) {
        std::cout << "Indeks: " << indeks << ", adresy e-mail: ";

        for (const auto& adres : adresy) {
            std::cout << adres << "; ";
        } 
        std::cout << std::endl;
    }
    // alternatywnie z uzyciem iteratorow:
/*    for (auto it = grupa.begin(); it != grupa.end(); ++it) {
        std::cout << "Indeks: " << it->first << ", adresy e-mail: ";

        for (auto mails = it->second.begin(); mails != it->second.end(); ++mails) {
            std::cout << *mails << "; ";
        }
        std::cout << std::endl;
    }*/
}

void GrupaDziekanska::findKlucz(const std::string& key) {
    auto itIndeks = this->grupa.find(key);

    if (itIndeks == grupa.end()) {
        std::cout << "Nie znaleziono podanego indeksu: " << key << std::endl;
        return;
    }

    std::cout << "Indeks: " << itIndeks->first << ", adresy e-mail: ";

    for (auto itMail = itIndeks->second.begin(); itMail != itIndeks->second.end(); ++itMail) {
        std::cout << *itMail << "; ";
    }
    std::cout << std::endl;
}

void GrupaDziekanska::szukajWartosc(const std::string& value) {
    for (const auto& [indeks, emails] : grupa) {
        auto itMail = emails.find(value);
        if (itMail != emails.end()) {
            std::cout << "Indeks: " << indeks << ", adresy e-mail: ";

            for (const auto& email : emails) {
                std::cout << email << "; ";
            }
            std::cout << std::endl;
            return;
        }
    }
    std::cout << "Nie znaleziono podanego adresu: " << value << std::endl;
}

void GrupaDziekanska::insert(const std::pair<std::string, std::set<std::string>>& value) {
    this->grupa.insert(value);
}
