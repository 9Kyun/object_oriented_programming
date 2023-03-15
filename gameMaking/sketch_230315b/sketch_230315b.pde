float xaxis = 300, yaxis = 900;

float launchedX, launchedY;
boolean isLaunched;

float enemyTimer = 0;
float enemyX, enemyY;
boolean enemySpawnable;
boolean enemySpawned;

Enemy enemy1 = new Enemy();
Enemy enemy2 = new Enemy();
Enemy enemy3 = new Enemy();

void setup()
{
  size(600,1000);
}

void draw()
{
  background(0);
  enemyTimer += 1;
  if (keyPressed)
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
  if (isLaunched){
    launchedY -= 30;
    projectile(launchedX, launchedY);
    if (launchedY < 0){
      isLaunched = false;
    }
  }
  player(xaxis,yaxis);

  if (enemyTimer > 30){
    enemyTimer = 0;
    enemySpawnable = true;
    if (enemy1.y > 1000){
      enemy1.x = random(50,550);
      enemy1.y = random(-50,0);
    }
    if (enemy2.y > 1000){
      enemy2.x = random(50,550);
      enemy2.y = random(-200,-150);
    }
    if (enemy3.y > 1000){
      enemy3.x = random(50,550);
      enemy3.y = random(-250,-200);
    }
  }
  if (enemySpawnable){
    enemy1.y += enemy1.fallingSpeed;
    enemy2.y += enemy2.fallingSpeed;
    enemy3.y += enemy3.fallingSpeed;
    enemySpawn(enemy1.x, enemy1.y);
    enemySpawn(enemy2.x, enemy2.y);
    enemySpawn(enemy3.x, enemy3.y);
  }
}

void player(float x, float y)
{
  quad(x,y, x-20,y+20, x,y+40, x+20,y+20);
}

void projectile(float x, float y)
{
  rect(x-5,y,10,40);
}

void enemySpawn(float x, float y)
{
  circle(x,y,30);
}
