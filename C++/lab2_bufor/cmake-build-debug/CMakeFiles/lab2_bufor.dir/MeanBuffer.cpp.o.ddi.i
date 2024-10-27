# 0 "/home/haenim/Desktop/lab2_bufor/MeanBuffer.cpp"
# 1 "/home/haenim/Desktop/lab2_bufor/cmake-build-debug//"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 0 "<command-line>" 2
# 1 "/home/haenim/Desktop/lab2_bufor/MeanBuffer.cpp"




# 1 "/home/haenim/Desktop/lab2_bufor/MeanBuffer.h" 1






# 1 "/home/haenim/Desktop/lab2_bufor/Bufor.h" 1
# 10 "/home/haenim/Desktop/lab2_bufor/Bufor.h"
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
# 8 "/home/haenim/Desktop/lab2_bufor/MeanBuffer.h" 2


class MeanBuffer : public Bufor {
public:
    MeanBuffer() : Bufor() {};
    MeanBuffer(int arrSize) : Bufor(arrSize) {};

    double calculate() override;

};
# 6 "/home/haenim/Desktop/lab2_bufor/MeanBuffer.cpp" 2

double MeanBuffer::calculate() {
    int sum = 0;
    int size = getSize();

    for (int i = 0; i < size; i++) {
        sum += getElement(i);
    }

    return static_cast<double>(sum) / size;
}
