/**************************************************************************
AUTEUR: SARTORE-DEVASSE Hoanui
DATE: 26/09/2016
FICHIER: Minesweeper
DESCRIPTION: Jeux Minesweeper avec fonction récursive
**************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <iostream>
#include <string>

#define MAXTAILLE 9
#define NBBOMBES 10
#define CACHEE '*'
#define VIDE ' '
#define BOMBE '!'
#define VALBOMBE -1


using namespace std;

struct cellule
{
	int valeur;
	bool cachee;
};

//	Ici, on initialise toute la grille
//avec des cellules vides
void initGrille(struct cellule grille[][MAXTAILLE])
{
	for (int i = 0; i < MAXTAILLE; i++)
	{
		for (int j = 0; j < MAXTAILLE; j++)
		{
			grille[i][j].valeur = 0;
			grille[i][j].cachee = true;
		}
	}
}

//	Fonction pour afficher la grille du jeu
//Vous n'avez pas à modifier cette fonction
void imprimerGrille(struct cellule grille[][MAXTAILLE])
{
	system("cls");

	char charCell;

	printf("\n\n\n");

	for (int i = MAXTAILLE - 1; i >= 0; i--)
	{
		printf("%d | ", i + 1);
		for (int j = 0; j < MAXTAILLE; j++)
		{
			if (grille[i][j].cachee)
				charCell = CACHEE;
			else if (grille[i][j].valeur == VALBOMBE)
				charCell = BOMBE;
			else if (grille[i][j].valeur == 0)
				charCell = VIDE;
			else
				charCell = grille[i][j].valeur + '0';

			printf("%c ", charCell);
		}
		putchar('\n');
	}

	printf("   ");
	for (int j = 0; j < MAXTAILLE; j++)
		printf("__");

	printf("\n    ");
	for (int j = 0; j < MAXTAILLE; j++)
		printf("%c ", 'a' + j);

	printf("\n\n");
}

//	Fonction qui change la coordonnée lettre en chiffre
int charToDigit(char coordonneeA1)
{
	if (coordonneeA1 == 'a' || coordonneeA1 == 'A')
		return 0;
	else if (coordonneeA1 == 'b' || coordonneeA1 == 'B')
		return 1;
	else if (coordonneeA1 == 'c' || coordonneeA1 == 'C')
		return 2;
	else if (coordonneeA1 == 'd' || coordonneeA1 == 'D')
		return 3;
	else if (coordonneeA1 == 'e' || coordonneeA1 == 'E')
		return 4;
	else if (coordonneeA1 == 'f' || coordonneeA1 == 'F')
		return 5;
	else if (coordonneeA1 == 'g' || coordonneeA1 == 'G')
		return 6;
	else if (coordonneeA1 == 'h' || coordonneeA1 == 'H')
		return 7;
	else if (coordonneeA1 == 'i' || coordonneeA1 == 'I')
		return 8;
}

// Fonction qui calcule les bombes voisines sur les cases de la grille
void calcule_bombe_voisin(cellule grille[MAXTAILLE][MAXTAILLE], int x, int y)
{
	if (x - 1 >= 0)
	{
		if (grille[y][x - 1].valeur != VALBOMBE)
			grille[y][x - 1].valeur++;
		if (y - 1 >= 0)
			if (grille[y - 1][x - 1].valeur != VALBOMBE)
				grille[y - 1][x - 1].valeur++;
		if (y + 1 < MAXTAILLE)
			if (grille[y + 1][x - 1].valeur != VALBOMBE)
				grille[y + 1][x - 1].valeur++;
	}

	if (x + 1<MAXTAILLE)
	{
		if (grille[y][x + 1].valeur != VALBOMBE)
			grille[y][x + 1].valeur++;
		if (y - 1 >= 0)
			if (grille[y - 1][x + 1].valeur != VALBOMBE)
				grille[y - 1][x + 1].valeur++;
		if (y + 1<MAXTAILLE)
			if (grille[y + 1][x + 1].valeur != VALBOMBE)
				grille[y + 1][x + 1].valeur++;
	}

	if (y - 1 >= 0)
		if (grille[y - 1][x].valeur != VALBOMBE)
			grille[y - 1][x].valeur++;

	if (y + 1<MAXTAILLE)
		if (grille[y + 1][x].valeur != VALBOMBE)
			grille[y + 1][x].valeur++;

}

// Fonction qui initialise la position des bombes du jeu
void Initialisation_Bombe(int coordonnee2, int coordonnee1, cellule grille[MAXTAILLE][MAXTAILLE])
{
	int x, y;
	for (int i = 0; i <= NBBOMBES; i++) //initialisation des bombes autres que les premieres coordonnées entrée
	{
		x = rand() % MAXTAILLE;
		y = rand() % MAXTAILLE;
		if (y == coordonnee2 && x == coordonnee1)
		{
			x = rand() % MAXTAILLE;
			y = rand() % MAXTAILLE;
		}

		grille[y][x].valeur = VALBOMBE;

	}

	for (int y = 0; y<MAXTAILLE; y++)
		for (int x = 0; x<MAXTAILLE; x++)
			if (grille[y][x].valeur == VALBOMBE)
				calcule_bombe_voisin(grille, x, y);
}

//	Fonction récursive qui affiche les cases vides et de valeur selon les coordonnée entrée par l'utilisateur
void Affiche_cellule_recursif(struct cellule grille[MAXTAILLE][MAXTAILLE], int x, int y)
{
	if (x >= 0 && x < MAXTAILLE && y >= 0 && y < MAXTAILLE)
	{
		if (grille[x][y].cachee == false)		// ne fait rien si la case est déjà révélée
		{
			return;
		}
		
		grille[x][y].cachee = false;			// révèle la case 

		if (grille[x][y].valeur == VALBOMBE)	// Si il y une bombe a la case, il  la laisse remet cachée
		{
			grille[x][y].cachee = true;
			return;
		}
		if (grille[x][y].valeur != 0)			//Si il y a une valeur dans la case, il ne fait rien puisque qu'elle est déjà révélée
		{
			return;
		}
		
		// appel récursif, vérifie sur les 8 autres position voisines
		Affiche_cellule_recursif(grille, x - 1, y - 1);
		Affiche_cellule_recursif(grille, x, y - 1);
		Affiche_cellule_recursif(grille, x + 1, y - 1);
		Affiche_cellule_recursif(grille, x - 1, y);
		Affiche_cellule_recursif(grille, x + 1, y);
		Affiche_cellule_recursif(grille, x - 1, y + 1);
		Affiche_cellule_recursif(grille, x, y + 1);
		Affiche_cellule_recursif(grille, x + 1, y + 1);
	}
	else
	{
		return;
	}
}

//	Fonction main du projet Minesweeper
int main(int argc, char **argv)
{
	string coordonnee;				// Coordonnées données par le joueur
	int coordonnee1, coordonnee2;	// Coordonnées transformer en chiffre pour la grille
	int c = 0;						// compteur pour les cases non caché, sert pour savoir si le joueur a gagné la partie
	char recommencer;
	bool perdu;
	struct cellule grille[MAXTAILLE][MAXTAILLE];

	do
	{ 
		initGrille(grille);
		perdu = false;

		//L'utilisateur doit entrer des coordonnées
		imprimerGrille(grille);
		printf("Coordonnees (Q pour quitter): ");								//L'utilisateur doit entrer des coordonnées
		cin >> coordonnee;
		if (coordonnee[0] == 'q' || coordonnee[0] == 'Q')						//Si l'utilisateur veut quitter le jeu
			return 0;
		coordonnee1 = charToDigit(coordonnee[0]);
		coordonnee2 = coordonnee[1] - '1';
			
		Initialisation_Bombe(coordonnee2, coordonnee1, grille);					//Initialise les bombes
		Affiche_cellule_recursif(grille, coordonnee2, coordonnee1);				//Fait la fonction recursive pour l'affichage de la grille
			
		while (perdu != true)													//Boucle qui vérifie si le joueur a perdu ou pas
		{
		
			imprimerGrille(grille);
			printf("Coordonnees (Q pour quitter): ");							
			cin >> coordonnee;
			if (coordonnee[0] == 'q' || coordonnee[0] == 'Q')
				return 0;
			coordonnee1 = charToDigit(coordonnee[0]);
			coordonnee2 = coordonnee[1] - '1';
			
			if (grille[coordonnee2][coordonnee1].valeur == VALBOMBE)			//Si l'utilisateur tombe sur une bombe, échec de la partie
			{
				grille[coordonnee2][coordonnee1].cachee = false;
				imprimerGrille(grille);
				cout << "Boom!";
				perdu = true;
			}
			else
			{
				Affiche_cellule_recursif(grille, coordonnee2, coordonnee1);
			}
				
			for(int y = 0; y < MAXTAILLE; y++)										//On compte combien de case non caché il reste dans la grille
				for (int x = 0; x < MAXTAILLE; x++)
					if (grille[y][x].cachee == false)
						c++;

			if (c == 71)															//Cela veut dire qu'il reste forcément 10 cases caché qui sont les bombes
			{
				for (int y = 0; y < MAXTAILLE; y++)
					for (int x = 0; x < MAXTAILLE; x++)
						grille[y][x].cachee = false;
					
				imprimerGrille(grille);
						
				cout << "\nVous Avez Gagné";
				perdu = true;														// On sort de la boucle while car l'utilisateur a gagné
			}
			c = 0;
		}

		cout << "\nVoulez-vous recommencer (O/N)? : ";
		cin >> recommencer;

	} while (recommencer != 'n' && recommencer != 'N');
	return 0;
}