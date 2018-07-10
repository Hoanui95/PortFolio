class BulletEnnemy
{
    constructor(ennemyX, ennemyY)
    {
        this.image = new TiledImage("images/bullet.png", 30, 1, 100, true, 1, null);
        this.image.setLooped(false);
        this.image.changeRow(0);				// One row per animation
        this.image.changeMinMaxInterval(0, 1); 	// Loop from which column to which column?
        this.left = ennemyX -100; 
        this.top = ennemyY + 100;	
        this.speedX = -15;
    }

    tick()
    {
        let alive = true;

        if(this.left > 150)
        {
            this.left += this.speedX;
            this.image.tick(this.left, this.top, ctx);
        }
        else
        {
            
            playerIsAttack = true;
            
            alive = false;    
        }

        return alive;
    }
}