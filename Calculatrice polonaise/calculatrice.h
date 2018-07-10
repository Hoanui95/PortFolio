#ifndef CALCULATRICE_H
#define CALCULATRICE_H

#include <stdio.h>
#include <stdlib.h>

#define BUFSIZE 100

//Variable struct élément
struct element
{
	double valeur;
	struct element *prochain;
};

//Prototypes
struct element *initElement(double valeur);
void detruireElement(struct element *e);
void push(double valeur);
struct element *pop();
void detruirePile();
void creerPile();
bool evaluerExpression(const char *expression, int taille, double *resultat);

#endif