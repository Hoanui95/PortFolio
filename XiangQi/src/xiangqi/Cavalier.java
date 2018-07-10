package xiangqi;
/**
 * Classe qui sert à définir le déplacement d'un Cavalier
 * @author Hoanui SARTORE-DEVASSE
 * @version Automne 2016
 */
public class Cavalier extends Piece{
	/**
	 * Constructeur pour les objets cavalier
	 * @param nom nom de la pièce
	 * @param couleur couleur de la pièce
	 */
	public Cavalier(String nom, String couleur) 
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
		
		if (Math.abs(norme(depart, arrivee)) == 5 || Math.abs(norme(depart, arrivee)) == 0) //Il reste sur place, ou bouge d'une intersection et d'une diagonale 
			return true;
		else 
			return false;
			
	}
}
