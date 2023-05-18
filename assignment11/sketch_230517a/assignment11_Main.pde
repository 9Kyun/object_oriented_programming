Plane [] pp = new Plane[2];
Bbang [] vv = new Bbang[2];
Segyu [] ss = new Segyu[2];

void setup(){
  size(600,400);
  
  pp[0] = new Plane(300,300);
  pp[1] = new Plane();
  
  vv[1] = new Bbang(random(2, 4), random(-3, 3), random(-3, 3), random(-3, 3));
  
  ss[0] = new Segyu(random(width),random(height), 50);
  ss[0].segyunman();
  ss[1] = new Segyu(random(width),random(height), 70);
  ss[1].segyunman();
}

void draw(){
  background(255,255,255);
  
  pp[0].planeSprite();
  pp[0].pressMove();
  pp[1].planeSprite();
  pp[1].move();
  
  vv[0] = new Bbang(mouseX,mouseY);
  vv[0].display();
  vv[1].move();
  vv[1].display();
  
  ss[0].act();
  ss[0].segyunman();    
  ss[1].act();
  ss[1].segyunman();    
}
