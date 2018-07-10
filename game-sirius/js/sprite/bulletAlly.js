class BulletAlly
{
    constructor(allyX, allyY, id)
    {
        this.image = new Image();
        this.image.src = "images/bulletAlly.png";

        this.left = allyX;
        this.top = allyY +60;
        this.speedX = id*1 + 7;
        this.speedY = id*1.5 + 2;
    }

    tick()
    {
        let alive = true;
        if(this.left  < (screen.width / 2 - 150))
        {
            this.left += this.speedX
            this.top += this.speedY;
            ctx.drawImage(this.image,  this.left, this.top);
        }
        else
        {
            alive = false;
        }
      

        return alive
    }
}