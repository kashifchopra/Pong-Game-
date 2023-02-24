
float circlex = random(0, 800);
float circley= random (0, 200); //these 2 steps declare the variable
int gap=50;
int paddley; // 20 is the height of the paddle
int paddlex; // paddle width
float gravity = 3; 
float dir = random(-10, 10); // random left or right direction for ball 
int points =0;



void setup () {
  size(800, 600);

  circley=50;
}





void draw() {


  float r =random(1, 255);
  float g =random(1, 255);
  float b =random(1, 255);
  int paddley = height - gap-20;
  int paddlex = 100;

  //Crazy Raibow Ball screen:
  if (mousePressed) {
  } else {
    background(150);
  }
  fill(255);



  //Game over screen:
  if (circley>=height) {
    text("Game Over. Press any key to restart", width/3, height/3);
    if (keyPressed==true) {
      circlex = random(0, 800);
      circley= random (0, 200);
      points = 0;
      gravity = 4;
    }
  }


  //Paddle:
  rectMode(CENTER);
  float mx; //mouse x position -> centre of paddle
  mx = constrain(mouseX, paddlex/2, width-paddlex/2); //restricting the paddle from going out
  rect(mx, paddley, paddlex, 20);

  //Score: 
  text("points =" + points, width-80, 20); 

  //Ball:
  fill(r, g, b);
  circle(circlex, circley, 20);
  circley+=gravity;// were updating the variable by 1 pixel in y direction every time
  circlex+=dir; // makes ball go left or right at the start



  //Ball reflection on paddle mechanism
  if ( ((circley+20)> paddley-5) && ((circley+20)< paddley+20) && ((mouseX-paddlex/2)<circlex) && (circlex<(mouseX+paddlex/2))) {
    gravity=gravity*(-1);
    gravity-=0.5; // increase ball speed
    points++;
  }

  //Ball reflection on walls machanism: 

  if (circlex<0 || circlex>width) {
    dir = dir*(-1);
  }

  if (circley<0) {
    gravity=gravity*(-1);
  }
}
