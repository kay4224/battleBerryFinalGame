class Bullet {
  int x; 
  int y;
  int d; 
  int c; //color of the bullet
  int speed; //speed of the bullet
  int topBound; //the top boundary of the bullet
  int bottomBound; //the bottom boundary of the bullet
  int leftBound; //the left bound of the bullet 
  int rightBound; //the right bound of the bullet
  boolean isDead;

  //constructor
  Bullet() {
    x = p1.x + 50;
    y = p1.y + 50;
    d = 25;
    c = color(#A0410A);
    speed = 5;
    topBound = y;
    bottomBound = y + d;
    rightBound = x + d;
    leftBound = x;
  }
  //functions 
  //draw a bullet 
  void render(){
    fill(c);
    circle(x,y,d);
  }
  //moving bullet
  void move(){
    x = x + speed;
  }
  //reset
  void reset(){
    topBound = y; 
    bottomBound = y + d;
    rightBound = x + d;
    leftBound = x;
  }
}
