class Explosion 
{
    constructor(bombX, bombY, scale)
    {
        this.image = new TiledImage("images/explosion.png", 25, 1, 40, true, scale, null);
        this.image.setLooped(false);
        this.image.changeRow(0);				// One row per animation
        this.image.changeMinMaxInterval(0, 25); 	// Loop from which column to which column?
        this.left = bombX; 
        this.top = bombY - scale*50;	
    }

    tick()
    {
        let alive = true;

        
        if(this.image.imageCurrentRow == 23)
        {
            alive = false;
            
        }
        else
        {
            this.image.tick(this.left, this.top, ctx);
        }

		
    
        
        return alive;
    }
}