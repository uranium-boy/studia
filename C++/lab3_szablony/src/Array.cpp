//
// Created by haenim on 10/21/24.
//

#include "Array.h"

#include <algorithm>
#include <iostream>

template<typename T>
Array<T>::Array(size_t arraySize) {
    array = new T[arraySize];
    this->maxSize = arraySize;
    this->freeIndex = 0;
}

template<typename T>
Array<T>::Array() {
    array = new T[DEFAULT_SIZE];
    this->maxSize = DEFAULT_SIZE;
    this->freeIndex = 0;
}

template<typename T>
Array<T>::~Array() {
    delete[] array;
}

template<typename T>
void Array<T>::sort() {
    std::sort(array, array + this->maxSize - 1);
}

template<typename T>
T Array<T>::maxElement() {
    T max = array[0];
    for (int i = 1; i < this->maxSize; i++) {
        if (array[i] > max) {
            max = array[i];
        }
    }
    return max;
}

template<typename T>
void Array<T>::showArray() {
    for (int i = 0; i < this->maxSize; i++) {
        std::cout << "Element " << i + 1 << ": " << array[i] << std::endl;
    }
}

template<typename T>
bool Array<T>::append(T value) {
   if (this->freeIndex >= this->maxSize) {
       std::cout << "Cannot append, no free space in array.\n";
       return false;
   }

    array[freeIndex] = value;
    freeIndex++;
    return true;
}

template<typename T>
T Array<T>::getElement(int index) {
    if (index < maxSize && index >= 0) {
        return array[index];
    }
    return T();
}

template Array<int>::Array();
template Array<int>::Array(size_t);
template Array<int>::~Array();
template bool Array<int>::append(int);
template void Array<int>::showArray();
template void Array<int>::sort();
template int Array<int>::getElement(int);
template int Array<int>::maxElement();
