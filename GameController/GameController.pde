final int screenWidth = 800;
final int screenHeight = 600;
final int playersTeam = 1;
final int enemiesTeam = 2;
int playerSpeedLimit = 8;
ArrayList<Sprite> sprites = new ArrayList<Sprite>();
ArrayList<Sprite> enemies = new ArrayList<Sprite>();
ShapeFactory factory;
HostileSprite player;

void setup() {
  size(screenWidth, screenHeight, P2D);
  factory = new ShapeFactory();
  player = spawnPlayer();
  sprites.add(player);
}

void draw() {
  background(0);
  
  for(int i = 0; i < sprites.size(); i++) {
    sprites.get(i).updateAndDisplay();
  }
}

HostileSprite spawnPlayer() {
  PVector startingPosition = new PVector(0.5 * width, 0.85 * height);
  PVector initialVelocity = new PVector(0,0);
  PShape graphic = factory.getBasicPlayer();
  int radius = 40;
  return new HostileSprite(playersTeam, radius, graphic, startingPosition, initialVelocity);
}
