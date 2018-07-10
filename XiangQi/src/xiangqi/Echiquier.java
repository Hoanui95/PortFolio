package xiangqi;

import java.util.Vector;

/**
 * Classe qui sert à mettre en place l'échiquier
 * @author Hoanui SARTORE-DEVASSE
 * @version Automne 2016
 */

public class Echiquier implements MethodesEchiquier 
{

	/**
	 * Variables : Tableau a deux dimensions d'intersection, de 10 lignes et 9 colonnes
	 */
	private Intersection[][] jeu = new Intersection [10][9];
	private Vector <Integer> ligneCheminPossible;
	private Vector <Integer> colonneCheminPossible;
	


	/**
	 * Constructeur pour un échiquier
	 */
	public Echiquier()
	{
		
		for (int i = 0; i < 10; i++)
		{
			for (int j = 0; j < 9; j++)
			{
				 jeu[i][j] = new Intersection();
			}
		}
				
	}
	
	public void recommencer()
	{
		for (int i = 0; i < 10; i++)
			for (int j = 0; j < 9; j++)
				jeu[i][j].setPiece(null);
	}
	/**
	 *Méthode qui initialise les places des pièces au début d'une partie de xiangqi
	 */
	public void debuter() 
	{
		
	jeu[0][0].setPiece(new Char("t1", "noir"));
	jeu[0][8].setPiece(new Char("t2", "noir"));
	jeu[0][1].setPiece(new Cavalier("c1", "noir"));
	jeu[0][7].setPiece(new Cavalier("c2", "noir"));
	jeu[0][2].setPiece(new Elephant("e1", "noir"));
	jeu[0][6].setPiece(new Elephant("e2", "noir"));
	jeu[0][3].setPiece(new Mandarin("m1", "noir"));
	jeu[0][5].setPiece(new Mandarin("m2", "noir"));
	jeu[0][4].setPiece(new Roi("r", "noir"));
	jeu[3][0].setPiece(new Pion("p1", "noir"));
	jeu[3][2].setPiece(new Pion("p2", "noir"));
	jeu[3][4].setPiece(new Pion("p3", "noir"));
	jeu[3][6].setPiece(new Pion("p4", "noir"));
	jeu[3][8].setPiece(new Pion("p5", "noir"));
	jeu[2][1].setPiece(new Bombarde("b1", "noir"));
	jeu[2][7].setPiece(new Bombarde("b2", "noir"));
	
	
	jeu[9][0].setPiece(new Char("t1", "rouge"));
	jeu[9][8].setPiece(new Char("t2", "rouge"));
	jeu[9][1].setPiece(new Cavalier("c1", "rouge"));
	jeu[9][7].setPiece(new Cavalier("c2", "rouge"));
	jeu[9][2].setPiece(new Elephant("e1", "rouge"));
	jeu[9][6].setPiece(new Elephant("e2", "rouge"));
	jeu[9][3].setPiece(new Mandarin("m1", "rouge"));
	jeu[9][5].setPiece(new Mandarin("m2", "rouge"));
	jeu[9][4].setPiece(new Roi("r", "rouge"));
	jeu[6][0].setPiece(new Pion("p1", "rouge"));
	jeu[6][2].setPiece(new Pion("p2", "rouge"));
	jeu[6][4].setPiece(new Pion("p3", "rouge"));
	jeu[6][6].setPiece(new Pion("p4", "rouge"));
	jeu[6][8].setPiece(new Pion("p5", "rouge"));
	jeu[7][1].setPiece(new Bombarde("b1", "rouge"));
	jeu[7][7].setPiece(new Bombarde("b2", "rouge"));
		
	}

	/** 
	 * Méthode qui renvoie les information d'une intersection de l'échiquier
	 * @param ligne Ligne de l'intersection
	 * @param colonne Colonne de l'intersection
	 * @return jeu[ligne][colonne] Intersection de l'échiquier
	 */
	public Intersection getIntersection(int ligne, int colonne) 
	{
		
		return jeu[ligne][colonne];
	}

	/**
	 * Méthode qui voit si le chemin que la pièce doit prendre est possible
	 * @param depart Position de départ de  la Pièce
	 * @param arrivee Position d'arrivée de la Pièce
	 * @return true or false
	 */
	public boolean cheminPossible(Position depart, Position arrivee) 
	{
		
		int diffLigne = arrivee.getLigne() - depart.getLigne(); 		//Différence des valeurs de la ligne d'arrivée et de départ
		int diffColonne = arrivee.getColonne() - depart.getColonne(); 	//Différence des valeurs de la colonne d'arrivée et de départ
		int nombrePiecesEntre = 0;
		String couleurPieceDepart = jeu[depart.getLigne()][depart.getColonne()].getPiece().getCouleur();
		
		if(jeu[depart.getLigne()][depart.getColonne()].getPiece() instanceof Cavalier) //la pièce est un cavalier
		{
			if (diffLigne == 2) //bas
			{
				if(jeu[depart.getLigne() + 1 ][depart.getColonne()].estOccupee())
					return false;
			}
			else if (diffLigne == -2)//haut
			{
				if(jeu[depart.getLigne() - 1 ][depart.getColonne()].estOccupee())
					return false;
			}
			else if (diffColonne == 2)//droit
			{
				if(jeu[depart.getLigne()][depart.getColonne() + 1].estOccupee())
					return false;
			}
			else if (diffColonne == -2)//gauche
			{
				if(jeu[depart.getLigne()][depart.getColonne() - 1].estOccupee())
					return false;
			}
			else
				return true;
			
		}
		//Deplacement des pièces, sauf cavalier
		else if(diffColonne == 0)															//Vertical
		{
			if (diffLigne < 0)															//Vers le haut
			{
				for(int i = depart.getLigne() - 1; i > arrivee.getLigne(); i--)
				{
					
					if(jeu[i][depart.getColonne()].estOccupee())						//Si la case entre le départ et l'arrivé est occupé
					{
						if (jeu[depart.getLigne()][depart.getColonne()].getPiece() instanceof Bombarde)
						{
							nombrePiecesEntre++; 
						}
						else
							return false;
					}
				}
			}
			else if (diffLigne > 0)														//Vers le bas
			{
				for(int i = depart.getLigne() + 1; i < arrivee.getLigne(); i++)
				{
					if(jeu[i][depart.getColonne()].estOccupee())
					{
						if (jeu[depart.getLigne()][depart.getColonne()].getPiece() instanceof Bombarde)
						{
							nombrePiecesEntre++;
						
						}
						else
							return false;
					}
				}
			}
			else																		//La pièce ne bouge pas
			{
				return true;
			}
		}
		else if(diffLigne == 0)
		{
			if (diffColonne < 0)														//Vers la gauche
			{
				for(int i = depart.getColonne() - 1; i > arrivee.getColonne(); i--)
				{
					if(jeu[depart.getLigne()][i].estOccupee())
					{
						if (jeu[depart.getLigne()][depart.getColonne()].getPiece() instanceof Bombarde)
						{
							nombrePiecesEntre++;
							 
						}
						else
							return false;
					}
				}
			}
			else																		//Vers la droite
			{
				for(int i = depart.getColonne() + 1; i < arrivee.getColonne(); i++)
				{
					if(jeu[depart.getLigne()][i].estOccupee())
					{
						if (jeu[depart.getLigne()][depart.getColonne()].getPiece() instanceof Bombarde)
						{
							nombrePiecesEntre++;
						 
						}
						else
							return false;
					}
				}
			}
		}
		else if (Math.abs(diffLigne) == Math.abs(diffColonne))							//Si c'est en diagonale
		{
			if (diffLigne < 0 && diffColonne > 0)										//Diagonale en haut à droite
			{
				
						if(jeu[depart.getLigne() - 1][depart.getColonne() + 1].estOccupee())
						{
							return false;
						}
						
					
			
			}
			else if (diffLigne > 0 && diffColonne > 0)									//Diagonale en bas à droite
			{
				
					if(jeu[depart.getLigne() + 1][depart.getColonne() + 1].estOccupee())
					{
						return false;
					}
				
			}
			else if(diffLigne < 0 && diffColonne < 0)									//Diagonale en haut à gauche
			{
				
					if(jeu[depart.getLigne() - 1][depart.getColonne() - 1].estOccupee())
					{
						return false;
					}
				
			}
			else
			{
				
					if(jeu[depart.getLigne() + 1][depart.getColonne() - 1].estOccupee())
					{
						return false;
					}
			
			}
		}
		
		// On vérifie si il y peut se déplacer au point d'arrivée
		if(jeu[depart.getLigne()][depart.getColonne()].getPiece() instanceof Bombarde)
		{
					
			if (nombrePiecesEntre == 1 && jeu[arrivee.getLigne()][arrivee.getColonne()].estOccupeeAdversaire(couleurPieceDepart)) //Il y a exactement une pièce entre la bombarde et la pièce adverse
				return true;
			else if(nombrePiecesEntre == 0 && !jeu[arrivee.getLigne()][arrivee.getColonne()].estOccupee()) //Il n'y a aucune pièce sur le chemin et a l'arrivée
				return true;
			else if (nombrePiecesEntre > 1) //Si il y a plus d'une pièce sur le chemin
				return false;
			else 
				return false;
		}
		else if(!jeu[arrivee.getLigne()][arrivee.getColonne()].estOccupee() || jeu[arrivee.getLigne()][arrivee.getColonne()].estOccupeeAdversaire(couleurPieceDepart))
			return true;
		else 
			return false;
	
		
	}
	/**
	 * Méthode qui vérifie la position du Roi noir
	 * @return Position position du roi noir
	 */
	public Position roiNoir()
	{
		
		for (int i = 0; i < 3; i++)
		{
			for(int j = 3; j < 6; j++)
			{
				if (jeu[i][j].getPiece() instanceof Roi)
				{
					return new Position(i,j);
					
				}
			}
		}
		return new Position(0,0);
	}
	
	/**
	 * Méthode qui vérifie la position du Roi rouge
	 * @return Position position du roi rouge
	 */
	public Position roiRouge()
	{

		for (int i = 7; i < 10; i++)
		{
			for(int j = 3; j < 6; j++)
			{
				if (jeu[i][j].getPiece() instanceof Roi)
				{
					return new Position(i,j);
				}
			}
		}
		return new Position(0,0);
	}
	
/**
 * Métode qui vérifie que les rois ne sont pas face a face
 * @param depart Position départ de la pièce
 * @param arrivee Position arrivé de la pièce
 * @return true ou false
 */
	public boolean roisNePouvantPasEtreFaceAFace(Position depart, Position arrivee) 
	{
		//Détermine la position des deux rois
		Position roiNoir = roiNoir();
		Position roiRouge = roiRouge();
		
		//Variable qui sert a savoir le nombre de pièce entre deux positions
		int nombreDePiece = 0;
		
		//Si la pièce est un roi ou pas, et sa couleur si c'est un roi
		boolean pieceRoi;
		String couleurRoi = null;
		
		//Vérifie si la pièce qui bouge est un roi
		if(jeu[depart.getLigne()][depart.getColonne()].getPiece() instanceof Roi)
		{
			pieceRoi = true;
			couleurRoi = jeu[depart.getLigne()][depart.getColonne()].getPiece().getCouleur();
		}
		else
			pieceRoi = false;
		
		
		if(pieceRoi) //Si la pièce qui bouge est un roi
		{
			if (roiRouge.getColonne() == roiNoir.getColonne())	//Si les deux Rois sont sur la même colonne
			{
				if (jeu[arrivee.getLigne()][arrivee.getColonne()].estOccupeeAdversaire(couleurRoi)) 	//Si la pièce qui bouge capture une pièce adverse
				{
					if (couleurRoi == "noir") 
					{
						for (int i = arrivee.getLigne() + 1; i < roiRouge.getLigne(); i++)
						{
							if(jeu[i][roiRouge.getColonne()].estOccupee())
							{
								nombreDePiece++;
							}
						}
						if(nombreDePiece == 0) 			//Si il y a aucune pièce entre la pièce adverse et le roi d'en face
							return false;
						else 
							return true;
					}
					else
					{
						for (int i = arrivee.getLigne() - 1; i > roiNoir.getLigne(); i--)
						{
							if(jeu[i][roiNoir.getColonne()].estOccupee())
							{
								nombreDePiece++;
							}
						}
						
						if(nombreDePiece == 0)			//Si il y a aucune pièce entre la pièce adverse et le roi d'en face
							return false;
						else 
							return true;
					}
						
				}
				else
					return true;
			}
			
			if (couleurRoi == "noir") 		//Si le roi qui bouge est noir
			{
				if(arrivee.getColonne() == roiRouge.getColonne()) //Si le roi noir bouge sur la colonne du roi rouge, ils sont face a face
				{
					for (int i = roiNoir.getLigne() + 1 ; i < roiRouge.getLigne(); i++)
					{
						if(jeu[i][roiRouge.getColonne()].estOccupee())
						{
							nombreDePiece++;
						}
					}
					if(nombreDePiece == 0) //Si il y a aucune pièce entre les deux rois
						return false;
					else 
						return true;
				}
				else
					return true;
			}
			else
			{
				if(arrivee.getColonne() == roiNoir.getColonne()) //Si le roi rouge bouge sur la colonne du roi noir, ils sont face a face
				{
					for (int i = roiRouge.getLigne() - 1; i > roiNoir.getLigne(); i--)
					{
						if(jeu[i][roiNoir.getColonne()].estOccupee())
						{
							nombreDePiece++;
						}
					}
					
					if(nombreDePiece == 0)  //Si il y a aucune pièce entre les deux rois
						return false;
					else 
						return true;
				}
				else 
					return true;
			}
		}
		else	//Si la pièce qui bouge n'est pas un roi
		{
			if(roiRouge.getColonne() == roiNoir.getColonne()) //Les rois sont face a face 
			{
				if(depart.getColonne() == roiRouge.getColonne()) //La pièce qui bouge est sur la colonne des deux rois
				{
					if(depart.getLigne() > roiNoir.getLigne() && depart.getLigne() < roiRouge.getLigne())	// la piéce qui bouge est entre les deux rois
					{
						if(arrivee.getColonne() == depart.getColonne()) //Si il reste sur la même colonne
						{
							return true;
						}
						else 											//Si il change de colonne (gauche ou droite)
						{
						
							for (int i = roiNoir.getLigne() + 1; i < roiRouge.getLigne(); i++)
							{
								if(jeu[i][depart.getColonne()].estOccupee())
								{
									nombreDePiece++;
								
								}
							}
							if(nombreDePiece == 1) //Si la seule pièce qui se trouve entre les deux rois est la pièce qui bouge a gauche ou a droite
								return false;
							else 
								return true;
						
						}
					}
					else 
						return true;
				}
				else 
					return true;
				
			}
			else 
				return true;
		}                                                                                                                                                                                                                                                                                                                
	}
	
	public Vector <Integer> getLigneCheminPossible() {
		return ligneCheminPossible;
	}

	public Vector <Integer> getColonneCheminPossible() {
		return colonneCheminPossible;
	}
	
	public void toutCheminPossible(Position depart)
	{
		ligneCheminPossible = new <Integer> Vector();
		colonneCheminPossible = new <Integer> Vector();
		
		for (int i = 0; i < 10; i++)
		{
			for (int j = 0; j < 9; j++)
			{
				if(getIntersection(depart.getLigne(), depart.getColonne()).getPiece().estValide(depart, new Position(i, j)))
				{
					if(!getIntersection(i,j).estOccupee())
					{
						if(cheminPossible(depart, new Position(i, j)))
						{
							ligneCheminPossible.add(i);
							colonneCheminPossible.add(j);
						}
					}
				}
			}
		}
	}
}
