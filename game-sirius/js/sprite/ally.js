class Ally 
{
    constructor(id, name)
    {
        this.image = new TiledImage("images/ally.png", 10, 1, 100, true, 1.5, null);
        this.image.setFlipped(true);
		this.image.changeRow(0);				// One row per animation
        this.image.changeMinMaxInterval(1, 6);
        this.id = id;
        this.left = 0;
        this.top = (this.id * (-150)) + 450;
        this.speedX = 2;
        this.name = name;
        spriteList.push(new LifeAlly(this.top, this.id));
        this.audioAttack = new Audio ("sound/gun.mp3");
        
        this.audioHelico = new Audio ("sound/helicopter.mp3");
        this.audioHelico.play();
    }

    tick()
    {
        let alive = true;

        if(this.left  < 120)
        {
            this.left += this.speedX;
            
        }
        else if(allyAttack[this.id])
        {
            this.audioAttack.play();
            spriteList.push(new BulletAlly(this.left, this.top, this.id));
            allyAttack[this.id] = false;
           
        }
        
        this.image.tick(this.left, this.top, ctx);
        
        ctx.font = "20px Arial";
        ctx.fillText(this.name, this.left - 20, this.top +50); 

        return alive;
    }
}