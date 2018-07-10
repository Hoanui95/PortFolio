package xiangqi;
/**
 * Classe qui sert à définir le déplacement d'un Char
 * @author Hoanui SARTORE-DEVASSE
 * @version Automne 2016
 */
public class Char extends Piece {
	/**
	 * Constructeur pour les objets char
	 * @param nom nom de la pièce
	 * @param couleur couleur de la pièce
	 */
	public Char(String nom, String couleur)
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
	public boolean estValide (Position depart, Position arrivee)
	{
		if(depart.getColonne() == arrivee.getColonne()) //Il bouge a la verticale
			return true;
		else if (depart.getLigne() == arrivee.getLigne())  //Il bouge a l'horizontale
		{
			return true;
		}
		else 
			return false;
	}

}
