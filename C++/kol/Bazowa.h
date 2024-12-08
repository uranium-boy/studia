#pragma once

#include <iostream>

class Bazowa {
public:
    int liczba;
    Bazowa(int liczba): liczba(liczba) {}
    void print() {
        std::cout << "Liczba bazowa: " << liczba << std::endl;
    }
    virtual void show() {
        std::cout << "Liczba pochodna virtual: " << liczba << std::endl;
    }
};
