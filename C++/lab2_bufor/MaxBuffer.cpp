//
// Created by haenim on 10/27/24.
//

#include "MaxBuffer.h"
#include <iostream>

void MaxBuffer::add(int value) {
    int freeIndex = getFirst();
    int size = getSize();

    if (freeIndex < size) {
        Bufor::add(value);
    }
    else {
        std::cout << "Osiagnieto maksymalny rozmiar tablicy" << std::endl;
    }

}

void MaxBuffer::setElement(int index, int value) {
    if (index < getSize()) {
        Bufor::setElement(index, value);
    }
    else {
        std::cout << "Indeks poza rozmiarem tablicy" << std::endl;
    }
}
