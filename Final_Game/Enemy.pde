class Enemy {
  int x;
  int y;
  int w; //width of the enemy
  int h; //height of the enemy
  int c; //color of the enemy
  float enemySpeed; //the speed of the enemy
  int topBound; //the top boundary of the enemy
  int bottomBound; //the bottom boundary of the enemy 
  int leftBound; //the left bound of the enemy 
  int rightBound; //the right bound of the enemy 
  boolean isDead; //if the enemy is dead 
  boolean playerDead; //if the player dies

  //constructor 
  Enemy(int inX, int inY) {
    x = inX;
    y = inY;
    w = 150;
    h = 100;
    c = color(150, 200, 225);
    enemySpeed= 1 ;

    //enemy bounds
    topBound = y;
    bottomBound = y + h;
    leftBound = x;
    rightBound = x + w;
  }

  //functions 

  //render function
  void render() {
    fill(c);
    rect(x, y, w, h);
  }

  //move function 
  void move(Player jeff) {
    if (jeff.x >= x) {
      x+=enemySpeed;
    }
    if (jeff.x<=x) {
      x-=enemySpeed;
    }
    if (jeff.y>=y) {
      y+=enemySpeed;
    }
    if (jeff.y<=y) {
      y-=enemySpeed;
    }
  }

  //collison between enemy and player 
  void hitsPlayer(Player gabe) {
    if (gabe.rightBound >= leftBound) {
      if (gabe.leftBound <= rightBound) {
        if (gabe.bottomBound>=topBound) {
          if (gabe.topBound<=bottomBound) {
            playerDead=true;
            if(playerLives>=0){
            playerLives=playerLives-0.05;
          }
          }
        }
      }
    }
  }

  //collison between bullet and enemy 
  void isHit(Bullet river) {
    if (river.rightBound >= leftBound) {
      if (river.leftBound <= rightBound) {
        if (river.bottomBound>=topBound) {
          if (river.topBound<=bottomBound) {
            isDead=true;
            river.isDead = true;
            player1Score=player1Score+10;
          }
        }
      }
    }
  }

  //wall detections 
  void wallDetect() {
    if (y+h>=height) {
      y-=enemySpeed;
    }
    if (y<=0) {
      y+=enemySpeed;
    }
    if (x+w>=width) {
      x-=enemySpeed;
    }
    if (x<=0) {
      x+=enemySpeed;
    }
  }

  void reset() {
    topBound = y;
    bottomBound = y + h;
    leftBound = x;
    rightBound = x + w;
  }
}
