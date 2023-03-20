//sound effect
import processing.sound.*;
SoundFile[] sound = new SoundFile[4];
boolean isDead = false;

//player variable
float xaxis = 300, yaxis = 900;
boolean isDamaged = false;
boolean death = false;

int score = 0;
int timer = 0;
int difficultySet;

//projectile variable
float launchedX = 10000, launchedY = 10000;
boolean isLaunched;

//enemy variable
float enemyX, enemyY;
Enemy[] enemyArr = new Enemy[100];

//background coordinate arr
float[] bgx = new float[200];
float[] bgy = new float[200];

void setup()
{
  size(600,1000);
  
  //background coordinate variable with random
  for (int i=0; i<200; i++){
    bgx[i] = random(0,600);
  }
  for (int i=0; i<200; i++){
    bgy[i] = random(0,1000);
  }
  
  //create enemy
  for (int i=0; i<100; i++){
    enemyArr[i] = new Enemy();
  }
  
  //sound effect set
  sound[0] = new SoundFile(this,"bgm.mp3");
  sound[1] = new SoundFile(this,"firing.wav");
  sound[2] = new SoundFile(this,"game over.wav");
  sound[3] = new SoundFile(this,"death.wav");
}

void draw()
{
  //background music
  if (!sound[0].isPlaying()){
    sound[0].play();
  }
  //moving background
  background(0);
  for (int i = 0; i<200; i++){
    bgy[i] += 2;
    if (bgy[i] > 1000){
      bgy[i] = 0;
    }
    circle(bgx[i],bgy[i],3);
  }
  
  //score and difficulty setting
  if ((timer == 60 || timer == 120) && !death){
    score += 5;
  }
  if (timer < 120){
    timer += 1;
  }
  else if (timer >= 120 && difficultySet < 89 && !death){
    difficultySet += 1;
    timer = 0;
  }
  textSize(30);
  text("Enemy Count:",320,50);
  text(10+difficultySet,500,50);
  
  //score on screen
  fill(255,255,255);
  textSize(30);
  text("Score:",20,50);
  text(score,100,50);
  
  //player move & shoot
  if (keyPressed && !death)
  {
    if (key == 'd' && xaxis < 600) {xaxis += 5;}
    if (key == 'a' && xaxis > 0) {xaxis -= 5;}
    if (key == 'w'&& yaxis > 0) {yaxis -= 5;}
    if (key == 's'&& yaxis < 1000) {yaxis += 5;}

    if (key == ' ' && !isLaunched){
      isLaunched = true;
      launchedX = xaxis;
      launchedY = yaxis;
      sound[1].play();
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
  
  //enemy
  for (int i = 0; i < 10 + difficultySet; i++){
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
    if (!isDead){
      sound[2].play();
      isDead = true;
    }
    textSize(100);
    text("GAME OVER", 50, 500);
  }
}

//player sprite
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

//projectile sprite
void projectile(float x, float y)
{
  fill(255,255,255);
  rect(x-5,y,10,40);
}

//enemy sprite
void enemySprite(float x, float y)
{
  fill(255,255,255);
  circle(x,y,30);
}

//enemy spawning and movement algorithm
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

//enemy being destroyed when get hit by projectile
void enemyDestroy(Enemy enemy){
  if(enemy.x > launchedX-15 && enemy.x < launchedX+15 && launchedY > enemy.y - 30 && launchedY < enemy.y + 30){
    enemy.enemySpawned = false;
    isLaunched = false;
    enemy.enemyTimer = 0;
    enemy.y = 0;
    score += 10;
    sound[3].play();
  }
}

//enemy respawn timer
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

//player death
void damage(Enemy enemy){
  if (xaxis > enemy.x-20 && xaxis < enemy.x+20 && yaxis > enemy.y-20 && yaxis < enemy.y+20){
    death = true;
  }
}
