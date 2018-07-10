package xiangqi;
/**
 * Classe qui sert � d�finir le d�placement d'une Elephant
 * @author Hoanui SARTORE-DEVASSE
 * @version Automne 2016
 */
public class Elephant extends Piece {

	/**
	 * Constructeur pour les objets elephant
	 * @param nom nom de la pi�ce
	 * @param couleur couleur de la pi�ce
	 */
	public Elephant(String nom, String couleur) 
	{
		super(nom, couleur);
		
	}

	/**
	 * m�thode qui v�rifie si le d�placement de la {@link Piece} est valide ou pas
	 * @param depart position de d�part
	 * @param arrivee position d'arriv�e
	 * @return si le d�placement est valide ou pas
	 * @see Piece#estValide(Position, Position)
	 * @see <a href=http://www.cvm.qc.ca/hoanuisartore> Site web </a>
	 * @see java.util.Calendar	
	 */
	public boolean estValide(Position depart, Position arrivee) {
		if(getCouleur() == "noir")
			if(arrivee.getLigne() <= 4) //Il reste avant la rivi�re
					if(Math.abs(norme(depart, arrivee)) == 8 || Math.abs(norme(depart, arrivee)) == 0) //Il bouge de deux diagonales
						return true;
					else 
						return false;
			else 
				return false;
		else 
			if(arrivee.getLigne() >= 5) //Il reste avant la rivi�re
				if(Math.abs(norme(depart, arrivee)) == 8 || Math.abs(norme(depart, arrivee)) == 0) //Il bouge de deux diagonales
					return true;
				else 
					return false;
			else 
				return false;
	}

}
