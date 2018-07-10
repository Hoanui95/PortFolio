package xiangqi;
/**
 * Classe qui sert � d�finir le d�placement d'une Pion
 * @author Hoanui SARTORE-DEVASSE
 * @version Automne 2016
 */
public class Pion extends Piece{

	/**
	 * Constructeur pour les objets pion
	 * @param nom nom de la pi�ce
	 * @param couleur couleur de la pi�ce
	 */
	public Pion(String nom, String couleur) 
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
					if(arrivee.getLigne() == depart.getLigne() + 1) //Il se d�place differemment apr�s qu'il d�passe la rivi�re
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
					if(arrivee.getLigne() == depart.getLigne() - 1) //Il se d�place differemment apr�s qu'il d�passe la rivi�re
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
