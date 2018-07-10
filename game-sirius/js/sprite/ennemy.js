class Ennemy
{
    constructor()
    {
        this.image = new TiledImage("images/ennemy.png", 15, 5, 180, true, 2, null);
        this.image.setFlipped(true);
        this.image.setLooped(false);
		this.image.changeRow(0);				// One row per animation
        this.image.changeMinMaxInterval(1, 11);
        this.left = screen.width / 2 ; 
        this.top = 580;	// Loop from which column to which column?
        this.speedX = -2;
        this.reloadGunEnnemy = false;
        this.count = 0;
        this.audioGun = new Audio("sound/gun.mp3");
        this.audioAttacked = new Audio("sound/attacked.mp3");
     
    }

    tick()
    {
        let alive = true;

            if(this.left > (screen.width / 2 - 150))
            {
                this.left += this.speedX;
            }
            else if(youWin)
            {
                if(this.image.imageCurrentRow != 4)
                {
                    this.image.imageCurrentCol = 1;
                }
                
                this.image.setLooped(false);
                this.image.changeRow(4);				// One row per animation
                this.image.changeMinMaxInterval(1, 8);  
            }
            else if(ennemyIsAttack)
            {
                if(this.image.imageCurrentRow != 4)
                {
                    this.image.imageCurrentCol = 1;
                    this.audioAttacked.play();
                }

                if(this.image.imageCurrentRow == 4 && this.image.imageCurrentCol == 9)
                {
                    ennemyIsAttack = false;
                }
                else
                {
                    this.image.setLooped(false);
                    this.image.changeRow(4);				// One row per animation
                    this.image.changeMinMaxInterval(1, 10);   
                }
              
            }
            else if(ennemyAttack)
            {
                if(this.image.imageCurrentRow != 2)
                {
                    this.image.imageCurrentCol = 1;
                }
                
                if(this.image.imageCurrentRow == 2)
                {
                   if(this.image.imageCurrentCol == 1)
                   {
                       if(this.count == 0)
                       {
                            this.audioGun.play();
                            spriteList.push(new BulletEnnemy(this.left, this.top));
                            this.count += 1;
                       }
                   }
                   else if(this.image.imageCurrentCol == 3)
                   {
                        if(this.count == 1)
                        {
                            spriteList.push(new BulletEnnemy(this.left, this.top));
                            this.count += 1;
                        }
                   }
                   else if(this.image.imageCurrentCol == 5)
                   {
                        if(this.count == 2)
                        {
                            this.audioGun.play();
                            spriteList.push(new BulletEnnemy(this.left, this.top));
                            this.count += 1;
                        }
                   }
                   else if(this.image.imageCurrentCol == 7)
                   {
                        ennemyAttack = false;
                        this.reloadGunEnnemy = true;
                        this.image.imageCurrentCol = 1;
                        this.count = 0;
                   }
                }
                else
                {
                    if(this.image.imageCurrentRow != 2)
                    {
                        this.image.imageCurrentCol = 1;
                    }
                    this.image.tickRefreshInterval = 150;
                    this.image.setLooped(false);
                    this.image.changeRow(2);				// One row per animation
                    this.image.changeMinMaxInterval(1, 8);
                }
                
            }
            else if(this.reloadGunEnnemy)
            {
                if(this.image.imageCurrentRow != 3)
                {
                    this.image.imageCurrentCol = 1;
                }

                if(this.image.imageCurrentRow == 3 && this.image.imageCurrentCol == 8)
                {
                    this.reloadGunEnnemy = false;
                }
                else
                {
                    this.image.changeRow(3);				// One row per animation
                    this.image.changeMinMaxInterval(1, 9);   
                }
              
            }
            else
            {
                if(this.image.imageCurrentRow != 1)
                {
                    this.image.imageCurrentCol = 1;
                }
                this.image.tickRefreshInterval = 200;
                this.image.setLooped(true);
                this.image.changeRow(1);				// One row per animation
                this.image.changeMinMaxInterval(1, 5);
                
            }
          
        this.image.tick(this.left, this.top, ctx);

        return alive;
    }
}