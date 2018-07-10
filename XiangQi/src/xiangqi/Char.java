package xiangqi;
/**
 * Classe qui sert � d�finir le d�placement d'un Char
 * @author Hoanui SARTORE-DEVASSE
 * @version Automne 2016
 */
public class Char extends Piece {
	/**
	 * Constructeur pour les objets char
	 * @param nom nom de la pi�ce
	 * @param couleur couleur de la pi�ce
	 */
	public Char(String nom, String couleur)
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
