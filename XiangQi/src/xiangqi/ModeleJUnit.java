package xiangqi;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

public class ModeleJUnit {
	
	Char ch1;
	Char ch2;
	Roi r1;
	Roi r2;
	Mandarin m1;
	Mandarin m2;
	Pion p1;
	Pion p2;
	Cavalier c1;
	Cavalier c2;
	Elephant e1;
	Elephant e2;
	Bombarde b1; 
	Bombarde b2;
	
	@Before
	public void initialisation()
	{
		ch1 = new Char("Char1", "noir");
		ch2 = new Char("Char2", "rouge");
		r1 = new Roi("Roi1", "noir");
		r2 = new Roi("Roi2", "rouge");
		m1 = new Mandarin("Mandarin1", "noir");
		m2 = new Mandarin("Mandarin2", "rouge");
		p1 = new Pion("Pion1", "noir");
		p2 = new Pion("Pion2", "rouge");
		c1 = new Cavalier("Cavalier1", "noir");
		c2 = new Cavalier("Cavalier2", "rouge");
		e1 = new Elephant("Elephant1", "noir");
		e2 = new Elephant("Elephant2", "rouge");
		b1 = new Bombarde("Bombarde1", "noir");
		b2 = new Bombarde ("Bombarde2", "rouge");
	}
	//---------------CHAR--------------//
	@Test
	public void Char1()
	{
		Position depart = new Position(0, 1);
		Position arrivee = new Position(6,1);
		
		assertEquals(true, ch1.estValide(depart, arrivee));
	}
	
	@Test
	public void Char2()
	{
		Position depart = new Position(2, 3 );
		Position arrivee = new Position(2,6);
		
		assertEquals(true, ch1.estValide(depart, arrivee));
	}
	
	@Test
	public void Char3()
	{
		Position depart = new Position(8, 6 );
		Position arrivee = new Position(2,6);
		
		assertEquals(true, ch2.estValide(depart, arrivee));
	}
	
	@Test
	public void Char4()
	{
		Position depart = new Position(2, 3 );
		Position arrivee = new Position(2,3);
		
		assertEquals(true, ch1.estValide(depart, arrivee));
	}
	
	@Test
	public void Char5()
	{
		Position depart = new Position(2, 3 );
		Position arrivee = new Position(3,5);
		
		assertEquals(false, ch1.estValide(depart, arrivee));
	}
	

	//---------------BOMBARDE--------------//
	@Test
	public void Bombarde1()
	{
		Position depart = new Position(0, 1);
		Position arrivee = new Position(6,1);
		
		assertEquals(true, b1.estValide(depart, arrivee));
	}
	
	@Test
	public void Bombarde2()
	{
		Position depart = new Position(2, 3 );
		Position arrivee = new Position(2,6);
		
		assertEquals(true, b2.estValide(depart, arrivee));
	}
	
	@Test
	public void Bombarde3()
	{
		Position depart = new Position(8, 6 );
		Position arrivee = new Position(2,6);
		
		assertEquals(true, b1.estValide(depart, arrivee));
	}
	
	@Test
	public void Bombarde4()
	{
		Position depart = new Position(2, 3 );
		Position arrivee = new Position(2,3);
		
		assertEquals(true, b2.estValide(depart, arrivee));
	}
	
	@Test
	public void Bombarde5()
	{
		Position depart = new Position(2, 3 );
		Position arrivee = new Position(3,5);
		
		assertEquals(false, b1.estValide(depart, arrivee));
	}
	

	//---------------ROI--------------//
	@Test
	public void Roi1()
	{
		Position depart = new Position(0, 4 );
		Position arrivee = new Position(1,4);
		
		assertEquals(true, r1.estValide(depart, arrivee));
	}
	
	@Test
	public void Roi2()
	{
		Position depart = new Position(0, 5 );
		Position arrivee = new Position(0,4);
		
		assertEquals(true, r1.estValide(depart, arrivee));
	}
	
	@Test
	public void Roi3()
	{
		Position depart = new Position(0, 4 );
		Position arrivee = new Position(2,4);
		
		assertEquals(false, r1.estValide(depart, arrivee));
	}
	
	@Test
	public void Roi4()
	{
		Position depart = new Position(0, 3 );
		Position arrivee = new Position(0,2);
		
		assertEquals(false, r1.estValide(depart, arrivee));
	}
	
	@Test
	public void Roi5()
	{
		Position depart = new Position(0, 3 );
		Position arrivee = new Position(0,2);
		
		assertEquals(false, r2.estValide(depart, arrivee));
	}
	
	@Test
	public void Roi6()
	{
		Position depart = new Position(9, 4 );
		Position arrivee = new Position(9,3);
		
		assertEquals(true, r2.estValide(depart, arrivee));
	}
	
	@Test
	public void Roi7()
	{
		Position depart = new Position(8, 4 );
		Position arrivee = new Position(7,4);
		
		assertEquals(true, r2.estValide(depart, arrivee));
	}
	

	@Test
	public void Roi8()
	{
		Position depart = new Position(9, 5 );
		Position arrivee = new Position(9,3);
		
		assertEquals(false, r2.estValide(depart, arrivee));
	}
	
	@Test
	public void Roi9()
	{
		Position depart = new Position(9, 5 );
		Position arrivee = new Position(9,6);
		
		assertEquals(false, r2.estValide(depart, arrivee));
	}
	
	//---------------ELEPHANT--------------//
	@Test
	public void Elephant1()
	{
		Position depart = new Position(0, 2);
		Position arrivee = new Position(2,4);
		
		assertEquals(true, e1.estValide(depart, arrivee));
	}
	

	@Test
	public void Elephant2()
	{
		Position depart = new Position(2,4);
		Position arrivee = new Position(0, 2);
		
		assertEquals(true, e1.estValide(depart, arrivee));
	}
	
	@Test
	public void Elephant3()
	{
		Position depart = new Position(9,2);
		Position arrivee = new Position(7, 0);
		
		assertEquals(true, e2.estValide(depart, arrivee));
	}
	@Test
	public void Elephant4()
	{
		Position depart = new Position(7,4);
		Position arrivee = new Position(5, 6);
		
		assertEquals(true, e2.estValide(depart, arrivee));
	}
	@Test
	public void Elephant5()
	{
		Position depart = new Position(0,2);
		Position arrivee = new Position(4, 2);
		
		assertEquals(false, e1.estValide(depart, arrivee));
	}
	@Test
	public void Elephant6()
	{
		Position depart = new Position(0,6);
		Position arrivee = new Position(2, 3);
		
		assertEquals(false, e1.estValide(depart, arrivee));
	}
	
	@Test
	public void Elephant7()
	{
		Position depart = new Position(4,2);
		Position arrivee = new Position(6, 0);
		
		assertEquals(false, e1.estValide(depart, arrivee));
	}
	
	//---------------MANDARIN--------------//
	@Test
	public void Mandarin1()
	{
		Position depart = new Position(0,3);
		Position arrivee = new Position(1,4);
		
		assertEquals(true, m1.estValide(depart, arrivee));
	}
	
	@Test
	public void Mandarin2()
	{
		Position depart = new Position(1,4);
		Position arrivee = new Position(2,3);
		
		assertEquals(true, m1.estValide(depart, arrivee));
	}
	
	@Test
	public void Mandarin3()
	{
		Position depart = new Position(9,3);
		Position arrivee = new Position(8,4);
		
		assertEquals(true, m2.estValide(depart, arrivee));
	}
	@Test
	public void Mandarin4()
	{
		Position depart = new Position(7,5);
		Position arrivee = new Position(8,4);
		
		assertEquals(true, m2.estValide(depart, arrivee));
	}
	
	@Test
	public void Mandarin5()
	{
		Position depart = new Position(0,3);
		Position arrivee = new Position(1,2);
		
		assertEquals(false, m1.estValide(depart, arrivee));
	}
	@Test
	public void Mandarin6()
	{
		Position depart = new Position(0,3);
		Position arrivee = new Position(0,4);
		
		assertEquals(false, m1.estValide(depart, arrivee));
	}
	@Test
	public void Mandarin7()
	{
		Position depart = new Position(0,3);
		Position arrivee = new Position(0,5);
		
		assertEquals(false, m1.estValide(depart, arrivee));
	}
	
	
	
	//---------------CAVALIER--------------//
	@Test
	public void Cavalier1()
	{
		Position depart = new Position(0,1);
		Position arrivee = new Position(2,2);
		
		assertEquals(true, c1.estValide(depart, arrivee));
	}
	
	@Test
	public void Cavalier2()
	{
		Position depart = new Position(0,1);
		Position arrivee = new Position(2,0);
		
		assertEquals(true, c1.estValide(depart, arrivee));
	}
	
	@Test
	public void Cavalier3()
	{
		Position depart = new Position(9,1);
		Position arrivee = new Position(7,0);
		
		assertEquals(true, c2.estValide(depart, arrivee));
	}
	
	@Test
	public void Cavalier4()
	{
		Position depart = new Position(9,7);
		Position arrivee = new Position(7,8);
		
		assertEquals(true, c2.estValide(depart, arrivee));
	}
	
	@Test
	public void Cavalier5()
	{
		Position depart = new Position(0,1);
		Position arrivee = new Position(1,3);
		
		assertEquals(true, c1.estValide(depart, arrivee));
	}
	
	@Test
	public void Cavalier6()
	{
		Position depart = new Position(0,7);
		Position arrivee = new Position(0,7);
		
		assertEquals(true, c1.estValide(depart, arrivee));
	}
	
	
	//---------------PION--------------//
	@Test
	public void Pion1()
	{
		Position depart = new Position(4,0);
		Position arrivee = new Position(5,0);
		
		assertEquals(true, p1.estValide(depart, arrivee));
	}
	
	@Test
	public void Pion2()
	{
		Position depart = new Position(5,0);
		Position arrivee = new Position(5,1);
		
		assertEquals(true, p1.estValide(depart, arrivee));
	}
	
	@Test
	public void Pion3()
	{
		Position depart = new Position(5,0);
		Position arrivee = new Position(6,0);
		
		assertEquals(true, p1.estValide(depart, arrivee));
	}
	
	@Test
	public void Pion4()
	{
		Position depart = new Position(5,0);
		Position arrivee = new Position(6,1);
		
		assertEquals(false, p1.estValide(depart, arrivee));
	}
	
	@Test
	public void Pion5()
	{
		Position depart = new Position(4,0);
		Position arrivee = new Position(4,1);
		
		assertEquals(false, p1.estValide(depart, arrivee));
	}
	
	@Test
	public void Pion6() 
	{
		Position depart = new Position(4,0);
		Position arrivee = new Position(3,0);
		
		assertEquals(false, p1.estValide(depart, arrivee));
	}
	
	@Test
	public void Pion7()
	{
		Position depart = new Position(5,0);
		Position arrivee = new Position(4,0);
		
		assertEquals(true, p2.estValide(depart, arrivee));
	}
	
	@Test
	public void Pion8()
	{
		Position depart = new Position(4,0);
		Position arrivee = new Position(4,1);
		
		assertEquals(true, p2.estValide(depart, arrivee));
	}
	
	@Test
	public void Pion9()
	{
		Position depart = new Position(3,0);
		Position arrivee = new Position(4,0);
		
		assertEquals(false, p2.estValide(depart, arrivee));
	}
	
}