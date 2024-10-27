//
// Created by haenim on 10/27/24.
//

#ifndef MAXBUFFER_H
#define MAXBUFFER_H
#include "Bufor.h"


class MaxBuffer : Bufor {
public:
    void add(int value) override;
    void setElement(int index, int value) override;
};



#endif //MAXBUFFER_H
