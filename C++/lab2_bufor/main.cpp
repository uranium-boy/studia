#include <iostream>
#include "MeanBuffer.h"

int main()
{
    MeanBuffer buffer(5);

    for (int i = 0; i < 19; i++) {
        printf("%d\n", i);
        buffer.add(i);
    }
    buffer.show();
    printf("%d\n", buffer.getElement(18));
    return 0;
}
