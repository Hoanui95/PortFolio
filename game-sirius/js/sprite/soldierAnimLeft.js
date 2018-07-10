class SoldierLeft 
{
    constructor()
    {
        this.image = new TiledImage("images/soldierLogin.png", 30, 7, 100, true, 1.8, null);
		this.image.changeRow(1);				// One row per animation
        this.image.changeMinMaxInterval(1, 12);
        this.image.setFlipped(true);
        this.left = 100;
        this.top =300;
        this.speedX = 2;
    }

    tick()
    {
        let alive = true;

     
        if(planeAttack)
        {
            this.speedX =-2;
            this.left += this.speedX;
            
            this.image.resetCol;
            this.image.changeRow(0);				// One row per animation
            this.image.changeMinMaxInterval(1, 18);
            
        }
        else if(attackFinish)
        {
            if(this.image.imageCurrentRow != 6)
            {
                this.image.imageCurrentCol = 1;
            }

            
            this.image.tickRefreshInterval= 60;
            this.image.setLooped(false);
            this.image.changeRow(6);				// One row per animation
            this.image.changeMinMaxInterval(1, 12);
            if(this.image.imageCurrentCol == 11)
            {
                
                alive = false;
            }
            
        }
        else{
            this.left += this.speedX;
        }
   
        
        
        this.image.tick(this.left, this.top, ctx);
       
        return alive;
    }
}