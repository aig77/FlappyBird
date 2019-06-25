import java.util.ArrayList;

// bird details
PImage birdy;
float birdX, birdY, speed, accel; // only keeps track of y position
boolean isJumping = false;

PImage bg, bg2;
boolean gameOver, start;

Timer t1;

ArrayList<Pipes> list;
Pipes newBars;

int score;
int highScore;

void setup() {
  bg = loadImage("background.jpg");
  bg2 = loadImage("background2.jpg");
  birdy = loadImage("flappybird.png");
  size(395, 700);  // size always goes first!
  surface.setResizable(true);
  background(bg);
  
  list = new ArrayList<Pipes>();
  Pipes pipe1 = new Pipes();
  Pipes pipe2 = new Pipes(395 + 131);
  Pipes pipe3 = new Pipes(395 + 262);
  
  list.add(pipe1);
  list.add(pipe2);
  list.add(pipe3);
  
  birdX = width/2 - 100;
  birdY = height / 2;
  speed = 0;
  accel = 0.6; // gravity
  start = false;
  score = 0;
}

void draw() {
  //println(frameRate);
  if(!start){
    image(bg, 0 , 0); 
    fill(0);
    textSize(30);
    text("Press Space to Play", 55, height/2); 
    
    if(isJumping) {
      jump();
    }
  }
  else {
    background(bg);
    fill(0);
    textSize(30);
    text(score, 20, 30);
    image(birdy, birdX, birdY, birdy.width / 15, birdy.height / 15);
  
    birdY = birdY + speed;
    speed = speed + accel;
    
    if(isJumping) {
      jump();
    }
  
    for(int i = 0; i < 3; i++) {
      list.get(i).update();
      list.get(i).draw();
      fill(0);
      textSize(30);
      text(score, 20, 30);
      
      if(list.get(i).getBarX() < 0) {
        list.get(i).setChecked(false);
        list.get(i).randBarY();
        list.get(i).setBarX(396);
      }
      
      if(list.get(i).isTouching(birdX, birdY)) 
        gameOver();
      
      if(list.get(i).score(birdX))
        score++;
    }
    
    image(bg2, 0, 547);
  
    if(birdY > 524 || birdY < -10 ) {
      gameOver();
    }
    if(gameOver) {
      fill(0, 255, 0);
      rect(-1, -1, 1000, 1000);
      if(score > highScore)
        highScore = score;
      fill(0);
      textSize(30);
      text("U Dieded", 130, height / 2 - 100); 
      textSize(20);
      text("Score: " + score, 158, height / 2 - 30);
      text("High Score: " + highScore,  135, height / 2);
      text("Press r to restart", 115, height / 2 + 50);
      noLoop();
    }
  }
}

void gameOver() {
  gameOver = true;
}

void jump() {
    speed = -10; // control jump height
    isJumping = false;
    start = true;
}

void keyPressed() {
  if(key == ' ') {
    isJumping = true;
  }

  if(key == 'r' && gameOver) {
    gameOver = false;
    setup();
    loop();
  }
}