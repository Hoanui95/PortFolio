class BulletChar
{
    constructor(charX, charY, angle)
    {
        this.image = new TiledImage("images/bulletChar.png", 40, 1, 40, true, 1, null);
        this.image.changeRow(0);				// One row per animation
        this.image.changeMinMaxInterval(0, 38); 
        this.left = charX;
        this.top = charY;
        switch(angle)
        {
            case 1:
                this.speedX = -2;
                this.speedY = -4;
                break;
            case 2:
                this.speedX = 0;
                this.speedY = -4;
                break;
            case 3:
                this.speedX = 2;
                this.speedY = -4;
                break;
        }
    }

    tick()
    {
        let alive = true;
        if(this.image.imageCurrentCol == 37)
        {
            alive = false;
        }
        else if(this.image.imageCurrentCol < 14)
        {
            this.left += this.speedX;
            this.top += this.speedY;
           
        }
        this.image.tick(this.left, this.top, ctx)
        return alive;
    }
}