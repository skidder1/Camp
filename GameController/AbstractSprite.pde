abstract class AbstractSprite implements Sprite {
  PVector position;
  PVector velocity;
  PShape graphic;
  int radius;
  
  AbstractSprite(PVector position, PVector velocity) {
    this.position = position;
    this.velocity = velocity;
  }
  
  void create(PShape graphic, int radius) {
    this.graphic = graphic;
    this.radius = radius;
  }
  
  void destroy() {
    sprites.remove(this);
    enemies.remove(this);
  }
  
  void update() {
    position.add(velocity);
  }
  
  void display() {
    shape(graphic, position.x, position.y);
  }
  
  void updateAndDisplay() {
    update();
    display();
  }
  
  boolean isColliding(ProjectileSprite projectile, HostileSprite hostile) {
    return false;
  }
}
