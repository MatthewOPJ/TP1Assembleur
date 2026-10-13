#define _CRT_SECURE_NO_WARNINGS
#include "stdio.h"



extern "C"
{
	void Push_Fin(short valeur);
	short Pop_Stack();
}

int main()
{
	short valeur;

	for (int i = 0; i <= 3; i++)
	{
		printf("Veuillez rentrer la valeur: ");
		if (!scanf("%hd", &valeur))
		{
			valeur = 0;
		}
			
		Push_Fin(valeur);
	}

	for (int i = 0; i <= 3; i++)
	{
		printf("Valeur Pop: %hd", Pop_Stack());
	}

}