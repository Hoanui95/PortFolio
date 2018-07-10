/*--------------------------------------------------
TRAVAIL PRATIQUE 2 : Statistiques lexicales
Auteur : Hoanui SARTORE-DEVASSE 1593274
Remis le 24/10/2016
---------------------------------------------------*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAXMOTS 50000
#define MAXCARMOT 10	

/*--------/PROTOTYPES DES FONCTIONS/--------*/
		
void swap(char mots[MAXMOTS][MAXCARMOT], int partition, int pivot);
int extraireMots(char cheminFichier[], char mots[MAXMOTS][MAXCARMOT]);
int trierMots(char mots[MAXMOTS][MAXCARMOT], int nbMots, char motRecherche[MAXCARMOT]);
void quiksort(char mots[MAXMOTS][MAXCARMOT], int bas, int haut);


/*--------/FONCTIONS DU TRAITEMENT/--------*/

//fonction qui échange les mots		
void swap(char mots[MAXMOTS][MAXCARMOT], int i, int j)
{
	char temporaire[MAXCARMOT];
	strcpy(temporaire, mots[i]);
	strcpy(mots[i], mots[j]);
	strcpy(mots[j], temporaire);
}

//Fonction qui extrait les mots du fichier
int extraireMots(char cheminFichier[], char mots[MAXMOTS][MAXCARMOT])
{
	FILE *f;

	//Ouvrir fichier

	f = fopen(cheminFichier, "r");
	int c,j,temp, compteur = 0;
	int fin = false;

	if (f == 0)
	{
		printf("Le fichier est inexacte.");
		compteur--;
	}
	else
	{
		for (int i = 0; i < MAXMOTS; i++)
		{
			compteur = i;
			if (fin == true)
			{
				break;
			}
			j=0;
			while(j < MAXCARMOT - 1)
			{
				temp = c; c = fgetc(f);
				if ( c == EOF)// Fin du fichier, on arrête le traitement dans 
				{
					fin = true;
					break;
				}
			
				if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z') || (c >= '0' && c <= '9')) //Vérifie si le caractère est alphanumérique
				{
					if (c >= 'A' && c <= 'Z') //Stocke les caractères en minuscule
					{
						c += 32;
					}
					if (j == 0)
					{
						if ((temp >= '0' && temp <= '9') || (temp >= 'a' && temp <= 'z') || (temp >= 'A' && temp <= 'Z'))
						{
							i--;
							break;
						}
					
					}
					mots[i][j] = c;
					j++; 
				}
				else if (j == 0)
				{
					i--;
					break;
				}
				else
				{
					break;
				}
	
				}
		}	
	}
	
	fclose(f);
	return compteur + 1;
}

//Fonctions qui trie le tableau de mot
int trierMots(char mots[MAXMOTS][MAXCARMOT], int nbMots, char motRecherche[MAXCARMOT])
{
	for (int i = 0; i < MAXCARMOT; i++)
	{				
		quiksort(mots, 0, nbMots - 1);
	}	
	
	int compteur = 0;
	for (int i = 0; i < nbMots; i++)
	{
		if (strcmp(motRecherche, mots[i]) == 0)
		{
			break;
		}		
		if (strcmp(mots[i], mots[i + 1]) != 0) //Verifie si il y a des doublons dans le tableau, on n'en prend pas compte
		{
			compteur++;
		}		
	}	
	return compteur;
}
void quiksort(char mots[MAXMOTS][MAXCARMOT], int bas, int haut)
{
	
	char *milieu;
	
	int pivot = haut;
	int partition = bas;
	
	milieu = mots[(bas + haut) / 2];

	do 
	{
		while ((strcmp(mots[partition], milieu) < 0) && (partition < haut)) {
			partition++;
		}
		while ((strcmp(mots[pivot], milieu) > 0) && (pivot > bas)) {
			pivot--;
		}
		if (partition <= pivot) {
			swap(mots, partition, pivot);
			partition++;
			pivot--;
		}
	} 
	while (partition <= pivot);
	
	if (bas < pivot) {
		quiksort(mots, bas, pivot);
	}
	if (partition < haut) {
		quiksort(mots, partition, haut);
	}		
}

/*--------/MAIN/--------*/
		
int main(int argc, char **argv)
{
	//Variables
	char tableauMot[MAXMOTS][MAXCARMOT] = {}, motRecherche[MAXCARMOT];
	int ordre, nbMots, index;

	if (argc > 1) //Verifie le nombre de paramètre entré pas l'utilisateur
		ordre = atoi(argv[2]);
		
	if( ordre >= 0 && ordre <= MAXMOTS) //Vérifie si l'index entré par l'utilisateur est correcte
	{
		nbMots = extraireMots(argv[1], tableauMot);
		strcpy(motRecherche, tableauMot[ordre]);
		index = trierMots(tableauMot, nbMots,motRecherche);
		
		if (nbMots != 0)
			printf("L'ordre du mot \"%s\" est %d.", motRecherche , index);
		
	}
	else
	{
		printf("L'index demandé n'est pas correcte. Veuillez entrer un index valide.");	
	}
	
	return 0;

}
