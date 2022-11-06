public class SpriteSheet {
    public final PImage content;
    public final Sprite sprite;
    public final int size;
    
    private class Sprite {
        public final int width;
        public final int height;
        
        public Sprite(int width, int height) {
            this.width = width;
            this.height = height;
        }
    }
    
    public SpriteSheet(String filename, int width, int height) {
        this.content = loadImage(filename);
        this.sprite = new Sprite(width, height);
        this.size = (this.content.width / this.sprite.width) * (this.content.height / this.sprite.height);
    }
    
    public void drawSprite(int index, float x, float y, float scale) {
        if (index < this.size) {
            int spriteX = (index % (this.content.width / this.sprite.width)) * this.sprite.width;
            int spriteY = (index / (this.content.height / this.sprite.height)) * this.sprite.height;
            image(this.content, x, y, this.sprite.width * scale, this.sprite.height * scale, spriteX, spriteY, spriteX + this.sprite.width, spriteY + this.sprite.height);
        } else {
            println("Index is greater than size.");
        }
    }
}