class Plane {
  Plane() {}
  Plane(float xaxis, float yaxis){
    x = xaxis;
    y = yaxis;
  }
  
  float x, y, dirX = 1;
  
  void pressMove(){
    if (keyPressed)
    {
      if (key == 'd' && x < 600) {x += 5;}
      if (key == 'a' && x > 0) {x -= 5;}
      if (key == 'w' && y > 0) {y -= 5;}
      if (key == 's' && y < 600) {y += 5;}
    }
  }
  
  void move(){
  if (y > height){
    y = 0;
  }
  y += 5;
  if (dirX > 0){
    x += 5;
  }
  else {
    x -= 5;
  }
  if (x > width){
    dirX = -dirX;
  }
  else if (x < 0){
    dirX = -dirX;
  }
}
  
  void planeSprite(){
    fill(100,100,100);
    quad(x-7.5,y+15,x-7.5,y+30,x-25,y+30,x-27.5,y+20);
    quad(x+7.5,y+15,x+7.5,y+30,x+25,y+30,x+27.5,y+20);
    ellipse(x,y,80,10);
    fill(200,200,200);
    ellipse(x,y-10,15,15);
    quad(x-7.5,y-10,x-7.5,y+30,x+7.5,y+30,x+7.5,y-10);
    fill(50,50,50);
    quad(x,y, x-10,y+10, x,y+20, x+10,y+10);
  }
}
