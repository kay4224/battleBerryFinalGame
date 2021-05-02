class Player {
  //variables 
  int x; //x location of the player
  int y; //y location of the player
  int size; //size of the player
  int c; //color of the player
  //speed vars
  int runSpeed; //the speed of the player as it runs 
  int jumpSpeed; //the speed of the player jumps up in the air
  int fallSpeed; //the speed the player falls 
  //boundary vars 
  int topBound; //the top boundary of the player
  int bottomBound; //the bottom boundary of the player
  int leftBound; //the left bound of the player 
  int rightBound; //the right bound of the player
  //moving booleans
  boolean movingLeft; //when it is true, the player will move to the left
  boolean movingRight; //when it is true, the player will move to the right 
  boolean movingUp; //when it is true, the player will move up
  boolean movingDown; //when it is true, the player will move down
  boolean isDead;

  //constructor 

  Player() {
    x = 400;
    y = 500;
    size = 100;
    c = color(225);
    runSpeed = 5;
    topBound = y; 
    bottomBound = y + size;
    rightBound = x + size;
    leftBound = x;
  }

  //functions 

  //render function makes the player
  void render() {
    fill(c);
    square(x, y, size);
  }
  //moving left function
  void moveLeft() {
    if (movingLeft == true) {
      x -= runSpeed;
    }
  }

  //player moving right 
  void moveRight() {
    if (movingRight == true) {
      x += runSpeed;
    }
  }
  //player moving up 
  void moveUp() {
    if (movingUp == true) {
      y -= runSpeed;
    }
  }
  //player moving down 
  void moveDown() {
    if (movingDown == true) {
      y += runSpeed;
    }
  }
  //player wall detect 
  void wallDetect() {
    if (y+size >=height) {
      y-=runSpeed;
    }
    if (y<=0) {
      y+=runSpeed;
    }
    if (x+size>=width) {
      x-=runSpeed;
    }
    if (x<=0) {
      x+=runSpeed;
    }
  }
}
