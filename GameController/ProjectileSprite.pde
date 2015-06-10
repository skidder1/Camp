class ProjectileSprite extends AbstractSprite {
  HostileSprite shooter;
  
  ProjectileSprite(HostileSprite shooter, int radius, PShape graphic, PVector position, PVector velocity) {
    super(position, velocity);
  }
  
  @Override
  void update() {
    
  }
  
  void checkCollisions() {
    
  }
}

