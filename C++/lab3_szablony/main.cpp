#include <iostream>
//#include "minimal.h"
#include "Array.h"

int main() {
    Array<int> arr(5);

    arr.append(-10);
    arr.append(10);
    arr.append(15);
    arr.append(-20);
    arr.append(30);
    arr.append(-40);

    arr.showArray();
    arr.sort();
    arr.showArray();

    int max = arr.maxElement();

    int index3 = arr.getElement(3);



    return 0;
}
