public PImage[] tiles;
public int[] grid;

public void setup() {
    size(400, 400);
    tiles = initSpriteSheet("tile");
    grid = new int[width / 20 * height / 20];
    for (int num : grid) {
        num = -1;
    }
    pionter = 0;
}

public void draw() {
    background(0xFF000000);
    for (int i = 0; i < grid.length; i++) {
        if (grid[i] > 0) {
            int y = i / height / 20;
        }
    }
}

public PImage[] initSpriteSheet(String keyword) {
    PImage[] output = new PImage[0];
    int counter = 0;
    while(loadImage(keyword + counter + ".png") != null) {
        output = (PImage[]) append(output, loadImage(keyword + counter + ".png"));
        counter++;
    }
    return output;
}

public int pointToGrid(float x, float y) {
    
}

public void mouseClicked() {
    grid[pointToGrid(mouseX, mouseY)] = 1;
}