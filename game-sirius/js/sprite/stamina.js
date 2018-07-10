class Stamina 
{
    constructor()
    {
        this.x = 50;
		this.y = 105;
        this.width = 250;
        this.height = 10;
    }

    tick()
    {
        let alive = true;

        if(pourcentageStamina < 100)
        {
            pourcentageStamina += 100/120; //2 secondes
        }
        ctx.fillStyle = "rgba(100,100,100,0.5)";
		ctx.fillRect(this.x, this.y,  this.width,  this.height);
		
		ctx.strokeStyle = "black";
		ctx.strokeRect(this.x, this.y,  this.width,  this.height);

		ctx.fillStyle = "rgba(50,50,200,0.5)";
		ctx.fillRect(this.x, this.y, pourcentageStamina * 2.5, this.height);

        return alive;
    }
}