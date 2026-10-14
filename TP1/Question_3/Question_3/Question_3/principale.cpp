#define _CRT_SECURE_NO_WARNINGS
#include "stdio.h"



extern "C"
{
	void FIFO(short* in, short* out, int n);
}

int main()
{
	const int n = 4;
	short arr[n] = {};

	for (int i = 0; i < n; i++) {
		printf("Entrez un nombre: ");
		if(!scanf("%hd", &arr[i])) arr[i] = 0;
	}

	short nouvel_ordre[n] = {}; 
	FIFO(arr, nouvel_ordre, n);

	for (int i = 0; i < n; i++) {
		printf("valeur: %hd\n", nouvel_ordre[i]);
	}
}