package xiangqi;
/**
 * Classe qui sert à définir le déplacement d'une Pion
 * @author Hoanui SARTORE-DEVASSE
 * @version Automne 2016
 */
public class Pion extends Piece{

	/**
	 * Constructeur pour les objets pion
	 * @param nom nom de la pièce
	 * @param couleur couleur de la pièce
	 */
	public Pion(String nom, String couleur) 
	{
		super(nom, couleur);
		
	}
	
	/**
	 * méthode qui vérifie si le déplacement de la {@link Piece} est valide ou pas
	 * @param depart position de départ
	 * @param arrivee position d'arrivée
	 * @return si le déplacement est valide ou pas
	 * @see Piece#estValide(Position, Position)
	 * @see <a href=http://www.cvm.qc.ca/hoanuisartore> Site web </a>
	 * @see java.util.Calendar	
	 */
	public boolean estValide(Position depart, Position arrivee)
	{
		if(getCouleur() == "noir")
			if(Math.abs(norme(depart, arrivee)) == 1)
				if(depart.getLigne() < 5)
					if(arrivee.getLigne() == depart.getLigne() + 1) //Il ne peut que avancer d'une intersecrtion, il ne peut pas reculer
						return true;
					else 
						return false;
				else 
					if(arrivee.getLigne() == depart.getLigne() + 1) //Il se déplace differemment après qu'il dépasse la rivière
							return true;
					else if (arrivee.getColonne() == depart.getColonne() + 1)
						return true;
					else if (arrivee.getColonne() == depart.getColonne() - 1)
						return true;
					else 
						return false;
			else if (Math.abs(norme(depart, arrivee)) == 0) //Il bouge pas
				return true;
			else
				return false;
		else 
			if(Math.abs(norme(depart, arrivee)) == 1)
				if(depart.getLigne() >= 5 )
					if(arrivee.getLigne() == depart.getLigne() - 1) //Il ne peut que avancer d'une intersecrtion, il ne peut pas reculer
						return true;
					else 
						return false;
				else 
					if(arrivee.getLigne() == depart.getLigne() - 1) //Il se déplace differemment après qu'il dépasse la rivière
							return true;
					else if (arrivee.getColonne() == depart.getColonne() + 1)
						return true;
					else if (arrivee.getColonne() == depart.getColonne() - 1)
						return true;
					else 
						return false;
			else if (Math.abs(norme(depart, arrivee)) == 0) //Il bouge pas
				return true;
			else 
				return false;
			
	}

}
