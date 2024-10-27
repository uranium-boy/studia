//
// Created by haenim on 10/27/24.
//

#ifndef BUFOR_H
#define BUFOR_H
#define DEFAULT_SIZE 10


class Bufor {
private:
    int* arrPtr;
    int arrSize;
    int freeIndex;
public:
    Bufor();
    Bufor(int arrSize);
    virtual ~Bufor();

    virtual void add(int value);
    virtual double calculate() = 0;
    int getSize();
    int getElement(int index);
    int getFirst();
    virtual void setElement(int index, int value);
    void show();
};



#endif //BUFOR_H
