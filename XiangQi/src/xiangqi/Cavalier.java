package xiangqi;
/**
 * Classe qui sert � d�finir le d�placement d'un Cavalier
 * @author Hoanui SARTORE-DEVASSE
 * @version Automne 2016
 */
public class Cavalier extends Piece{
	/**
	 * Constructeur pour les objets cavalier
	 * @param nom nom de la pi�ce
	 * @param couleur couleur de la pi�ce
	 */
	public Cavalier(String nom, String couleur) 
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
		
		if (Math.abs(norme(depart, arrivee)) == 5 || Math.abs(norme(depart, arrivee)) == 0) //Il reste sur place, ou bouge d'une intersection et d'une diagonale 
			return true;
		else 
			return false;
			
	}
}
