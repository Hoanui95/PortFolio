class Soldier 
{
    constructor()
    {
       
		this.image = new TiledImage("images/soldier.png", 25, 5, 200, true, 2.5, null);
		this.image.changeRow(0);				// One row per animation
        this.image.changeMinMaxInterval(1, 20);
        this.left = 0; 
        this.top = 0;	// Loop from which column to which column?
        this.speedX = 1;
        this.speedY = 6;
        this.lanceBomb = false;
        this.count1 = 0;
        this.count2 = 0;
        this.audioGun = new Audio("sound/gun.mp3");
        this.audioAttacked = new Audio ("sound/attacked.mp3");
        this.audioBomb = new Audio("sound/bomb.mp3");
        this.audioPlane = new Audio("sound/plane.mp3");
    }

    tick()
    {
        let alive = true;
        
        if(this.top < 650)
        {
            this.left += this.speedX;
            this.top += this.speedY;
           
        }
        else{
            if(youWin)
            { 
                alive = false;
                spriteList.push(new SoldierWin());
            }
            else if(youLose)
            {
                if(this.image.imageCurrentRow != 4)
                {
                    this.image.imageCurrentCol = 1;
                }
                this.image.setLooped(false); 
                this.image.setFlipped(true); 
                this.image.tickRefreshInterval = 100;
                this.image.changeRow(4);				// One row per animation
                this.image.changeMinMaxInterval(1, 14);  
                
            }
            else if(normal)
            {
                if(this.image.imageCurrentRow != 1)
                {
                    this.image.imageCurrentCol = 1;
                }

                if(this.image.imageCurrentRow == 1)
                {
                    if(this.image.imageCurrentCol == 24)
                    {
                        normal = false;
                        this.count1 = 0;
                        this.count2 = 0;
                    }
                    else if(this.image.imageCurrentCol == 19)
                    {
                        if(this.count1 == 0)
                        {
                            this.count1 += 1;
                            this.audioGun.play();                        
                            spriteList.push(new Bullet(this.left, this.top));
                        }
                    }
                    else if(this.image.imageCurrentCol == 21)
                    {
                        if(this.count2 == 0)
                        {
                            this.count2 += 1;                           
                            spriteList.push(new Bullet(this.left, this.top));
                        }
                    }
                }
                else{
                    this.image.tickRefreshInterval = 70;
                    this.image.setLooped(false); 
                    this.image.changeRow(1);				// One row per animation
                    this.image.changeMinMaxInterval(0, 25);
                }
            }
            else if(special1)
            {
                if(this.image.imageCurrentRow != 3)
                {
                    this.image.imageCurrentCol = 1;
                    this.audioBomb.play();
                }
                
                if (this.image.imageCurrentRow == 3 && this.image.imageCurrentCol == 13)
                {
                    if(this.lanceBomb == false)
                    {
                        spriteList.push(new Bomb(this.left, this.top));
                        this.lanceBomb = true;
                    }
                    
                }
                else if(this.image.imageCurrentRow == 3 && this.image.imageCurrentCol == 17)
                {
                    special1 = false;
                    this.lanceBomb = false;
                }
                else 
                {
                    this.image.tickRefreshInterval = 80;
                    this.image.setLooped(false);
                    this.image.setFlipped(false);
                    this.image.changeRow(3);				// One row per animation
                    this.image.changeMinMaxInterval(1, 18);
                }      
            }
            else if(special2)
            {
                this.audioPlane.play();
                spriteList.push(new Plane());
                special2 = false;
            }
            else if(playerIsAttack)
            {
                if(this.image.imageCurrentRow != 4)
                {
                    this.image.imageCurrentCol = 1;
                    this.audioAttacked.play();
                }

                if(this.image.imageCurrentRow == 4 && this.image.imageCurrentCol == 13)
                {
                    playerIsAttack = false;
                }
                else{
                    this.image.setLooped(false); 
                    this.image.setFlipped(true); 
                    this.image.tickRefreshInterval = 100;
                    this.image.changeRow(4);				// One row per animation
                    this.image.changeMinMaxInterval(1, 14);  
                }
                

            }
            else
            {
                if(this.image.imageCurrentRow != 2)
                {
                    this.image.imageCurrentCol = 1;
                }
                this.image.setLooped(true); 
                this.image.setFlipped(true); 
                this.image.tickRefreshInterval = 100;
                this.image.changeRow(2);				// One row per animation
                this.image.changeMinMaxInterval(1, 14);
            }
        }

        
        this.image.tick(this.left, this.top, ctx)
        
        
        return alive;
    }
}