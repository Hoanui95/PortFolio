class SoldierRight
{
    constructor()
    {
        this.image = new TiledImage("images/soldierLogin.png", 30, 7, 100, true, 1.8, null);
        this.left = screen.width / 2;
        this.top = 300;
        this.count = 0;
        
    }

    tick()
    {
        let alive = true;

        

        if(this.count == 100)
        {
            if(this.image.imageCurrentRow != 4)
            {
                    this.image.imageCurrentCol = 1;
            }
            this.image.tickRefreshInterval= 200;
            this.image.setLooped(false);
            this.image.changeRow(4);				// One row per animation
            this.image.changeMinMaxInterval(1, 13);
            if(this.image.imageCurrentCol == 12)
            {
                setTimeout(beginAttack, 500);
                this.count += 1;
            }
        }
        else if(moquer)
        {
            if(this.image.imageCurrentRow != 2)
            {
                    this.image.imageCurrentCol = 1;
            }
            this.image.tickRefreshInterval= 100;
            this.image.setLooped(true);
            this.image.changeRow(2);				// One row per animation
            this.image.changeMinMaxInterval(1, 11);    
          
        }
        else
        {
            this.image.resetCol;
            this.image.tickRefreshInterval= 250;
            this.image.setLooped(true);
            this.image.changeRow(3);				// One row per animation
            this.image.changeMinMaxInterval(1, 4);    
            this.count += 1;
        }
        
        
        this.image.tick(this.left, this.top, ctx);
       
        return alive;
    }

}

