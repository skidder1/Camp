final int screenWidth = 800;
final int screenHeight = 600;
final int playersTeam = 1;
final int enemiesTeam = 2;
int playerLives = 3;
int playerSpeedLimit = 8;
int enemySpeedLimit = 4;
int stage = 0;
boolean invincible = false;
boolean lockedControls = true;
boolean[] keys = new boolean[3];
ArrayList sprites = new ArrayList();
ArrayList enemies = new ArrayList();
ArrayList levels = new ArrayList();

Level currentLevel;
ShapeFactory factory;
HostileSprite player;
float playerControllerLine;
PShape lifeIcon;

void setup() {
  size(screenWidth, screenHeight, P2D);
  noCursor();

  factory = new ShapeFactory();
  lifeIcon = factory.getBasicPlayer().getChild(0);
  playerControllerLine = 0.85 * height;
  player = spawnPlayer();
  sprites.add(player);
  enemies.add(player);

  levels.add(new LevelOne());
  levels.add(new LevelTwo());
  for (Level level : levels ()) {
    level.levelSetup();
  }
  currentLevel = levels.get(0);
}

void draw() {
  background(25);
  showPlayerLives();
  if (playerLives == 0) {
    endGame("lose");
  }
  currentLevel.levelDraw();
  if (!lockedControls) {
    controlPlayer();
  }

  for (int i = 0; i < sprites.size (); i++) {
    sprites.get(i).updateAndDisplay();
  }
}
void showPlayerLives() {
  for (int i = 0; i < playerLives; i++) {
    shape(lifeIcon, 60 + i * 100, height -40);
  }
}

void endGame(String condition) {
  if (condition.equals("lose")) {
    cursor();
    textAlign(CENTER);
    textSize(48);
    text("Game Over", width/2, height/2);
    noLoop();
  } else if (condition.equals("win")) {
    cursor();
    textAlign(CENTER);
    textSize(48);
    text("You Beat the Game", width/2, height/2);
    noLoop();
  }
}

boolean sketchFullScreen(){
  return true;
}

HostileSprite spawnPlayer() {
  PVector startingPosition = new PVector(0.5 * width, 0.85 * height);
  PVector initialVelocity = new PVector(0, 0);
  PShape graphic = factory.getBasicPlayer();
  int radius = 40;
  return new HostileSprite(playersTeam, radius, graphic, startingPosition, initialVelocity);
}

void keyPressed() {
  if (key==CODED) {
    if (keyCode==LEFT)
      keys[0]=true;
    if (keyCode==RIGHT)
      keys[1] = true;
  }
  if (key == 'f'|| key=='F') {
    keys[2]=true;
  }
}


void keyReleased() {
  if (key==CODED) {
    if (keyCode== LEFT)
      keys[0]=false;
    if (keyCode==RIGHT)
      keys[1]=false;
  }
  if (key=='f'||key=='F') {
    keys[2]=false;
  }
}
void controlPlayer() {
  if (keys[0]) {
    player.position.x -= playerSpeedLimit;
  }
  if (keys[1]) {
    player.position.x += playerSpeedLimit;
  }
  if (keys[2]) {
    player.fire(new PVector(0, -10));
  }
}

