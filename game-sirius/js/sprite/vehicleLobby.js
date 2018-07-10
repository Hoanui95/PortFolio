class VehicleLobby
{
    constructor(image, flip, scale, column, top)
    {
        
        this.image = new TiledImage("images/" + image, 15, 1, 100, true, scale, null);
        this.image.changeRow(0);				// One row per animation
        this.image.changeMinMaxInterval(1, column);
        this.image.setFlipped(flip);
        this.left = 0;
        this.top = top;
        this.speedX = 2;
    }

    tick()
    {

        let alive = true;

        if(this.left < screen.width)
        {
            this.left += this.speedX;
        }
        else{
            alive = false;
        }

        this.image.tick(this.left, this.top, ctx);

        return alive;
    }
}