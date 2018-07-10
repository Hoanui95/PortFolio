package xiangqi;
/**
 * Classe qui détermine la position d'une pièce
 * @author Hoanui SARTORE-DEVASSE
 * @version Automne 2016
 */
public class Position 
{
/**
 * Ligne de la pièce
 */
private int ligne ; // de 0 à 9 voir schéma
/**
 * colonne de la pièce
 */
private int colonne; // de 0 à 8

/**
 * Constructeur d'une position d'une pièce
 * @param ligne position ligne de la pièce
 * @param colonne position colonne de la pièce
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