class Plane
{
    constructor()
    {
        this.image = new TiledImage("images/avion.png", 10, 1, 200, true, 2, null);
        this.image.setFlipped(true);
		this.image.changeRow(0);				// One row per animation
        this.image.changeMinMaxInterval(1, 4);
        this.left = 0; 
        this.top = 50;	// Loop from which column to which column?
        this.speedX = 10;
        this.count = 0;
        this.audioNuclearBomb = new Audio("sound/bombDrop.mp3");
    }

    tick()
    {
        let alive = true;

        if(this.left  > (screen.width / 2 - 320))
        {
            if(this.count == 0)
            {
                this.audioNuclearBomb.play();
                spriteList.push(new NuclearBomb(this.left, this.top));
                this.count += 1;
            }
            
        }

        if(this.left < screen.width)
        {
            this.left += this.speedX
            this.image.tick(this.left, this.top, ctx)
        }
        else    
        {
            alive = false;
        }

        
        return alive; 

    }
}