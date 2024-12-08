#pragma once

#include "Bazowa.h"
#include <iostream>

class Pochodna : public Bazowa {
public:
    Pochodna(int liczba) : Bazowa(liczba * 100) {}
    void print() {
        std::cout << "Liczba pochodna: " << liczba << std::endl;
    }
    virtual void show() override {
        std::cout << "Liczba pochodna virtual: " << liczba << std::endl;
    }
};
