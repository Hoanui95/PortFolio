class NuclearBombLogin
{
    constructor(planeX, planeY)
    {
        this.image = new TiledImage("images/nuclearBomb.png", 20, 1, 200, true, 1.3, null);
        this.image.setLooped(false);
        this.image.setFlipped(true);
        this.image.changeRow(0);				// One row per animation
        this.image.changeMinMaxInterval(0, 10); 	// Loop from which column to which column?
        this.left = planeX; 
        this.top = planeY;	
        this.speedX = -2;
        this.speedY = 7;
        this.audioExplosion = new Audio ("sound/explosion.mp3");
    }

    tick()
    {
        let alive = true;

        if(this.top < 360)
        {
            
            this.left += this.speedX;
            this.top += this.speedY;
            this.image.tick(this.left, this.top, ctx)
        }
        else
        {
            this.audioExplosion.play();
            spriteList.push(new Explosion(this.left, this.top, 1.3));
            alive = false;

            attackFinish = true;
            planeAttack = false;
            setTimeout(Moquer, 1000);   
        }

		
    
        
        return alive;
    }
}