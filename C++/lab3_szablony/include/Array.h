//
// Created by haenim on 10/21/24.
//

#ifndef ARRAY_H
#define ARRAY_H

#include <cstddef>

template<typename T>
class Array {
private:
    static constexpr int DEFAULT_SIZE = 10;
    T* array;
    size_t maxSize;
    int freeIndex;

public:
    Array(size_t arraySize);
    Array();
    ~Array();

    void sort();
    T maxElement();
    void showArray();
    bool append(T value);
    T getElement(int index);
};



#endif //ARRAY_H
