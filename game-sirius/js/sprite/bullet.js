class Bullet 
{
    constructor(soldierX, soldierY)
    {
        this.image = new TiledImage("images/bullet.png", 30, 1, 100, true, 1, null);
        this.image.setLooped(false);
        this.image.changeRow(0);				// One row per animation
        this.image.changeMinMaxInterval(0, 1); 	// Loop from which column to which column?
        this.left = soldierX +10; 
        this.top = soldierY +20;	
        this.speedX = 15;
    }

    tick()
    {
        let alive = true;

        
        if(this.left < (screen.width / 2 - 150))
        {
            this.left += this.speedX;
            this.image.tick(this.left, this.top, ctx);
        }
        else
        {
            if(ennemyAttack == false)
            {
                ennemyIsAttack = true;
            }
           
            alive = false;    
        }

	
        return alive;
    }
}