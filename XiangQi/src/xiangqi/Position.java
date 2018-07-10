package xiangqi;
/**
 * Classe qui d�termine la position d'une pi�ce
 * @author Hoanui SARTORE-DEVASSE
 * @version Automne 2016
 */
public class Position 
{
/**
 * Ligne de la pi�ce
 */
private int ligne ; // de 0 � 9 voir sch�ma
/**
 * colonne de la pi�ce
 */
private int colonne; // de 0 � 8

/**
 * Constructeur d'une position d'une pi�ce
 * @param ligne position ligne de la pi�ce
 * @param colonne position colonne de la pi�ce
 */
  public Position(int ligne, int colonne)
  {
  this.ligne = ligne;
  this.colonne= colonne;
  }

  public int getLigne ()
  {
  return ligne;
  }

  public int getColonne ()
  {
  return colonne;
  }

  public void setLigne (int ligne)
  {
  this.ligne = ligne;
  }

  public void setColonne ( int colonne )
  {
  this.colonne = colonne;
  }
 
}