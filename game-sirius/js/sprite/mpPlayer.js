class MpPlayer
{
    constructor()
    {
        this.x = 50;
		this.y = 120;
        this.width = 250;
        this.height = 10;
    }

    tick()
    {
        let alive = true;

        ctx.fillStyle = "rgba(100,100,100,0.5)";
		ctx.fillRect(this.x, this.y,  this.width,  this.height);
		
		ctx.strokeStyle = "black";
		ctx.strokeRect(this.x, this.y,  this.width,  this.height);

		ctx.fillStyle = "yellow";
        ctx.fillRect(this.x, this.y, pourcentageMp * 2.5, this.height);
        
        return alive;
    }
}