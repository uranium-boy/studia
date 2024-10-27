//
// Created by haenim on 10/21/24.
//

#ifndef MINIMAL_H
#define MINIMAL_H
#include <iostream>

template<typename T>
T findMin(T* arr, size_t size) {
    std::cout << "Cannot find minimal value for this type.\n";
    return *arr;
}

template<>
inline float findMin<float>(float* arr, size_t size) {
    float min = arr[0];
    for (size_t i = 1; i < size; i++) {
        if (arr[i] < min) {
            min = arr[i];
        }
    }
    return min;
}

template<>
inline int findMin<int>(int* arr, size_t size) {
    int min = arr[0];
    for (size_t i = 1; i < size; i++) {
        if (arr[i] < min) {
            min = arr[i];
        }
    }
    return min;
}

#endif //MINIMAL_H
