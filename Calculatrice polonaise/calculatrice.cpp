#include "calculatrice.h"


struct element *tete = NULL;

//Fonction qui initialise un élément de la pile
struct element *initElement(double valeur)
{
	struct element *e;
	int t;
	
	e = (struct element *) malloc(sizeof(struct element));
	e->valeur = valeur;
	e->prochain = NULL;
	
	return e;
}

//Fonction qui détruit un élément de la pile
void detruireElement(struct element *e)
{
	if (e != NULL)
	{
		free(e);
	}
}

//Fonction qui permet d'entrer des valeurs dans la pile
void push(double valeur)
{
	struct element *nouveau = initElement(valeur);
	nouveau->prochain = tete;
	tete = nouveau;
}

//Fonction qui permet d'enlever des valeurs de la pile
struct element *pop()
{
	struct element *e = tete;
	if (tete != NULL)
	{
		tete = tete->prochain;
		e->prochain = NULL;
	}
	
	return e;
}

//Fonction qui détruit une pile
void detruirePile()
{
	while (tete != NULL)
		detruireElement( pop() );
}

//Fonction qui créée une pile
void creerPile()
{
	detruirePile();
	tete = NULL;
}

//Fonction qui vérifie si la notation polonaise est correcte et qui calcul si cela est vrai
bool evaluerExpression(const char *expression, int taille, double *resultat)
{
	struct element *x, *y; //variable temporaire qui sert a stocker les valeurs dépilées
	char temp[BUFSIZE]; //variable pour stocker le nombre a empiler
	int compteur = 0, compteurPile = 0; //Compteur pour le nombre de chiffre de la valeur qui entre dans la pile, et compteur pour le nombre de valeur dans la pile
	
	creerPile();
	
	for(int i = 0; i <= taille; i++) //On vérifie chaque nombre, espace ou opérateur de la liste chaînée
	{
		
		if((*(expression + i) >= '0' &&  *(expression + i) <= '9') || (*(expression + i) == '.'))//Si le char est un nombre ou un point (virgule)
		{
			*(temp + compteur) = *(expression + i);
				compteur++;
			
		}
		else if(*(expression + i) == '\0')//Si c'est la fin de la liste
		{
			if(*(expression + i - 1) >= '0' &&  *(expression + i - 1) <= '9')//Si ce n'est pas un opérateur a la fin, pour ajouter dans la pile et savoir il y a combien de nombre dans la pile
			{
				compteurPile++;
				push(atof(temp));
			}
		}
		else if(*(expression + i) == ' ' && (*(expression + i - 1) >= '0' &&  *(expression + i) <= '9'))//Si c'est un espace et qu'il y a une valeur avant
		{
			compteur = 0;
			
			compteurPile++;	//augmente le nombre de valeur dans la pile
			push(atof(temp)); //On fait entrer dans la pile
			
			
			for(int i = 0; i < BUFSIZE; i++)
			{
				temp[i] = ' ';
			}
			
		}
		else if (*(expression + i ) == '+')//Si l'opérateur plus est présent
		{
			if (compteurPile > 1)//Si il y a plus d'une valeur dans la pile
			{
				
			y = pop();//On dépile deux dernières valeurs de la pile
			x = pop();
			
			
			push(x->valeur + y->valeur);//On empile le résultat du calcul
			compteurPile--;//on enlève deux valeurs de la pile et on rajoute une valeur
			}
			
		}
		else if (*(expression + i ) == '*')//Si l'opérateur de multiplication est présent
		{
			if (compteurPile > 1)
			{
			y = pop();
			x = pop();
			
			compteurPile--;
			push(x->valeur * y->valeur);
			}
			
		}
		else if (*(expression + i ) == '-') //Si l'opérateur moins est présent
		{
			if(*(expression + i + 1)  >= '0' &&  *(expression + i + 1) <= '9' )//Si le nombre qui entre dans la pile est négatif
			{
				*(temp + compteur) = *(expression + i);
				compteur++;
			}
			else if (compteurPile > 1)
			{
					
			y = pop();
			x = pop();
			
			compteurPile--;
			push(x->valeur - y->valeur );
			}
			
			
		}
		else if (*(expression + i ) == '/')//Si l'opérateur de division est présent
		{
			if (compteurPile > 1)
			{
			y = pop();
			x = pop();
			
			if(y->valeur == 0)//si le dénominateur est égal à 0, ce n'est pas possible de faire le calcul
				return false;
			
	
			compteurPile--;
			push(x->valeur / y->valeur);
			}
			
		}
		
	
	}
	
	if(compteurPile == 1)//Si il n'y a q'une seule valeur dans la pile, notation juste
	{
		*resultat = pop()->valeur;
		return true;
	}
	else
		return false;
	
}

