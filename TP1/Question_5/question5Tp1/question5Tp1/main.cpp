#include <stdio.h>
#include <chrono>

extern "C" 
{
	void afficher_sommes_colonnes(int* mat, int size_x, int size_y);
	void afficher_sommes_lignes(int* mat, int size_x, int size_y);
}


void afficher_sommes_colonnes_cpp(int* mat, int size_x, int size_y);
void afficher_sommes_lignes_cpp(int* mat, int size_x, int size_y);



void afficher_sommes_colonnes_cpp(int* mat, int size_x, int size_y)
{
	for (int yy = 0; yy < size_y; yy++) 
	{
		int sum = 0;
		for (int xx = 0; xx < size_x; xx++) 
		{
			int index = xx * size_y + yy;
			sum += mat[index];
		}

		printf("colonne %d: %d\n", yy, sum);
	}
}

void afficher_sommes_lignes_cpp(int* mat, int size_x, int size_y)
{
	for (int xx = 0; xx < size_x; xx++)
	{
		int sum = 0;
		for (int yy = 0; yy < size_y; yy++)
		{
			int index = xx * size_y + yy;
			sum += mat[index];
		}

		printf("ligne %d: %d\n", xx, sum);
	}
}


int main() 
{
	const int size_x = 4;
	const int size_y = 5;
	int matrice[size_x][size_y] =
	{
		 {3, 8, 2, 5, 1},
		 {7, 4, 9, 2, 6},
		 {1, 5, 3, 8, 4},
		 {6, 2, 7, 1, 9}
	};

	printf("------ petite matrice ------\n");

	auto start = std::chrono::high_resolution_clock::now();
	afficher_sommes_colonnes((int*)matrice, size_x, size_y);
	afficher_sommes_lignes((int*)matrice, size_x, size_y);
	auto end = std::chrono::high_resolution_clock::now();

	printf("temps: %lld mircosecondes\n", (end - start) / 1000);

	printf("\n------ grande matrice ------\n");

	const int size_x_large = 100;
	const int size_y_large = 200;

	int matrice_large[size_x_large][size_y_large] =
	{
		 // 0
	};


	start = std::chrono::high_resolution_clock::now();
	afficher_sommes_colonnes((int*)matrice_large, size_x_large, size_y_large);
	afficher_sommes_lignes((int*)matrice_large, size_x_large, size_y_large);
	end = std::chrono::high_resolution_clock::now();

	printf("temps: %lld mircosecondes\n", (end - start) / 1000);
}