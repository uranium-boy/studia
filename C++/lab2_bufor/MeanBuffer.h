//
// Created by haenim on 10/27/24.
//

#ifndef MEANBUFFER_H
#define MEANBUFFER_H
#include "Bufor.h"


class MeanBuffer : public Bufor {
public:
    MeanBuffer() : Bufor() {};
    MeanBuffer(int arrSize) : Bufor(arrSize) {};

    double calculate() override;

};



#endif //MEANBUFFER_H
