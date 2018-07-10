package xiangqi;
/**
 * Classe qui sert à définir le déplacement d'un Mandarin
 * @author Hoanui SARTORE-DEVASSE
 * @version Automne 2016
 */
public class Mandarin extends Piece{

	/**
	 * Constructeur pour les objets mandarin
	 * @param nom nom de la pièce
	 * @param couleur couleur de la pièce
	 */
	public Mandarin(String nom, String couleur) 
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
			if(arrivee.getLigne() <= 2)
				if(arrivee.getColonne() >= 3 && arrivee.getColonne() <= 5)//Il reste dans son palais
					if(Math.abs(norme(depart, arrivee)) == 2 || Math.abs(norme(depart, arrivee)) == 0)//il bouge d'une diagonale ou reste sur place
						return true;
					else
						return false;
				else 
					return false;
			else 
				return false;
		else 
			if(arrivee.getLigne() >= 7)
				if(arrivee.getColonne() >= 3 && arrivee.getColonne() <= 5)//Il reste dans son palais
					if(Math.abs(norme(depart, arrivee)) == 2 || Math.abs(norme(depart, arrivee)) == 0)//il bouge d'une diagonale ou reste sur place
						return true;
					else 
							return false;
				else 
					return false;
			else 
				return false;

		
	}
	
}