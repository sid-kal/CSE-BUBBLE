#include <stdio.h>

void bubbleSort(int array[], int n) {
    int i, j, temp;
    for (i = 0; i < n - 1; i++) {
        for (j = 0; j < n - i - 1; j++) {
            if (array[j] > array[j+1]) {
                temp = array[j];
                array[j] = array[j+1];
                array[j+1] = temp;
            }
        }
    }
}

int main() {
    int data[] = { 5, 9, 3, 1, 8, 6 };
    int size = sizeof(data) / sizeof(data[0]);
    int i;
    bubbleSort(data, size);
    for (i = 0; i < size; i++) {
        printf("%d ", data[i]);
    }

    return 0;
}
