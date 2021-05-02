import processing.sound.*;
//array list for enemy and bullets
ArrayList<Enemy> enemy1List;
ArrayList<Enemy> enemy2List;
ArrayList<Enemy> bossEnemyList;
ArrayList<Bullet> bulletList;


int switchVal = 0;

PImage titleScreen;
PImage instructionsScreen;
PImage background;
PImage background2;
PImage background3;
PImage endScreen;
PImage winScreen;

Player p1;

int player1Score;
float playerLives  = 100;

boolean isFirstRound; 

//make good deer animation object
Animation goodDeerAnimation;

//make bad deer animation object
Animation badSkunkAnimation;

//make eagle animation object
Animation eagleAnimation;

//make martha animation object
Animation marthaAnimation;

SoundFile introduction;
SoundFile backgroundSong;



void setup() {
  //setting the size
  size(1200, 650);

  //player
  p1 = new Player();

  //enemy
  //making the enemy
  enemy1List = new ArrayList<Enemy>();
  enemy2List = new ArrayList<Enemy>();
  bossEnemyList = new ArrayList<Enemy>();
  for (int i = 0; i < 4; i++) {
    Enemy dave = new Enemy((int)random(0, width), (int)random(0, height));
    enemy1List.add(dave);
  }
  for (int i = 0; i < 4; i++) {
    Enemy dave = new Enemy((int)random(0, width), (int)random(0, height));
    enemy2List.add(dave);
  }
  for (int i = 0; i < 10; i++) {
    Enemy dave = new Enemy((int)random(0, width), (int)random(0, height));
    bossEnemyList.add(dave);
  }
  

  //bullet
  bulletList = new ArrayList<Bullet>();

  //make array of good deer images 
  PImage[] goodDeerImages = new PImage[2];

  //fill array of good deer images 
  for (int i=0; i<goodDeerImages.length; i++) {
    goodDeerImages[i] = loadImage("new_deer"+i+".png");
  }

  //initialize good deer object
  goodDeerAnimation = new Animation(goodDeerImages, .2, 6);

  //make array of bad deer images
  PImage[] badSkunkImages = new PImage[2];

  //fill array of bad deer images 
  for (int i=0; i<badSkunkImages.length; i++) {
    badSkunkImages[i] = loadImage("skunk"+i+".png");
  }
  
  //make array of eagle images
  PImage[] eagleImages = new PImage[2];
  
  //fill array of eagle images
  for(int i=0; i<eagleImages.length; i++) {
    eagleImages[i] = loadImage("eagle"+i+".png");
  }
  
  //make array of martha images
  PImage[] marthaImages = new PImage[2];
  
  //fill array of martha images
   for(int i=0; i<marthaImages.length; i++) {
    marthaImages[i] = loadImage("martha"+i+".png");
  }
  
  //initialize eagle object
  eagleAnimation = new Animation (eagleImages, .2,8);

  //initialize bad deer object
  badSkunkAnimation = new Animation(badSkunkImages, .2, 7);
  
  //initialize martha object
  marthaAnimation = new Animation(marthaImages,.2,8);

  //title screen 
  titleScreen = loadImage("titleScreen.png");
  titleScreen.resize(width, height);

  //instructrions screen
  instructionsScreen = loadImage("instructionsScreen.png");
  instructionsScreen.resize(width, int(height/1));
  
  //death screen
  endScreen = loadImage("endscreen.png");
  endScreen.resize(width,height);
  
  //win screen
  winScreen = loadImage("winscreen.png");
  winScreen.resize(width,height);
  
  //background
  background = loadImage("level1.png");
  background.resize(width,height/1);
  background2 = loadImage("level2.png");
  background2.resize(width,height/1);
  background3 = loadImage("level3.png");
  background3.resize(width,height/1);
  
  introduction = new SoundFile(this,"introsong.mp3");
  backgroundSong = new SoundFile(this, "background.mp3");
}

void draw() {

  //introduction screen
  
  switch(switchVal) {
  case 0:
    background(0);
    image(titleScreen, 0, 0);
    if(!introduction.isPlaying()){
      introduction.play();
    }
    break;

    //instructions screen
  case 1:
    background(0);
    image(instructionsScreen, 0, 0);
    break;

    //level 1
  case 2:
    //setting the background 
    background(0);
    image(background,0,0);
   
   if(introduction.isPlaying()){
      introduction.stop();
    }
    
    if(!backgroundSong.isPlaying()){
      backgroundSong.play();
    }
 
     if (playerLives<=0) {
      switchVal=3;
}

    //good deer animation
    goodDeerAnimation.display(p1.x, p1.y);

    //score tracking 
    fill(color(0));
    textSize(35);
    text("Player Score", 600, 800);

    //player 1 

    p1.moveRight();
    p1.moveLeft();
    p1.moveUp();
    p1.moveDown();
    p1.wallDetect();

    //enemy 
    for (Enemy enemy1 : enemy1List) {
   
      enemy1.move(p1); 
      enemy1.wallDetect();
      enemy1.reset();
      enemy1.hitsPlayer(p1);
      //bad deer animation 
        badSkunkAnimation.display(enemy1.x, enemy1.y);
    }

    //bullet 
    for (Bullet bullet1 : bulletList) {
      bullet1.render();
      bullet1.move();
      bullet1.reset();
    }
    //collosion between enemy and bullet 
    for (Enemy enemy1 : enemy1List) {
      for (Bullet bullet1 : bulletList) {
        enemy1.isHit(bullet1);
      }
    }
    
    for (int i=enemy1List.size()-1; i>=0; i--) {
      if (enemy1List.get(i).isDead == true) {
        enemy1List.remove(i);
        if(enemy1List.size()==0){
          switchVal = 4;
        }
      }
    }
  //remove bullet from screen
    for(int i=bulletList.size()-1; i>=0; i--){
      if(bulletList.get(i).isDead == true){
        bulletList.remove(i);
      }
    }
 
    //score tracking 
    fill(0);
    textSize(35);
    text("Player Score", 0, 50);
    text(player1Score, 250, 50);
    fill(#D81F41);
    textSize(35);
    text("Player Lives", 400, 50);
    text(int(playerLives),650,50);

    break;
 
case 3:
//game over screen
background(0);
image(endScreen,0,0);

break;

//level 2
case 4:

//setting the background 
    background(0);
    image(background2,0,0);

    //good deer animation
    goodDeerAnimation.display(p1.x, p1.y);
    
    if (playerLives<=0) {
      switchVal=3;
}
if(!backgroundSong.isPlaying()){
      backgroundSong.play();
    }

    //score tracking 
    fill(color(0));
    textSize(35);
    text("Player Score", 600, 800);

    //player 1 
  
    p1.moveRight();
    p1.moveLeft();
    p1.moveUp();
    p1.moveDown();
    p1.wallDetect();

    //enemy 
    for (Enemy enemy1 : enemy2List) {
      enemy1.move(p1); 
      enemy1.wallDetect();
      enemy1.reset();
      enemy1.hitsPlayer(p1);
      //bad deer animation 
        eagleAnimation.display(enemy1.x, enemy1.y);
    }

    //bullet 
    for (Bullet bullet1 : bulletList) {
      bullet1.render();
      bullet1.move();
      bullet1.reset();
    }
    //collosion between enemy and bullet 
    for (Enemy enemy1 : enemy2List) {
      for (Bullet bullet1 : bulletList) {
        enemy1.isHit(bullet1);
      }
    }
    
    for (int i=enemy2List.size()-1; i>=0; i--) {
      if (enemy2List.get(i).isDead == true) {
        enemy2List.remove(i);
        if(enemy2List.size()==0){
          switchVal = 5;
        }
      }
    }
  //remove bullet from screen
    for(int i=bulletList.size()-1; i>=0; i--){
      if(bulletList.get(i).isDead == true){
        bulletList.remove(i);
      }
    }
 
    //score tracking 
    fill(0);
    textSize(35);
    text("Player Score", 0, 50);
    text(player1Score, 250, 50);
    fill(#D81F41);
    textSize(35);
    text("Player Lives", 400, 50);
    text(int(playerLives),650,50);

break;

//level 3
case 5:

//setting the background 
    background(0);
    image(background3,0,0);

    //good deer animation
    goodDeerAnimation.display(p1.x, p1.y);
    
    if (playerLives<=0) {
      switchVal=3;
}

if(!backgroundSong.isPlaying()){
      backgroundSong.play();
    }

    //score tracking 
    fill(color(0));
    textSize(35);
    text("Player Score", 600, 800);

    //player 1 
  
    p1.moveRight();
    p1.moveLeft();
    p1.moveUp();
    p1.moveDown();
    p1.wallDetect();

    //enemy 
    for (Enemy enemy1 : bossEnemyList) {
      enemy1.move(p1); 
      enemy1.wallDetect();
      enemy1.reset();
      enemy1.hitsPlayer(p1);
      //bad deer animation 
        marthaAnimation.display(enemy1.x, enemy1.y);
    }

    //bullet 
    for (Bullet bullet1 : bulletList) {
      bullet1.render();
      bullet1.move();
      bullet1.reset();
    }
    //collosion between enemy and bullet 
    for (Enemy enemy1 : bossEnemyList) {
      for (Bullet bullet1 : bulletList) {
        enemy1.isHit(bullet1);
      }
    }
    
    for (int i=bossEnemyList.size()-1; i>=0; i--) {
      if (bossEnemyList.get(i).isDead == true) {
        bossEnemyList.remove(i);
        if(bossEnemyList.size()==0){
          switchVal = 6;
        }
      }
    }
  //remove bullet from screen
    for(int i=bulletList.size()-1; i>=0; i--){
      if(bulletList.get(i).isDead == true){
        bulletList.remove(i);
      }
    }
 
    //score tracking 
    fill(0);
    textSize(35);
    text("Player Score", 0, 50);
    text(player1Score, 250, 50);
    fill(#D81F41);
    textSize(35);
    text("Player Lives", 400, 50);
    text(int(playerLives),650,50);


break;

//winning screen
case 6:
background(0);
image(winScreen,0,0);


break;

}

}






void keyPressed() {
  if (key == CODED) {
    //player moving right 
    if (keyCode == RIGHT) {
      p1.movingRight = true;
      goodDeerAnimation.isAnimating=true;
      badSkunkAnimation.isAnimating=true;
      eagleAnimation.isAnimating=true;
      marthaAnimation.isAnimating=true;
    }
    //player moving left 
    if (keyCode == LEFT) {
      p1.movingLeft = true;
      goodDeerAnimation.isAnimating=true;
      badSkunkAnimation.isAnimating=true;
      eagleAnimation.isAnimating=true;
      marthaAnimation.isAnimating=true;
    }
    //player moving up 
    if (keyCode == UP) {
      p1.movingUp = true;
      goodDeerAnimation.isAnimating=true;
      badSkunkAnimation.isAnimating=true;
      eagleAnimation.isAnimating=true;
      marthaAnimation.isAnimating=true;
    }
    //player moving down 
    if (keyCode == DOWN) {
      p1.movingDown = true;
      goodDeerAnimation.isAnimating=true;
      badSkunkAnimation.isAnimating=true;
      eagleAnimation.isAnimating=true;
      marthaAnimation.isAnimating=true;
    }
  }
  //bullet
  if (key==' ') {
    bulletList.add(new Bullet());
  }
  //play screen
  if (key == 's') {
    switchVal = 1;
  }
  if (key == 'p') {
    switchVal = 2;
    
  }
  
  if(key == 'r'){
    switchVal = 2;
    playerLives=100;
    isFirstRound = false;
    if(isFirstRound == false){
      for (int i = 0; i < 4; i++) {
    Enemy dave = new Enemy((int)random(0, width), (int)random(0, height));
    enemy1List.add(dave);
  }
  for (int i = 0; i < 4; i++) {
    Enemy dave = new Enemy((int)random(0, width), (int)random(0, height));
    enemy2List.add(dave);
  }
  for (int i = 0; i < 10; i++) {
    Enemy dave = new Enemy((int)random(0, width), (int)random(0, height));
    bossEnemyList.add(dave);
  }
  }
  }
  isFirstRound=true;
  }

void keyReleased() {
  //player moving right 
  if (key == CODED) {
    if (keyCode == RIGHT) {
      p1.movingRight = false;
    }
    if (keyCode == LEFT) {
      p1.movingLeft = false;
    }
    if (keyCode == UP) {
      p1.movingUp = false;
    }
    if (keyCode == DOWN) {
      p1.movingDown = false;
    }
  }
}
