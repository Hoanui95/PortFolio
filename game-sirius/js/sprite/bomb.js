class Bomb 
{
    constructor(soldierX, soldierY)
    {
        this.image = new TiledImage("images/bomb.png", 30, 1, 40, true, 1.5, null);
        this.image.setLooped(false);
        this.image.changeRow(0);				// One row per animation
        this.image.changeMinMaxInterval(0,28); 	// Loop from which column to which column?
        this.left = soldierX + 35; 
        this.top = soldierY;
        this.speedX = 4;
        this.speedY = 6;
      
    
        
    }

    tick()
    {
        let alive = true;

        console.log(this.speedX);
        if(this.left < (screen.width / 2 - 150))
        {
           
            if(this.left < (screen.width / 2 - 150)/2)
            {
                this.top -= this.speedY;
            }
            else
            {  
                this.speedY = 8;
                this.speedX = 11;
                this.top += this.speedY;
            }
            
            this.left += this.speedX;

            this.image.tick(this.left, this.top, ctx);
        }
        else
        {
            ennemyIsAttack = true;
            alive = false;
        }

		
    
        
        return alive;
    }
}

