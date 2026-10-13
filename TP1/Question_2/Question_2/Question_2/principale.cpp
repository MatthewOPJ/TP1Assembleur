#include "stdio.h"

extern "C" bool voyelles_egale_consonnes();

int main()
{
	bool reponse = voyelles_egale_consonnes();
	printf("Réponse: %d", reponse);
}