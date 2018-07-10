class LifeAlly 
{
    constructor(allyY, id)
    {
        this.idLife = id;
        this.x = -15;
		this.y = allyY + 20;
        this.width = 150;
        this.height = 4;
        this.speedX = 2;
	}

	tick()
	{
        let alive = true;
        if(this.x  < 100)
        {
            this.x += this.speedX;
            
        }
           
		ctx.fillStyle = "rgba(100,100,100,0.5)";
		ctx.fillRect(this.x, this.y,  this.width,  this.height);
		
		ctx.strokeStyle = "black";
		ctx.strokeRect(this.x, this.y,  this.width,  this.height);

		ctx.fillStyle = "red";
		ctx.fillRect(this.x, this.y, pourcentageLifeAlly[this.idLife] * 1.5, this.height);
		
        return alive;
            
	}
}