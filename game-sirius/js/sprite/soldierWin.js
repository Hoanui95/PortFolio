class SoldierWin
{
    constructor()
    {
        this.image = new TiledImage("images/soldierLogin.png", 30, 7, 100, true, 2.3, null);
        this.left = 109;
        this.top =600;
    }

    tick()
    {
        let alive = true;

        if(this.image.imageCurrentRow != 2)
        {
            this.image.imageCurrentCol = 1;
        }
        this.image.tickRefreshInterval= 100;
        this.image.setFlipped(true);
        this.image.changeRow(2);				// One row per animation
        this.image.changeMinMaxInterval(1, 11);    

        this.image.tick(this.left, this.top, ctx);

        return alive;
    }
}