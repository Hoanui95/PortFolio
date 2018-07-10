package xiangqi;

import java.awt.BorderLayout;
import java.awt.EventQueue;

import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.SwingConstants;
import javax.swing.border.EmptyBorder;
import javax.swing.JLabel;
import javax.swing.JOptionPane;

import java.awt.Font;
import javax.swing.JButton;
import javax.swing.border.LineBorder;


import java.awt.Color;
import java.awt.GridLayout;
import java.awt.Point;
import java.awt.Toolkit;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import javax.swing.UIManager;

public class FrameXiangQi extends JFrame {

	private ImageIcon Curseur = new ImageIcon("icones/curseur.png"); //image du curseur sans avoir choisi de pi�ce
	private JPanel contentPane;
	JPanel panelConteneur;
	JLabel labelImage, labelCouleur;
	JLabel grille[][]; //90 JLabels transparents s'apparentant aux intersections
	JPanel panelControle;
	JButton boutonDebuter, boutonRecommencer;
	Ecouteur ec;
	Echiquier echiquier; //�chiquier faisant le lien avec la logique du jeu
	private JPanel panelRouge;
	private JPanel panelNoir;
	

	
	
	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		try {
			UIManager.setLookAndFeel("com.sun.java.swing.plaf.windows.WindowsLookAndFeel");
		} catch (Throwable e) {
			e.printStackTrace();
		}
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					FrameXiangQi frame = new FrameXiangQi();
					frame.setVisible(true);
					frame.setDefaultCloseOperation(EXIT_ON_CLOSE);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 *constructeur
	 */
	public FrameXiangQi() {
		
		echiquier = new Echiquier(); //cr�ation de l'�chiquier et des 90 JLabels
		grille = new JLabel[10][9];
		setCursor(Toolkit.getDefaultToolkit().createCustomCursor(Curseur.getImage(), new Point(0,0), "cursor"));//Change l'ic�ne du curseur par d�faut 
		
		
		setTitle("XiangQi");
		setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		setBounds(100, 100, 944, 878);
		contentPane = new JPanel();
		contentPane.setBackground(new Color(255, 228, 196));
		contentPane.setBorder(new EmptyBorder(5, 5, 5, 5));
		setContentPane(contentPane);
		contentPane.setLayout(null);
		
		
		
		panelConteneur= new JPanel();
		panelConteneur.setBackground(new Color(255, 228, 196));
		panelConteneur.setBounds(26, 77, 670, 751);
		panelConteneur.setLayout(new GridLayout(10, 9, 0, 0));
		panelConteneur.setOpaque(false);
		contentPane.add(panelConteneur);
		
		labelImage= new JLabel("");
		labelImage.setBounds(30, 111, 690, 700);
		contentPane.add(labelImage);
		labelImage.setIcon(( new ImageIcon( "icones/fond2.png")));
		
		panelControle = new JPanel();
		panelControle.setBackground(new Color(255, 228, 196));
		panelControle.setBorder(new LineBorder(new Color(0, 0, 0), 1, true));
		panelControle.setBounds(0, 11, 918, 58);
		contentPane.add(panelControle);
		panelControle.setLayout(null);
		
		boutonRecommencer = new JButton("Recommencer");
		boutonRecommencer.setBounds(744, 22, 152, 23);
		boutonRecommencer.setBackground(new Color(255,239,213));
		boutonRecommencer.setContentAreaFilled(false);
		boutonRecommencer.setOpaque(true);
		panelControle.add(boutonRecommencer);
		boutonRecommencer.setFont(new Font("Tahoma", Font.BOLD, 15));
		
		boutonDebuter = new JButton("D\u00E9buter");
		boutonDebuter.setBackground(new Color(255, 239, 213));
		boutonDebuter.setBounds(610, 22, 119, 23);
		boutonDebuter.setContentAreaFilled(false);
		boutonDebuter.setOpaque(true);
		panelControle.add(boutonDebuter);
		boutonDebuter.setFont(new Font("Tahoma", Font.BOLD, 15));
		labelCouleur = new JLabel("");
		labelCouleur.setBackground(new Color(255, 239, 213));
		labelCouleur.setOpaque(true);
		labelCouleur.setBounds(53, 11, 475, 41);
		
		panelControle.add(labelCouleur);
		labelCouleur.setFont(new Font("Tahoma", Font.BOLD, 20));
		
		panelRouge = new JPanel();
		panelRouge.setBackground(new Color(255, 51, 51));
		panelRouge.setBounds(710, 77, 99, 751);
		contentPane.add(panelRouge);
		
		panelNoir = new JPanel();
		panelNoir.setBackground(new Color(0, 0, 51));
		panelNoir.setBounds(819, 77, 99, 751);
		contentPane.add(panelNoir);
		
		
		
		//gestion des �v�nements 
		ec = new Ecouteur();
		
		for ( int i = 0 ; i < 10 ; i ++ )
			for ( int j = 0 ; j < 9 ; j ++ )
			{
				grille[i][j] = new JLabel();
				grille[i][j].addMouseListener( ec );
				panelConteneur.add( grille[i][j]);
				grille[i][j].setHorizontalAlignment(SwingConstants.CENTER);
			}
		boutonDebuter.addMouseListener(ec);
		boutonRecommencer.addMouseListener(ec);
	
		
	

	}
	
	private class Ecouteur extends MouseAdapter
	{
		int ligneClic, colonneClic; //Dernier num�ro de ligne et colonne cliqu�
		Piece pieceTampon, pieceEnlevee; //Pi�ce 
		ImageIcon iconeTampon;
		Position depart, arrivee;
		String couleurControle; //valeur rouge ou noir ;
		JLabel pieceCaptur�e; //Sert � ajouter la pi�ce captur�e en dernier dans le panel noir ou roue
		
		//3cas a coder : cas de d�part et deux cas d'arriv�e(un quand il y a des cases vides et quand la case est occup� par un adverssaire 
	
		
		  
		
	

		@Override
		public void mouseReleased(MouseEvent e) {
			// TODO Auto-generated method stub
			
			//clique sur le bouton D�buter
			if ( e.getSource() == boutonDebuter)
			{
				
			echiquier.debuter();//Initialisation de l'�chiquier
			grille[0][0].setIcon((new ImageIcon("icones/charNoir.png")));
			grille[0][1].setIcon((new ImageIcon("icones/cavalierNoir.png")));
			grille[0][2].setIcon((new ImageIcon("icones/elephantNoir.png")));
			grille[0][3].setIcon((new ImageIcon("icones/mandarinNoir.png")));
			grille[0][4].setIcon((new ImageIcon("icones/roiNoir.png")));
			grille[0][5].setIcon((new ImageIcon("icones/mandarinNoir.png")));
			grille[0][6].setIcon((new ImageIcon("icones/elephantNoir.png")));
			grille[0][7].setIcon((new ImageIcon("icones/cavalierNoir.png")));
			grille[0][8].setIcon((new ImageIcon("icones/charNoir.png")));
			grille[3][0].setIcon((new ImageIcon("icones/pionNoir.png")));
			grille[2][1].setIcon((new ImageIcon("icones/bombardeNoir.png")));
			grille[3][2].setIcon((new ImageIcon("icones/pionNoir.png")));
			grille[3][4].setIcon((new ImageIcon("icones/pionNoir.png")));
			grille[3][6].setIcon((new ImageIcon("icones/pionNoir.png")));
			grille[2][7].setIcon((new ImageIcon("icones/bombardeNoir.png")));
			grille[3][8].setIcon((new ImageIcon("icones/pionNoir.png")));
			
			grille[9][0].setIcon((new ImageIcon("icones/charRouge.png")));
			grille[9][1].setIcon((new ImageIcon("icones/cavalierRouge.png")));
			grille[9][2].setIcon((new ImageIcon("icones/elephantRouge.png")));
			grille[9][3].setIcon((new ImageIcon("icones/mandarinRouge.png")));
			grille[9][4].setIcon((new ImageIcon("icones/roiRouge.png")));
			grille[9][5].setIcon((new ImageIcon("icones/mandarinRouge.png")));
			grille[9][6].setIcon((new ImageIcon("icones/elephantRouge.png")));
			grille[9][7].setIcon((new ImageIcon("icones/cavalierRouge.png")));
			grille[9][8].setIcon((new ImageIcon("icones/charRouge.png")));
			grille[6][0].setIcon((new ImageIcon("icones/pionRouge.png")));
			grille[7][1].setIcon((new ImageIcon("icones/bombardeRouge.png")));
			grille[6][2].setIcon((new ImageIcon("icones/pionRouge.png")));
			grille[6][4].setIcon((new ImageIcon("icones/pionRouge.png")));
			grille[6][6].setIcon((new ImageIcon("icones/pionRouge.png")));
			grille[7][7].setIcon((new ImageIcon("icones/bombardeRouge.png")));
			grille[6][8].setIcon((new ImageIcon("icones/pionRouge.png")));
			
			couleurControle = "noir";//C'est les noirs qui commence
			labelCouleur.setText("C'est au " + couleurControle + " de jouer");
			}
			else if ( e.getSource() == boutonRecommencer)
			{
				echiquier.recommencer();//efface toute les pi�ces de l'�chiquier et leurs ic�nes
				 for ( int i = 0; i < 10 ; i++ )
					 for ( int j = 0; j<9; j++ )
						 grille[i][j].setIcon(null);
			      
				 
				 labelCouleur.setText("");
				 
				 //Remet a zero les pi�ce captur�e dans les panels noir et rouge
				 panelNoir.removeAll();
				 panelNoir.revalidate();
				 panelNoir.repaint();
				 
				 panelRouge.removeAll();
				 panelRouge.revalidate();
				 panelRouge.repaint();
				 
			}
			else // il s'agit d'un label / intersection
			{
			    //trouver lequel
			    for ( int i = 0; i < 10 ; i++ )
			      {
			      for ( int j = 0; j<9; j++ )
			        {
			        if (e.getSource() == grille[i][j])
			          {
			          ligneClic = i;
			          colonneClic = j;
			          }
			        }
			      }
			      
			// CODER ICI #4
			    //Si on veut choisir une pi�ce pour la d�placer
			    if(pieceTampon == null && echiquier.getIntersection(ligneClic, colonneClic).estOccupeeM�meCouleur(couleurControle))
			    {
			    	depart = new Position(ligneClic, colonneClic);
			    	pieceTampon = echiquier.getIntersection(ligneClic, colonneClic).getPiece();
			    	iconeTampon = (ImageIcon) grille[ligneClic][colonneClic].getIcon();
			    	
			    	//enlever le tampon de son label d'origine
			    	 grille[ligneClic][colonneClic].setIcon(null);
			    	 setCursor(Toolkit.getDefaultToolkit().createCustomCursor(iconeTampon.getImage(), new Point(0,0), "cursor"));//On change l'ic�ne du curseur par l'ic�ne de la pi�ce qu'on bouge
			  
			   
			    }
			    //Si on a choisi une pi�ce mais qu'on  ne la bouge pas
			    else if(pieceTampon != null && ligneClic == depart.getLigne() && colonneClic == depart.getColonne())
			    {
			    	grille[depart.getLigne()][depart.getColonne()].setIcon(iconeTampon);
			    	pieceTampon = null;
			    	iconeTampon = null;
			    	setCursor(Toolkit.getDefaultToolkit().createCustomCursor(Curseur.getImage(), new Point(0,0), "cursor"));//On remet l'ic�ne du curseur initial
			    	
			    	
			    }
			    //Si on veut d�placer une pi�ce sur une case vide
			    else if(pieceTampon != null && !echiquier.getIntersection(ligneClic, colonneClic).estOccupee())
			    {
			    	arrivee = new Position(ligneClic, colonneClic);//On initialise la position d'arriv�e
			    	if(echiquier.getIntersection(depart.getLigne(), depart.getColonne()).getPiece().estValide(depart, arrivee))//Si le d�placement est valide
			    	{
			    		if(echiquier.cheminPossible(depart, arrivee))//Si le chemin est valide
			    		{
			    			if(echiquier.roisNePouvantPasEtreFaceAFace(depart, arrivee))//Si les rois ne se retrouvent pas face � face
			    			{
			    				echiquier.getIntersection(depart.getLigne(), depart.getColonne()).setPiece(null);//on enl�ve la pi�ce de d�part
			    				echiquier.getIntersection(arrivee.getLigne(), arrivee.getColonne()).setPiece(pieceTampon);//On place la pi�ce de d�part � la position d'arriv�e
			    				pieceTampon = null;
			    				grille[arrivee.getLigne()][arrivee.getColonne()].setIcon(iconeTampon);//On place l'ic�ne de la pi�ce de d�part a l'arriv�e
			    				iconeTampon = null;
			    				
			    				//Changement de joueur
			    				if(couleurControle == "noir")
			    					couleurControle = "rouge";
			    				else 
			    					couleurControle = "noir";
			    				
			    				//Indication pour le joueur qui doit jouer
			    				labelCouleur.setText("C'est au " + couleurControle + " de jouer");
			    				setCursor(Toolkit.getDefaultToolkit().createCustomCursor(Curseur.getImage(), new Point(0,0), "cursor"));
			    			}
			    		}
			    	}
			    }
			    //Si on veut d�place une pi�ce sur une case occup�e par l'adverssaire
			    else if(pieceTampon != null && echiquier.getIntersection(ligneClic, colonneClic).estOccupeeAdversaire(couleurControle))
			    {
			    	arrivee = new Position(ligneClic, colonneClic);
			    	if(echiquier.getIntersection(depart.getLigne(), depart.getColonne()).getPiece().estValide(depart, arrivee))
			    	{
			    		if(echiquier.cheminPossible(depart, arrivee))
			    		{
			    			if(echiquier.roisNePouvantPasEtreFaceAFace(depart, arrivee))
			    			{
			    				if(echiquier.getIntersection(ligneClic, colonneClic).getPiece() instanceof Roi)//Si la pi�ce captur�e est un roi
			    				{
			    					pieceCaptur�e = new JLabel(grille[ligneClic][colonneClic].getIcon());//On r�cup�re la pi�ce captur�e
			    					if(echiquier.getIntersection(arrivee.getLigne(), arrivee.getColonne()).getPiece().getCouleur() == "noir")
			    					{
			    						panelNoir.add(pieceCaptur�e);//On ajoute au panel correspondant, selon la couleur de la pi�ce captur�e
			    						labelCouleur.setText("ROUGE ONT GAGN�S");//Affiche un message pour le gagnant
		    						}
			    					else
		    						{
			    						panelRouge.add(pieceCaptur�e);
			    						labelCouleur.setText("NOIR ONT GAGN�S");
		    						}
			    					
			    					echiquier.getIntersection(depart.getLigne(), depart.getColonne()).setPiece(null);	
			    					echiquier.getIntersection(arrivee.getLigne(), arrivee.getColonne()).setPiece(pieceTampon);
			    					pieceTampon = null;
			    					grille[arrivee.getLigne()][arrivee.getColonne()].setIcon(iconeTampon);
			    					iconeTampon = null;
			    					
			    					couleurControle = "neutre";//On ne peut plus faire de d�placement
			    					JOptionPane.showMessageDialog(FrameXiangQi.this, "Cliquer sur le bouton Recomencer pour une autre partie","Message" , 
			    	                		JOptionPane.INFORMATION_MESSAGE);//Message qui invite le joueur a refaire une autre partie de Xiang Qi
			    					
			    				}
			    				else
			    				{
			    					pieceCaptur�e = new JLabel(grille[ligneClic][colonneClic].getIcon());
			    					if(echiquier.getIntersection(arrivee.getLigne(), arrivee.getColonne()).getPiece().getCouleur() == "noir")
			    					{
			    						panelNoir.add(pieceCaptur�e);
			    						couleurControle = "noir";//Changement de joueur
			    					}
			    					else
			    					{
			    						panelRouge.add(pieceCaptur�e);
			    						couleurControle = "rouge";//Changement de joueur
			    					}	
			    					
			    					echiquier.getIntersection(depart.getLigne(), depart.getColonne()).setPiece(null);		
			    					echiquier.getIntersection(arrivee.getLigne(), arrivee.getColonne()).setPiece(pieceTampon);
			    					pieceTampon = null;
			    					grille[arrivee.getLigne()][arrivee.getColonne()].setIcon(iconeTampon);
			    					iconeTampon = null;
			    					
			    					labelCouleur.setText("C'est au " + couleurControle + " de jouer");
			    				}
			    				setCursor(Toolkit.getDefaultToolkit().createCustomCursor(Curseur.getImage(), new Point(0,0), "cursor"));
			    			}
			    		}
			    	}
			    	
			    }
			    
			    
			            
			  }
			} // fin de la m�thode mouseReleased
			        
			      
	    }// fin de la classe Ecouteur
	}


			
		
		
	

