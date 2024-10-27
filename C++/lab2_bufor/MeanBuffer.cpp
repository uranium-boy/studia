//
// Created by haenim on 10/27/24.
//

#include "MeanBuffer.h"

double MeanBuffer::calculate() {
    int sum = 0;
    int size = getSize();

    for (int i = 0; i < size; i++) {
        sum += getElement(i);
    }

    return static_cast<double>(sum) / size;
}
