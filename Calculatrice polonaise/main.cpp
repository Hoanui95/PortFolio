#include "calculatrice.h"

//Fonction qui recoit la chaîne et retourne la taille de la chaîne
int getligne(char s[], int taille)
{
	int i, c;
	
	i = 0;
	c = getchar();
	while (c != EOF && c != '\n' && i < taille)
	{
		s[i] = c;
		i++;
		c = getchar();
	}
	
	if (c == EOF)
		return -1;
	
	s[i] = '\0';
	
	return i;
}

//Fonction main 
int main()
{
	char s[BUFSIZE];
	int tailleChaine;
	double resultat;
	bool notationValide;
	
	printf("\n			CALCULATRICE POLONAISE INVERSE\n\n");
	
	printf("Veuillez entrer une notation polonaise inverse s.v.p (Q pour quitter) : ");
	tailleChaine = getligne(s, BUFSIZE);
	
	while(s[0] != 'Q' && s[0] != 'q')
	{
		notationValide = evaluerExpression(s, tailleChaine, &resultat);
		
		if(notationValide)
		{
			
			printf("Le r\202sultat est : %.2f", resultat);
			printf("\nVeuillez entrer une autre notation polonaise inverse s.v.p (Q pour quitter) : ");
			tailleChaine = getligne(s, BUFSIZE);
		}
		else
		{
	
			printf("La notation que vous avez entrez est \202ronn\202e.\nVeuillez entrer une autre notation polonaise inverse valide s.v.p (Q pour quitter) : ");
			tailleChaine = getligne(s, BUFSIZE);
		}
	}
	
	printf("\nMerci.");
	
	return 0;
}
