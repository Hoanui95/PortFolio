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

	private ImageIcon Curseur = new ImageIcon("icones/curseur.png"); //image du curseur sans avoir choisi de pièce
	private JPanel contentPane;
	JPanel panelConteneur;
	JLabel labelImage, labelCouleur;
	JLabel grille[][]; //90 JLabels transparents s'apparentant aux intersections
	JPanel panelControle;
	JButton boutonDebuter, boutonRecommencer;
	Ecouteur ec;
	Echiquier echiquier; //échiquier faisant le lien avec la logique du jeu
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
		
		echiquier = new Echiquier(); //création de l'échiquier et des 90 JLabels
		grille = new JLabel[10][9];
		setCursor(Toolkit.getDefaultToolkit().createCustomCursor(Curseur.getImage(), new Point(0,0), "cursor"));//Change l'icône du curseur par défaut 
		
		
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
		
		
		
		//gestion des événements 
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
		int ligneClic, colonneClic; //Dernier numéro de ligne et colonne cliqué
		Piece pieceTampon, pieceEnlevee; //Pièce 
		ImageIcon iconeTampon;
		Position depart, arrivee;
		String couleurControle; //valeur rouge ou noir ;
		JLabel pieceCapturée; //Sert à ajouter la pièce capturée en dernier dans le panel noir ou roue
		
		//3cas a coder : cas de départ et deux cas d'arrivée(un quand il y a des cases vides et quand la case est occupé par un adverssaire 
	
		
		  
		
	

		@Override
		public void mouseReleased(MouseEvent e) {
			// TODO Auto-generated method stub
			
			//clique sur le bouton Débuter
			if ( e.getSource() == boutonDebuter)
			{
				
			echiquier.debuter();//Initialisation de l'échiquier
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
				echiquier.recommencer();//efface toute les pièces de l'échiquier et leurs icônes
				 for ( int i = 0; i < 10 ; i++ )
					 for ( int j = 0; j<9; j++ )
						 grille[i][j].setIcon(null);
			      
				 
				 labelCouleur.setText("");
				 
				 //Remet a zero les pièce capturée dans les panels noir et rouge
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
			    //Si on veut choisir une pièce pour la déplacer
			    if(pieceTampon == null && echiquier.getIntersection(ligneClic, colonneClic).estOccupeeMêmeCouleur(couleurControle))
			    {
			    	depart = new Position(ligneClic, colonneClic);
			    	pieceTampon = echiquier.getIntersection(ligneClic, colonneClic).getPiece();
			    	iconeTampon = (ImageIcon) grille[ligneClic][colonneClic].getIcon();
			    	
			    	//enlever le tampon de son label d'origine
			    	 grille[ligneClic][colonneClic].setIcon(null);
			    	 setCursor(Toolkit.getDefaultToolkit().createCustomCursor(iconeTampon.getImage(), new Point(0,0), "cursor"));//On change l'icône du curseur par l'icône de la pièce qu'on bouge
			  
			   
			    }
			    //Si on a choisi une pièce mais qu'on  ne la bouge pas
			    else if(pieceTampon != null && ligneClic == depart.getLigne() && colonneClic == depart.getColonne())
			    {
			    	grille[depart.getLigne()][depart.getColonne()].setIcon(iconeTampon);
			    	pieceTampon = null;
			    	iconeTampon = null;
			    	setCursor(Toolkit.getDefaultToolkit().createCustomCursor(Curseur.getImage(), new Point(0,0), "cursor"));//On remet l'icône du curseur initial
			    	
			    	
			    }
			    //Si on veut déplacer une pièce sur une case vide
			    else if(pieceTampon != null && !echiquier.getIntersection(ligneClic, colonneClic).estOccupee())
			    {
			    	arrivee = new Position(ligneClic, colonneClic);//On initialise la position d'arrivée
			    	if(echiquier.getIntersection(depart.getLigne(), depart.getColonne()).getPiece().estValide(depart, arrivee))//Si le déplacement est valide
			    	{
			    		if(echiquier.cheminPossible(depart, arrivee))//Si le chemin est valide
			    		{
			    			if(echiquier.roisNePouvantPasEtreFaceAFace(depart, arrivee))//Si les rois ne se retrouvent pas face à face
			    			{
			    				echiquier.getIntersection(depart.getLigne(), depart.getColonne()).setPiece(null);//on enlève la pièce de départ
			    				echiquier.getIntersection(arrivee.getLigne(), arrivee.getColonne()).setPiece(pieceTampon);//On place la pièce de départ à la position d'arrivée
			    				pieceTampon = null;
			    				grille[arrivee.getLigne()][arrivee.getColonne()].setIcon(iconeTampon);//On place l'icône de la pièce de départ a l'arrivée
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
			    //Si on veut déplace une pièce sur une case occupée par l'adverssaire
			    else if(pieceTampon != null && echiquier.getIntersection(ligneClic, colonneClic).estOccupeeAdversaire(couleurControle))
			    {
			    	arrivee = new Position(ligneClic, colonneClic);
			    	if(echiquier.getIntersection(depart.getLigne(), depart.getColonne()).getPiece().estValide(depart, arrivee))
			    	{
			    		if(echiquier.cheminPossible(depart, arrivee))
			    		{
			    			if(echiquier.roisNePouvantPasEtreFaceAFace(depart, arrivee))
			    			{
			    				if(echiquier.getIntersection(ligneClic, colonneClic).getPiece() instanceof Roi)//Si la pièce capturée est un roi
			    				{
			    					pieceCapturée = new JLabel(grille[ligneClic][colonneClic].getIcon());//On récupère la pièce capturée
			    					if(echiquier.getIntersection(arrivee.getLigne(), arrivee.getColonne()).getPiece().getCouleur() == "noir")
			    					{
			    						panelNoir.add(pieceCapturée);//On ajoute au panel correspondant, selon la couleur de la pièce capturée
			    						labelCouleur.setText("ROUGE ONT GAGNÉS");//Affiche un message pour le gagnant
		    						}
			    					else
		    						{
			    						panelRouge.add(pieceCapturée);
			    						labelCouleur.setText("NOIR ONT GAGNÉS");
		    						}
			    					
			    					echiquier.getIntersection(depart.getLigne(), depart.getColonne()).setPiece(null);	
			    					echiquier.getIntersection(arrivee.getLigne(), arrivee.getColonne()).setPiece(pieceTampon);
			    					pieceTampon = null;
			    					grille[arrivee.getLigne()][arrivee.getColonne()].setIcon(iconeTampon);
			    					iconeTampon = null;
			    					
			    					couleurControle = "neutre";//On ne peut plus faire de déplacement
			    					JOptionPane.showMessageDialog(FrameXiangQi.this, "Cliquer sur le bouton Recomencer pour une autre partie","Message" , 
			    	                		JOptionPane.INFORMATION_MESSAGE);//Message qui invite le joueur a refaire une autre partie de Xiang Qi
			    					
			    				}
			    				else
			    				{
			    					pieceCapturée = new JLabel(grille[ligneClic][colonneClic].getIcon());
			    					if(echiquier.getIntersection(arrivee.getLigne(), arrivee.getColonne()).getPiece().getCouleur() == "noir")
			    					{
			    						panelNoir.add(pieceCapturée);
			    						couleurControle = "noir";//Changement de joueur
			    					}
			    					else
			    					{
			    						panelRouge.add(pieceCapturée);
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
			} // fin de la méthode mouseReleased
			        
			      
	    }// fin de la classe Ecouteur
	}


			
		
		
	

