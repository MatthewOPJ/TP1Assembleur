#include "stdio.h"

extern  "C" int somme_max();

int main() {
    int result = somme_max();
    printf("L'indice de la somme maximale est : %d\n", result);
    return 0;
}