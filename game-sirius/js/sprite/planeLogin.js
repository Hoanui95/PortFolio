class PlaneLogin
{
    constructor()
    {
        this.image = new TiledImage("images/avion.png", 10, 1, 200, true, 1.3, null);
		this.image.changeRow(0);				// One row per animation
        this.image.changeMinMaxInterval(1, 4);
        this.left = 1200; 
        this.top = 0;	// Loop from which column to which column?
        this.speedX = -10;
        this.audioNuclearBomb = new Audio("sound/bombDrop.mp3");
    }

    tick()
    {
        let alive = true;

        if(this.left == 370)
        {
            this.audioNuclearBomb.play();
            spriteList.push(new NuclearBombLogin(this.left, this.top)); 
        }

        if(this.left > 0)
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