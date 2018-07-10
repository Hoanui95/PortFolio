package xiangqi;

public class Intersection {

	/**
	 * Constructeur pour un �chiquier
	 */
	private Piece piece;
	
	/**
	 * Constructeur pour une intersection vide
	 */
	public Intersection()
	{
		
	}
	
	/**
	 * Constructeur pour une intersection avec une pi�ce
	 * @param piece Pi�ce a mettre a cet intersection
	 */
	public Intersection(Piece piece)
	{
		this.piece = piece;
	}
	
	/**
	 * M�thode pour savoir si l'intersection est occup�e par une pi�ce
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
	 * M�thode pour savoir si l'intersection est occup�e par un adverssaire
	 * @param CouleurDepart couleur de la pi�ce de d�part
	 * @return true ou false
	 */
	public boolean estOccupeeAdversaire(String CouleurDepart)
	{
		if (estOccupee())
		{
			if(piece.getCouleur() != CouleurDepart) //couleur oppos�e
				return true;
			else
				return false;
		}
		else
			return false;
	}
	/**
	 * M�thode pour savoir si l'intersection est occup�e par une m�me couleur
	 * @param CouleurDepart couleur de d�part de la pi�ce
	 * @return true ou false
	 */
	public boolean estOccupeeM�meCouleur(String CouleurDepart)
	{
		if (estOccupee())
		{
			if(piece.getCouleur() == CouleurDepart) //m�me couleur
				return true;
			else
				return false;
		}
		else
			return false;
	}
	
	/**
	 * M�thode d'acc�s
	 * @return une pi�ce
	 */
	public Piece getPiece() {
		return piece;
	}

	/**
	 * M�thode de mutation
	 * @param piece
	 */
	public void setPiece(Piece piece) {
		this.piece = piece;
	}
	
	
}
