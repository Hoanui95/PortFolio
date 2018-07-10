class Parachute {
    constructor()
    {
        let columnCount = 4;
		let rowCount = 1;
		let refreshDelay = 200; 			// msec
		let loopColumns = true; 			// or by row?
		let scale = 3;
		this.image = new TiledImage("images/sprite parachute.png", columnCount, rowCount, refreshDelay, loopColumns, scale, null);
		this.image.changeRow(0);				// One row per animation
		this.image.changeMinMaxInterval(1, 4); 	// Loop from which column to which column?
        this.image.addImage("images/sprite platform.png")
        this.left = 0; 
        this.top = 140;	
        this.speedX = 1;
        this.speedY = 6;
    }

    tick()
    {
        let alive = true;

        if(this.top < 780)
        {
            this.left += this.speedX;
            this.top += this.speedY;
		    this.image.tick(  this.left, this.top, ctx)
        }
        else
        {
            alive = false;
        }
    
        
        return alive;
    }
}