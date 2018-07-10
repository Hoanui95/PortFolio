package xiangqi;
/**
 * Interface pour la classe Echiquier
 * @author Hoanui SARTORE-DEVASSE
 * @version Automne 2016
 */

public interface MethodesEchiquier 
{
	public abstract void debuter();
	public abstract Intersection getIntersection( int ligne, int colonne );
	public abstract boolean cheminPossible ( Position  depart , Position arrivee);
	public abstract boolean roisNePouvantPasEtreFaceAFace ( Position depart,Position arrivee );
}
