package xiangqi;
/**
 * Classe qui sert à définir le déplacement d'une Elephant
 * @author Hoanui SARTORE-DEVASSE
 * @version Automne 2016
 */
public class Elephant extends Piece {

	/**
	 * Constructeur pour les objets elephant
	 * @param nom nom de la pièce
	 * @param couleur couleur de la pièce
	 */
	public Elephant(String nom, String couleur) 
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
	public boolean estValide(Position depart, Position arrivee) {
		if(getCouleur() == "noir")
			if(arrivee.getLigne() <= 4) //Il reste avant la rivière
					if(Math.abs(norme(depart, arrivee)) == 8 || Math.abs(norme(depart, arrivee)) == 0) //Il bouge de deux diagonales
						return true;
					else 
						return false;
			else 
				return false;
		else 
			if(arrivee.getLigne() >= 5) //Il reste avant la rivière
				if(Math.abs(norme(depart, arrivee)) == 8 || Math.abs(norme(depart, arrivee)) == 0) //Il bouge de deux diagonales
					return true;
				else 
					return false;
			else 
				return false;
	}

}
