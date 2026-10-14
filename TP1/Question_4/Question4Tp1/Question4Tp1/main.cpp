#include <stdio.h>

extern "C" 
{
	long long trouver_prochain_different(char* str, unsigned long long index);
	void supprimer_partie(char* str, unsigned long long debut, unsigned long long fin);
}



void supprimer_char_successifs(char* str) 
{
	for (int i = 0; str[i] != 0; i++) 
	{
		long long index_different = trouver_prochain_different(str, i);

		if (i == index_different) 
		{
			continue;
		}

		supprimer_partie(str, i, index_different);
	}
}



int main() 
{
	char test[] = "aaabccccdddeeede";

	printf("string avant: %s\n", test);

	supprimer_char_successifs(test);

	printf("string après: %s\n", test);
}