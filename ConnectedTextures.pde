public final int TILESIZE = 30;

public SpriteSheet tile;
public int rowSize;
public int[] grid;
public boolean pmousePressed;


public void setup() {
    size(600, 600);
    
    tile = new SpriteSheet("tile.png", 16, 16);
    
    rowSize = width / TILESIZE;
    grid = new int[rowSize * height / TILESIZE];
    for (int i = 0; i < grid.length; i++) {
        grid[i] = -1;
    }
    
    pmousePressed = false;
    
    noSmooth();
}

public void draw() {
    background(0xFF000000);
    
    for (int i = 0; i < grid.length; i++) {
        if (grid[i] > - 1) {
            float x = (i % rowSize) * TILESIZE;
            float y = (i / rowSize) * TILESIZE;
            tile.drawSprite(grid[i], x, y, TILESIZE / 16.0);
        }
    }
    
    if (mousePressed && !pmousePressed) {
        addTile(pointToGrid(mouseX, mouseY));
    }
    pmousePressed = mousePressed;
}

public int pointToGrid(float x, float y) {
    return(int(y / TILESIZE) * rowSize) + int(x / TILESIZE);
}

public void addTile(int index) {
    if (grid[index] == -1) {
        grid[index] = 0;
        if (!(index >= grid.length - rowSize) && grid[index + rowSize] > -1) {
            grid[index + rowSize] += 0b0001;
            grid[index] += 0b0100;
        }
        if (!(index % rowSize == 0) && grid[index - 1] > -1) {
            grid[index - 1] += 0b0010;
            grid[index] += 0b1000;
        }
        if (!(index < rowSize) && grid[index - rowSize] > -1) {
            grid[index - rowSize] += 0b0100;
            grid[index] += 0b0001;
        }
        if (!(index % rowSize == rowSize - 1) && grid[index + 1] > -1) {
            grid[index + 1] += 0b1000;
            grid[index] += 0b0010;
        }
    }
}
