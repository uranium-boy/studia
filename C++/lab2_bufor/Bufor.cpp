//
// Created by haenim on 10/27/24.
//

#include "Bufor.h"
#include <iostream>

Bufor::Bufor() {
    arrSize = DEFAULT_SIZE;
    freeIndex = 0;
    arrPtr = new int[arrSize];
}

Bufor::Bufor(int arrSize) {
    this->arrSize = arrSize;
    freeIndex = 0;
    arrPtr = new int[arrSize];
}

Bufor::~Bufor() {
    delete [] arrPtr;
}

void Bufor::add(int value) {
    arrPtr[freeIndex] = value;
    freeIndex++;
}

int Bufor::getSize() {
    return arrSize;
}

int Bufor::getElement(int index) {
    return arrPtr[index];
}

int Bufor::getFirst() {
    return freeIndex;
}

void Bufor::setElement(int index, int value) {
    arrPtr[index] = value;
}

void Bufor::show() {
    for (int i = 0; i < arrSize; i++) {
        std::cout << i + 1 << ". Element = " << arrPtr[i] << std::endl;
    }
}