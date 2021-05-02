class Animation{
  //variables 
  PImage[] images;
  float speed;
  float scale; 
  
  boolean isMoving;
  
  float index;
  boolean isAnimating; 
  
  //constructor 
   Animation(PImage[] tempImages, float tempSpeed, float tempScale){
    images = tempImages;
    speed = tempSpeed;
    scale = tempScale;
    
    index = 0; 
    isAnimating = false;
    isMoving=true;
    
    for (int i=0; i<images.length; i++){
     PImage img = images[i];
     img.resize(int(img.width*scale), int(img.height*scale));
    }
  }
    //updates the index which image to display for 
  //the animation 
  void next(){
    println(index);
    index += speed;
    
    //resets the index if it is too big 
    if (index >= images.length){
      index=0;
      isAnimating=false;
    }
  }
  
  //display an image of the animation 
  void display (int x, int y){
    imageMode(CORNER);
    if(isAnimating){
      int imageIndex = int(index);
      PImage img = images[imageIndex];
      image(img, x, y);
      
      //increment the index of the images to display
      next();
    } else{
      PImage img = images [0];
      image(img, x, y);
    }
  }
}
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
