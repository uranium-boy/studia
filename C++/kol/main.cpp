#include <iostream>
#include <string>
#include "GrupaDziekanska.h"
#include "Bazowa.h"
#include "Pochodna.h"

template <typename T>
void showConvertingFromGrams(int divider, T value) {
    std::cout << "Dla podanego typu brak specjalizacji" << std::endl;
}

template <>
void showConvertingFromGrams<int>(int divider, int value) {
    std::string unit;
    switch (divider) {
        case 100:
            unit = "dag";
            break;
        case 1000:
            unit = "kg";
            break;
        default:
            std::cout << "Nieprawidlowa wartosc dzielnika" << std::endl;
            return;
    }
    float result = (float)value / (float)divider;

    std::cout << value << "g = " << result << unit << std::endl;
}

template <>
void showConvertingFromGrams<float>(int divider, float value) {
    std::string unit;
    switch (divider) {
        case 100:
            unit = "dag";
            break;
        case 1000:
            unit = "kg";
            break;
        default:
            std::cout << "Nieprawidlowa wartosc dzielnika" << std::endl;
            return;
    }
    float result = value / (float)divider;

    std::cout << value << "g = " << result << unit << std::endl;
}

void grupa() {
    GrupaDziekanska *grupa1 = new GrupaDziekanska;
    grupa1->insert({"1100", {"anna.nowak@gmail.com", "s99999@pollub.edu.pl"}});
    grupa1->insert({"1101", {"s54321@pollub.edu.pl"}});
    grupa1->insert({"1001", {"s12345@pollub.edu.pl"}});
    grupa1->insert({"1002", {"s55555@pollub.edu.pl"}});
    grupa1->insert({"1010", {"jan.kowalski@gmail.com", "s11111@pollub.edu.pl"}});
    std::cout << "Wszyscy czlonkowie grupy:\n";
    grupa1->wyswietlGrupe();
    std::cout << std::endl << "Wyszukiwanie po numerze indeksu: " << std::endl;
    grupa1->findKlucz("1100");
    std::cout << "Wyszukiwanie po adresie e-mail:" << std::endl;
    grupa1->szukajWartosc("jan.kowalski@gmail.com");
    std::cout << std::endl;
    grupa1->szukajWartosc(".kowalski@gmail.com");
    std::cout << std::endl;
    delete grupa1;
}

int main() {
    std::string menu =
        "1. Grupa dziekanska\n"
        "2. Przelicznik gramow\n"
        "3. Klasa pochodna i bazowa\n"
        "0. Wyjscie z programu\n";
    int choice;

    while (true) {
        std::cout << menu;
        if (!(std::cin >> choice)) {
            std::cout << "Nieprawidlowa wartosc" << std::endl;
            std::cin.clear();
            std::cin.ignore();
            continue;
        }

        switch (choice) {
            case 1:
                grupa();
                break;
            case 2:
                showConvertingFromGrams<int>(100, 1000);
                showConvertingFromGrams<float>(100, 100.7);
                break;
            case 3:
                {
                    int liczba = 3;
                    std::cout << "Klasa bazowa z parametrem liczba = " << liczba << std::endl;
                    Bazowa baz(liczba);
                    baz.print();
                    baz.show();
                    std::cout << "Klasa pochodna z parametrem liczba = " << liczba << std::endl;
                    Pochodna poch(liczba);
                    poch.print();
                    poch.show();
                    break;
                }
            case 0:
                return 0;
            default:
                std::cout << "Nieprawidlowa wartosc" << std::endl;
        }
    }
}
