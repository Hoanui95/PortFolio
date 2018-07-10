class Char 
{
    constructor()
    {
        this.image = new TiledImage("images/char.png", 20, 3, 100, true, 1.3, null);
        this.image.setFlipped(true);
        this.image.changeRow(0);				// One row per animation
        this.image.changeMinMaxInterval(0, 4); 
        this.left = 900;
        this.top = 170;
        this.speedX = -0.2;
        this.speedY = 0.1;
        this.angle = 3;
        this.count = 0;
    }

    tick()
    {
        let alive = true;
        if(moquer || attackFinish)
        {
            if(this.image.imageCurrentRow != 2)
            {
                this.image.imageCurrentCol = 1;
            }

            this.image.setLooped(true);
            this.image.tickRefreshInterval= 200;
            this.image.changeRow(2);				// One row per animation
            this.image.changeMinMaxInterval(0, 6); 
            if(this.count == 20)
            {
                spriteList.push(new BulletChar(this.left, this.top, this.angle));
                this.angle -= 1;
                if( this.angle == -1)
                {
                    this.angle = 3;
                }
                this.count = 0;
            }
            else
            {
                this.count += 1
            }
            
        }
        else if(planeAttack)
        {
             if(this.image.imageCurrentRow != 1)
            {
                this.image.imageCurrentCol = 1;
            }
            this.image.setLooped(false);
            this.image.tickRefreshInterval= 150;
            this.image.changeRow(1);				// One row per animation
            this.image.changeMinMaxInterval(0, 14); 
        }
        else{
            this.left += this.speedX;
            this.top += this.speedY;
        }
        this.image.tick(this.left, this.top, ctx);
        
        return alive;
    }
}