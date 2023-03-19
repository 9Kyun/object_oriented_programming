float xaxis = 300, yaxis = 900;
int score = 0;
boolean isDamaged = false;
boolean death = false;

float launchedX = 10000, launchedY = 10000;
boolean isLaunched;

float enemyX, enemyY;

float[] bgx = new float[200];
float[] bgy = new float[200];

Enemy[] enemyArr = new Enemy[10];

void setup()
{
  size(600,1000);
  for (int i=0; i<200; i++){
    bgx[i] = random(0,600);
  }
  for (int i=0; i<200; i++){
    bgy[i] = random(0,1000);
  }
  for (int i=0; i<10; i++){
    enemyArr[i] = new Enemy();
  }
}

void draw()
{
  //background
  background(0);
  for (int i = 0; i<200; i++){
    bgy[i] += 2;
    if (bgy[i] > 1000){
      bgy[i] = 0;
    }
    circle(bgx[i],bgy[i],3);
  }
  fill(255,255,255);
  textSize(50);
  text(score,10,50);
  
  //move
  if (keyPressed && !death)
  {
    if (key == 'd') {xaxis += 5;}
    if (key == 'a') {xaxis -= 5;}
    if (key == 'w') {yaxis -= 5;}
    if (key == 's') {yaxis += 5;}

    if (key == ' ' && !isLaunched){
      isLaunched = true;
      launchedX = xaxis;
      launchedY = yaxis;
    }
  }
  player(xaxis,yaxis);
  
  //projectile
  if (isLaunched){
    launchedY -= 30;
    projectile(launchedX, launchedY);
    if (launchedY < 0){
      isLaunched = false;
    }
  }
  
  for (int i = 0; i < 10; i++){
    //take damage
    damage(enemyArr[i]);
  
    //enemy spawning
    if (enemyArr[i].enemySpawned){
      enemySpawn(enemyArr[i]);
      enemySprite(enemyArr[i].x, enemyArr[i].y);
    }
  
    //enemy destroyed
    if (isLaunched){
      enemyDestroy(enemyArr[i]);
    }
    
    //enemy respawn
    enemyRespawn(enemyArr[i]);
  }
  if (death){
    textSize(100);
    text("GAME OVER", 50, 500);
  }
}

void player(float x, float y)
{
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

void projectile(float x, float y)
{
  fill(255,255,255);
  rect(x-5,y,10,40);
}

void enemySprite(float x, float y)
{
  fill(255,255,255);
  circle(x,y,30);
}

void enemySpawn(Enemy enemy){
  if (enemy.y > 1000){
    enemy.x = random(50,550);
    enemy.y = random(-50,0);
  }
  enemy.y += enemy.fallingSpeed;
  if (enemy.dirX > 0){
    enemy.x += enemy.horizontalSpeed;
  }
  else {
    enemy.x -= enemy.horizontalSpeed;
  }
  if (enemy.x > width){
    enemy.dirX = -enemy.dirX;
  }
  else if (enemy.x < 0){
    enemy.dirX = -enemy.dirX;
  }
}

void enemyDestroy(Enemy enemy){
  if(enemy.x > launchedX-15 && enemy.x < launchedX+15 && launchedY < enemy.y && yaxis > enemy.y){
    enemy.enemySpawned = false;
    isLaunched = false;
    enemy.enemyTimer = 0;
    enemy.y = 0;
    score += 10;
  }
}

void enemyRespawn(Enemy enemy){
  if (enemy.enemySpawned == false){
    enemy.enemyTimer += 1;
  }
  if (enemy.enemyTimer > 100){
    enemy.enemyTimer = 0;
    enemy.enemySpawned = true;
    enemy.y = 0;
  }
}

void damage(Enemy enemy){
  if (xaxis > enemy.x-20 && xaxis < enemy.x+20 && yaxis > enemy.y-20 && yaxis < enemy.y+20){
    death = true;
  }
}
