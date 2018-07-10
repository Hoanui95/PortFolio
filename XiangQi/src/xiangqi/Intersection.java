package xiangqi;

public class Intersection {

	/**
	 * Constructeur pour un échiquier
	 */
	private Piece piece;
	
	/**
	 * Constructeur pour une intersection vide
	 */
	public Intersection()
	{
		
	}
	
	/**
	 * Constructeur pour une intersection avec une pièce
	 * @param piece Pièce a mettre a cet intersection
	 */
	public Intersection(Piece piece)
	{
		this.piece = piece;
	}
	
	/**
	 * Méthode pour savoir si l'intersection est occupée par une pièce
	 * @return true ou false
	 */
	public boolean estOccupee()
	{
		if (piece != null)
			return true;
		else 
			return false;
	}
	
	/**
	 * Méthode pour savoir si l'intersection est occupée par un adverssaire
	 * @param CouleurDepart couleur de la pièce de départ
	 * @return true ou false
	 */
	public boolean estOccupeeAdversaire(String CouleurDepart)
	{
		if (estOccupee())
		{
			if(piece.getCouleur() != CouleurDepart) //couleur opposée
				return true;
			else
				return false;
		}
		else
			return false;
	}
	/**
	 * Méthode pour savoir si l'intersection est occupée par une même couleur
	 * @param CouleurDepart couleur de départ de la pièce
	 * @return true ou false
	 */
	public boolean estOccupeeMêmeCouleur(String CouleurDepart)
	{
		if (estOccupee())
		{
			if(piece.getCouleur() == CouleurDepart) //même couleur
				return true;
			else
				return false;
		}
		else
			return false;
	}
	
	/**
	 * Méthode d'accès
	 * @return une pièce
	 */
	public Piece getPiece() {
		return piece;
	}

	/**
	 * Méthode de mutation
	 * @param piece
	 */
	public void setPiece(Piece piece) {
		this.piece = piece;
	}
	
	
}
