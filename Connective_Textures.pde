public SpriteSheet tile;
public int[] grid;

public void setup() {
    size(400, 400);
    
    tile = new SpriteSheet("tile.png", 16, 16);
    
    grid = new int[width / 20 * height / 20];
    for (int num : grid) {
        num = -1;
    }
}

public void draw() {
    background(0xFF000000);
    
    for (int i = 0; i < grid.length; i++) {
        if (grid[i] > 0) {
            float x = (i % (width / 20)) * 20;
            float y = (i / (width / 20)) * 20;
            tile.drawSprite(15, x, y, 20.0 / 16.0);
        }
    }
}

public int pointToGrid(float x, float y) { // TODO: fix indexing issues
    return int(((y / 20) * (width / 20)) + (x / 20));
}

public void mouseDragged() {
    grid[pointToGrid(mouseX, mouseY)] = 1;
}