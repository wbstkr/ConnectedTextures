public final int TILESIZE = 30;

public SpriteSheet tile;
public int[] grid;
public boolean pmousePressed;


public void setup() {
    size(600, 600);
    
    tile = new SpriteSheet("tile.png", 16, 16);
    
    grid = new int[width / TILESIZE * height / TILESIZE];
    for (int num : grid) {
        num = -1;
    }
    
    pmousePressed = false;
    
    noSmooth();
}

public void draw() {
    background(0xFF000000);
    
    for (int i = 0; i < grid.length; i++) {
        if (grid[i] > 0) {
            float x = (i % (width / TILESIZE)) * TILESIZE;
            float y = (i / (width / TILESIZE)) * TILESIZE;
            tile.drawSprite(1, x, y, TILESIZE / 16.0);
        }
    }
    
    if (mousePressed && !pmousePressed) {
        grid[pointToGrid(mouseX, mouseY)] = 1;
    }
    pmousePressed = mousePressed;
}

public int pointToGrid(float x, float y) {
    return(int(y / TILESIZE) * int(width / TILESIZE)) + int(x / TILESIZE);
}