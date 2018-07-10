package xiangqi;

import java.util.Vector;

/**
 * Classe qui sert � mettre en place l'�chiquier
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
	 * Constructeur pour un �chiquier
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
	 *M�thode qui initialise les places des pi�ces au d�but d'une partie de xiangqi
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
	 * M�thode qui renvoie les information d'une intersection de l'�chiquier
	 * @param ligne Ligne de l'intersection
	 * @param colonne Colonne de l'intersection
	 * @return jeu[ligne][colonne] Intersection de l'�chiquier
	 */
	public Intersection getIntersection(int ligne, int colonne) 
	{
		
		return jeu[ligne][colonne];
	}

	/**
	 * M�thode qui voit si le chemin que la pi�ce doit prendre est possible
	 * @param depart Position de d�part de  la Pi�ce
	 * @param arrivee Position d'arriv�e de la Pi�ce
	 * @return true or false
	 */
	public boolean cheminPossible(Position depart, Position arrivee) 
	{
		
		int diffLigne = arrivee.getLigne() - depart.getLigne(); 		//Diff�rence des valeurs de la ligne d'arriv�e et de d�part
		int diffColonne = arrivee.getColonne() - depart.getColonne(); 	//Diff�rence des valeurs de la colonne d'arriv�e et de d�part
		int nombrePiecesEntre = 0;
		String couleurPieceDepart = jeu[depart.getLigne()][depart.getColonne()].getPiece().getCouleur();
		
		if(jeu[depart.getLigne()][depart.getColonne()].getPiece() instanceof Cavalier) //la pi�ce est un cavalier
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
		//Deplacement des pi�ces, sauf cavalier
		else if(diffColonne == 0)															//Vertical
		{
			if (diffLigne < 0)															//Vers le haut
			{
				for(int i = depart.getLigne() - 1; i > arrivee.getLigne(); i--)
				{
					
					if(jeu[i][depart.getColonne()].estOccupee())						//Si la case entre le d�part et l'arriv� est occup�
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
			else																		//La pi�ce ne bouge pas
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
			if (diffLigne < 0 && diffColonne > 0)										//Diagonale en haut � droite
			{
				
						if(jeu[depart.getLigne() - 1][depart.getColonne() + 1].estOccupee())
						{
							return false;
						}
						
					
			
			}
			else if (diffLigne > 0 && diffColonne > 0)									//Diagonale en bas � droite
			{
				
					if(jeu[depart.getLigne() + 1][depart.getColonne() + 1].estOccupee())
					{
						return false;
					}
				
			}
			else if(diffLigne < 0 && diffColonne < 0)									//Diagonale en haut � gauche
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
		
		// On v�rifie si il y peut se d�placer au point d'arriv�e
		if(jeu[depart.getLigne()][depart.getColonne()].getPiece() instanceof Bombarde)
		{
					
			if (nombrePiecesEntre == 1 && jeu[arrivee.getLigne()][arrivee.getColonne()].estOccupeeAdversaire(couleurPieceDepart)) //Il y a exactement une pi�ce entre la bombarde et la pi�ce adverse
				return true;
			else if(nombrePiecesEntre == 0 && !jeu[arrivee.getLigne()][arrivee.getColonne()].estOccupee()) //Il n'y a aucune pi�ce sur le chemin et a l'arriv�e
				return true;
			else if (nombrePiecesEntre > 1) //Si il y a plus d'une pi�ce sur le chemin
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
	 * M�thode qui v�rifie la position du Roi noir
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
	 * M�thode qui v�rifie la position du Roi rouge
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
 * M�tode qui v�rifie que les rois ne sont pas face a face
 * @param depart Position d�part de la pi�ce
 * @param arrivee Position arriv� de la pi�ce
 * @return true ou false
 */
	public boolean roisNePouvantPasEtreFaceAFace(Position depart, Position arrivee) 
	{
		//D�termine la position des deux rois
		Position roiNoir = roiNoir();
		Position roiRouge = roiRouge();
		
		//Variable qui sert a savoir le nombre de pi�ce entre deux positions
		int nombreDePiece = 0;
		
		//Si la pi�ce est un roi ou pas, et sa couleur si c'est un roi
		boolean pieceRoi;
		String couleurRoi = null;
		
		//V�rifie si la pi�ce qui bouge est un roi
		if(jeu[depart.getLigne()][depart.getColonne()].getPiece() instanceof Roi)
		{
			pieceRoi = true;
			couleurRoi = jeu[depart.getLigne()][depart.getColonne()].getPiece().getCouleur();
		}
		else
			pieceRoi = false;
		
		
		if(pieceRoi) //Si la pi�ce qui bouge est un roi
		{
			if (roiRouge.getColonne() == roiNoir.getColonne())	//Si les deux Rois sont sur la m�me colonne
			{
				if (jeu[arrivee.getLigne()][arrivee.getColonne()].estOccupeeAdversaire(couleurRoi)) 	//Si la pi�ce qui bouge capture une pi�ce adverse
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
						if(nombreDePiece == 0) 			//Si il y a aucune pi�ce entre la pi�ce adverse et le roi d'en face
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
						
						if(nombreDePiece == 0)			//Si il y a aucune pi�ce entre la pi�ce adverse et le roi d'en face
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
					if(nombreDePiece == 0) //Si il y a aucune pi�ce entre les deux rois
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
					
					if(nombreDePiece == 0)  //Si il y a aucune pi�ce entre les deux rois
						return false;
					else 
						return true;
				}
				else 
					return true;
			}
		}
		else	//Si la pi�ce qui bouge n'est pas un roi
		{
			if(roiRouge.getColonne() == roiNoir.getColonne()) //Les rois sont face a face 
			{
				if(depart.getColonne() == roiRouge.getColonne()) //La pi�ce qui bouge est sur la colonne des deux rois
				{
					if(depart.getLigne() > roiNoir.getLigne() && depart.getLigne() < roiRouge.getLigne())	// la pi�ce qui bouge est entre les deux rois
					{
						if(arrivee.getColonne() == depart.getColonne()) //Si il reste sur la m�me colonne
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
							if(nombreDePiece == 1) //Si la seule pi�ce qui se trouve entre les deux rois est la pi�ce qui bouge a gauche ou a droite
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
