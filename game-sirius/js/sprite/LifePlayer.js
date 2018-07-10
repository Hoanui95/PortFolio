class LifePlayer 
{
    constructor(){
		this.x = 50;
		this.y = 50;
        this.width = 250;
        this.height = 40;
	}

	tick()
	{
		let alive = true;
           
		ctx.fillStyle = "rgba(100,100,100,0.5)";
		ctx.fillRect(this.x, this.y,  this.width,  this.height);
		
		ctx.strokeStyle = "black";
		ctx.strokeRect(this.x, this.y,  this.width,  this.height);

		ctx.fillStyle = "red";
		ctx.fillRect(this.x, this.y, pourcentageLifePlayer * 2.5, this.height);
		
        return alive;
            
	}
}