class Segyu {
  Segyu() {};
  Segyu(float p, float q, float r) {
    x = p;     y = q;     s = r;
    vx = random(-3,3); vy = random(-2,2);
  }
  
  float x, y, s, vx, vy;
  
  void act(){
    x += vx;  y += vy;
    if(x > width || x < 0) vx = -vx;
    if(y > height || y < 0) vy = -vy;
  }

  void segyunman(){
    fill(0,0,51); // 검정 + 남색
    strokeWeight(4);
    circle(x,y,s); 
    
    fill(153,102,204); // 보라색
    strokeWeight(0);
    quad(x,y-s*1/20, x-s*19/40,y+s*5/40, x,y+s*1/2, x+s*19/40,y+s*5/40); // 사각형
    strokeWeight(1);
    curve(x,y-s*1/20, x-s*19/40,y+s*49/400, x,y+s*199/400, x+s*19/40,y+s*5/40); // 왼쪽 아래
    curve(x,y-s*1/20, x+s*19/40,y+s*49/400, x,y+s*199/400, x-s*19/40,y+s*5/40); // 오른쪽 아래
    curve(x,y+s*1/2, x-s*19/40,y+s*51/400, x,y-s*19/400, x+s*19/40,y+s*5/40); // 왼쪽 위
    curve(x,y+s*1/2, x+s*19/40,y+s*51/400, x,y-s*19/400, x-s*19/40,y+s*5/40); // 오른쪽 위
    fill(255,255,255); // 흰색
    strokeWeight(0);
    quad(x,y+s*1/20, x-s*17/40,y+s*9/40, x,y+s*1/2, x+s*17/40,y+s*9/40); // 위와 순서 동일
    strokeWeight(1);
    curve(x,y+s*1/20, x-s*17/40,y+s*89/400, x,y+s*199/400, x+s*17/40,y+s*9/40);
    curve(x,y+s*1/20, x+s*17/40,y+s*89/400, x,y+s*199/400, x-s*17/40,y+s*9/40);
    curve(x,y+s*1/2, x-s*17/40,y+s*91/400, x,y+s*21/400, x+s*17/40,y+s*9/40);
    curve(x,y+s*1/2, x+s*17/40,y+s*91/400, x,y+s*21/400, x-s*17/40,y+s*9/40);
    
    fill(153,102,204); // 코 (보라 + 흰색)
    strokeWeight(1);
    circle(x,y+s*1/20,s*13/40);
    fill(255,255,255);
    strokeWeight(0);
    square(x-s*25/400,y-s*1/80,s*3/40);
   
    fill(255,255,255); // 눈 (흰색)
    strokeWeight(2);
    circle(x-s*1/8,y-s*9/40,s*9/40);
    circle(x+s*1/8,y-s*9/40,s*9/40);
    fill(0,0,0);
    strokeWeight(0);
    circle(x-s*25/400,y-s*9/40,s*35/400);
    circle(x+s*25/400,y-s*9/40,s*35/400);
    
    strokeWeight(2); // 이빨
    line(x-s*11/40,y+s*48/400, x-s*12/40,y+s*145/400);
    line(x-s*64/400,y+s*32/400, x-s*68/400,y+s*18/40);
    line(x,y+s*85/400, x,y+s*1/2);
    line(x+s*64/400,y+s*32/400, x+s*68/400,y+s*18/40);
    line(x+s*11/40,y+s*48/400, x+s*12/40,y+s*145/400);
    
    line(x-s*13/40,y+s*56/400, x-s*116/400,y+s*105/400);
    line(x-s*116/400,y+s*105/400, x-s*72/400,y+s*85/400);
    line(x-s*72/400,y+s*85/400, x-s*1/8,y+s*13/40);
    line(x-s*1/8,y+s*13/40, x,y+s*1/4);
    line(x,y+s*1/4, x+s*1/8,y+s*13/40);
    line(x+s*1/8,y+s*13/40, x+s*72/400,y+s*85/400);
    line(x+s*72/400,y+s*85/400, x+s*116/400,y+s*105/400);
    line(x+s*116/400,y+s*105/400, x+s*13/40,y+s*56/400);
    
    fill(0,0,51); // 뿔
    quad(x-s*1/4,y-s*178/400, x-s*12/40,y-s*3/4, x-s*103/400,y-s*305/400, x-s*78/400,y-s*183/400);
    quad(x+s*1/4,y-s*178/400, x+s*12/40,y-s*3/4, x+s*103/400,y-s*305/400, x+s*78/400,y-s*183/400);
    circle(x-s*115/400,y-s*315/400,s*3/40);
    circle(x+s*115/400,y-s*315/400,s*3/40);
  }
}
