//void setup()
//{
//  //background
//  fill(0,0,0);
//  size(800,600);
//  rect(0,0,800,600);
//  fill(255,255,255);
//  sky();
  
//  int x = 400;
//  int y = 300;
//  int s = 400;
  
//  moon(x,y,s);
  
//  fill(200,200,200);
//  frame();
//}
//void moon(float x, float y, float s){
//  circle(x,0.93*y,s);
  
//  //eye
//  fill(200,200,200);
//  ellipse(1.15*x,0.9*y,0.125*s,0.075*s);
//  fill(100,100,100);
//  ellipse(1.1625*x,0.89*y,0.0625*s,0.05*s);
//  quad(1.075*x,0.87*y, 1.225*x,0.75*y, 1.24*x,0.73*y, 1.075*x,0.85*y);
//  quad(1.225*x,0.75*y, 1.24*x,0.73*y, 1.25*x,0.8*y, 1.25*x,0.8*y);
//  fill(255,255,255);
//  arc(1.0875*x,0.96*y,0.15*s,0.0625*s,4.5,6);  
//  arc(1.2125*x,0.96*y,0.15*x,0.0625*s,3.2,4.8);
  
//  fill(100,100,100);
//  quad(1.025*x,1.1*y, 1.06*x,1.12*y, 1.06*x,1.12*y, 1.04*x,1.12*y);
//  quad(0.975*x,1.1*y, 0.95*x,1.12*y, 0.95*x,1.12*y, 0.96*x,1.12*y);
//  line(1.075*x,1.03*y,1.175*x,1.16*y);
  
//  fill(50,50,50);
//  quad(0.525*x,0.5*y, 0.95*x,0.7*y, 0.875*x,1.03*y, 0.45*x,0.83*y);
//  fill(100,100,100);
//  quad(0.525*x,0.5*y, 0.5375*x,0.7*y, 0.45*x,0.83*y, 0.4375*x,0.63*y);
  
//  fill(255,255,255);
//  arc(0.9575*x,0.73*y,0.175*s,0.25*s,PI/2,4.4);
//  arc(0.875*x,1.05*y,0.25*s,0.2375*s,3.3,5.3);
//  arc(0.9625*x,0.9*y,0.175*s,0.25*s,2.7,3*PI/2);
  
//  fill(200,200,200);
//  quad(0.875*x,1.23*y, 1.125*x,1.217*y, 1.175*x,1.33*y, 0.825*x,1.33*y);
//  fill(255,255,255);
//  arc(0.875*x,1.367*y,0.2*s,0.075*s,3.7,6);
//}
  
//void frame(){
//  for (int i = 0; i < 2; i++){
//    for (int j = 0; j < 10; j++){
//      square(15+i*740,15+j*60,30);
//    }
//  }
//}

//void sky(){
//  for (int i = 0; i < 2; i++){
//    for(int j = 0; j < 2; j++){
//        circle(150+500*i,20+560*j,150);
//        circle(20+760*i,20+560*j,300);
//        circle(0+800*i,250+100*j,100);
//        circle(10+780*i,180+240*j,150);
        
//        circle(200+400*i,150+300*j,3);
//        circle(120+560*i,180+240*j,3);
//        circle(250+300+i,20+560+j,3);
//        circle(70+660*i,250+100*j,3);
//        circle(130+540*i,270+60*j,3);
//        circle(280+240*i,100+400*j,3);
//        circle(330+140*i,30+540*j,3);
//    }
//  }
//}
  
