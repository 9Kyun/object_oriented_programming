class Bbang {
  float x, y;
  float vx, vy;
  float z = 40;
  
  Bbang(float _x, float _y, float _vx, float _vy) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
  }
  Bbang(float _x, float _y){
    x = _x;
    y = _y;
  }
  
  void move() {
    x += vx;
    y += vy;
    if (x > width) {
      x = 0;
    }
    if (x < 0) {
      x = width;
    }
    if (y > height) {
      y = 0;
    }
    if (y < 0) {
      y = height;
    }
  }
  
  void display() {
    strokeWeight(1);
    fill(255,220,170);
    circle(x,y,z);
    strokeWeight(1);
    stroke(0);
    fill(255,0,0);
    ellipse(x,y+0.05*z,0.3*z,0.25*z);
    noStroke();
    fill(255,100,50);
    ellipse(x+0.275*z,y+0.075*z,0.25*z,0.25*z);
    ellipse(x-0.275*z,y+0.075*z,0.25*z,0.25*z);
    fill(255);
    rect(x+0.2*z,y+0.025*z,0.05*z,0.05*z);
    rect(x-0.25*z,y+0.025*z,0.05*z,0.05*z);
    strokeWeight(1);
    stroke(0);
    noFill();
    arc(x-0.275*z,y+0.075*z,0.25*z,0.25*z,radians(270),radians(450));
    arc(x+0.275*z,y+0.075*z,0.25*z,0.25*z,radians(90),radians(270));
    bezier(x-0.275*z,y-0.2*z,x-0.225*z,y-0.425*z,x-0.075*z,y-0.4*z,x-0.025*z,y-0.225*z);
    bezier(x-0.175*z,y+0.2*z,x-0.125*z,y+0.3*z,x+0.125*z,y+0.3*z,x+0.175*z,y+0.2*z);
    bezier(x+0.025*z,y-0.225*z,x+0.075,y-0.4*z,x+0.225*z,y-0.425*z,x+0.275*z,y-0.2*z);
    fill(0);
    ellipse(x-0.15*z,y-0.125*z,0.075*z,0.15*z);
    ellipse(x+0.15*z,y-0.125*z,0.075*z,0.15*z);
  }
}
