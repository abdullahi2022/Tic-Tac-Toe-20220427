EachBox [] eachbox;//Every each box represent one data in the list from 0-8
boolean crossTurn, circleTurn, mouseReleased, tied;//use to control the program's flow goes true or false
int appWidth, appHeight, fontSize;
String title = "ABDULLAHI!", footer="";
float titleX, titleY, titleWidth, titleHeight;
float footerX, footerY, footerWidth, footerHeight;
PFont titleFont;
color purple=#2C08FF, resetDefaultInk=#FFFFFF; //Not night mode friendly
int howmany; //Total count of crosses/circles
int time, finalTime; //Delays AI
int boxSize, fps = 12;//12 frames per second
float c; //Game over menu's color and delay increment
boolean circleTurnTimer; //check if timer for Ai's delay is on

boolean gameIsLive; //checks if game is being played

float radius;

float backgroundImageX, backgroundImageY, backgroundImageWidth, backgroundImageHeight;
float topX, topY, topWidth, topHeight;
float bottomX, bottomY, bottomWidth, bottomHeight;
float picWidthAdjusted1=0.0, picHeightAdjusted1=0.0;

PImage pic1, pic2, pic3;
Boolean nightMode=false;
int tintDayMode=255, tintDayModeOpacity=50, tintRed=64, tintGreen=64, tintBlue=40, tintNightModeOpacity=85;


void setup() {

 //size(500, 600); //Portrait
  appWidth = width;
  appHeight = height;

  //Population
  titleX = footerX = appWidth * 2/4;
  titleY = appHeight * 1/8;
  footerY = appHeight * 8/10;
  titleWidth = footerWidth = appWidth * 1/2;
  titleHeight = footerHeight = appHeight * 1/10;
  //
  //Text Setup, single executed code
  //Font from OS (Operating System)
  String[] fontList = PFont.list(); //To list all fonts available on OS
  printArray(fontList); //For listing all possible fonts
  titleFont = createFont("Verdana Bold", 55); //Verify the font exists in Processing.JAVA
  // Tools / Create Font / Find Font / Do not press "OK", known bug
  //
  //Layout our text space and typographical features
  rect(titleX, titleY, titleWidth, titleHeight);
  rect(footerX, footerY, footerWidth, footerHeight);
  //

  size(700, 700);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
    rectMode(CENTER);//Set first two parameters of rect as the shape's center point
  textAlign(CENTER, CENTER);//Sets the current alignment for drawing text to center
  ellipseMode(RADIUS);//Set the first two parameters of ellipse() as the shape's center point, but uses the third and fourth parameters to specify half of the shapes's width and height.
  strokeWeight(3);
  

  setup2();
  //background(280, 333, 220);
  background(222, 333, 777);


   
  
  //intro to the game
          textCreator(round(25*min(width, height)/700), color(159, 0, 159), "MEASLES / Text Dynamics", width*3.4/7, height*1/24);//score for player O
                   textCreator(round(25*min(width, height)/700), color(255, 0, 0), "Imaginary rectangle - click the middle part ", width*3.4/7, height*23/24);//score for player O

          textCreator(round(25*min(width, height)/700), color(150, 30, 450), "", width*3.4/7, height*3/24);//score for player O


 // rect(width*41/48, height*1/24, width*5.3/48, height*4/24); //Player 2 Score
  
  //Abd code
}

void setup2 () {
  stroke(0);//color of stroke set to black
  //Reset the variables and check it everytime when game start
  gameIsLive = true;
  crossTurn = true;
  circleTurn = true;
  tied = false;
  time = 0;//set the time to zero
  howmany = 0;//set the total count of crosses/circles to zero
  boxSize = round(min(width, height)/4);
  radius = boxSize/2.5;
  c = 0;

  //Clean up background
  eachbox = new EachBox[9];

  for (int i = 0; i < 9; i ++) {
    eachbox[i] = new EachBox(i);
  }//index refers the number of boxes
}

//Separate input/setup from what needs to be drawn constantly
void draw() {
//Text Draw: Repeatedly Executed Code
  fill(purple); //Ink
  textAlign(CENTER, CENTER); //Align X&Y, see Processing.org / Reference
  //Values: [ LEFT | CENTER | RIGHT ] & [ TOP | CENTER | BOTTOM | BASELINE ]
  fontSize = 50;
  textFont(titleFont, fontSize);
  text( title, titleX, titleY, titleWidth, titleHeight );
  textAlign(CENTER, BOTTOM); //Align X&Y, see Processing.org / Reference
  //Values: [ LEFT | CENTER | RIGHT ] & [ TOP | CENTER | BOTTOM | BASELINE ]
  text( footer, footerX, footerY, footerWidth, footerHeight );
  fill(resetDefaultInk);
}


void checkFrameRate() {
  noStroke();
 // rectCreator(0, 100, 50, 80, 30);
  //  rectCreator(color(150, 225, 220), 100, 50, 80, 30);
stroke(0);
  textCreator(15, color(0), "Lag: " + round(100-100*(frameRate)/fps) + " %", 100, 50);
}//check frame rate lag to make sure it work

void mousePressed() {

  
  mouseReleased = true;

  for (int i = 0; i < 9; i ++) {
    if (boxIsEmpty(i) && crossTurn && eachbox[i].isUserHoveringOverBox() && mouseReleased && gameIsLive) {
      eachbox[i].drawCross();//if the box is empty and the player plays,and game is live. leave a cross there
      eachbox[i].drawCircle();//if the box is empty and the player plays,and game is live. leave a cross there

      mouseReleased = false;
    }
  }
}

void mouseReleased() {
  mouseReleased = false;//when mouse released, confirm the movenment player made
}


void textCreator(int ts, color c, String s, float x, float y) {
  textSize(ts);
  fill(c);
  text(s, x, y);
}

void rectCreator( color c, float x, float y, float w, float h) {
  fill(c);
  rect(x, y, w, h);
}//They use default values to textCreator/textCreator

void moveTo(int a) {
  eachbox[a].drawCircle();
  circleTurn = false;//Put a circle in this position
}



void randomAction() {
  //It randomly puts you in CORRECT positions
  while (true) {
    int i = round(random(1, 4))*2 - 1;//possibilities: 1, 3, 5, 7
    //These are four same probability actions which connect the front code(Start at line 215) 
    if (boxIsEmpty(i)) {
      moveTo(i);
      break;
    }
  }
}

void checkHowMany () {
  //If all the boxes are filled up, we have tied
  if (howmany == 9) tied = true;
}

void switchTurns() {
  //Player's turn

  howmany ++; 
  if (howmany % 2 == 1 && gameIsLive) {
    crossTurn = true;
    circleTurn = false;
  }//because player always play first so every time when howmany % 2 == 1 it will be player's turn
}


//Check if user's mouse is hovering over a rectangle (boolean is use to check the value true or not)
boolean overRect(float x, float y, float w, float h) {
  return (mouseX >= x-w/2 && mouseX <= x+w/2 && mouseY >= y-h/2 && mouseY <= y+h/2);
}//represent: x-cordinate, y-cordinate, width, height

//Check if a box is empty
boolean boxIsEmpty(int a) {
  return (!eachbox[a].crossed && !eachbox[a].circled);
}//used to indicate the value to return from a function

//Check if a box is full
boolean boxFull(int a) {
  return (eachbox[a].crossed || eachbox[a].circled);
}

//Check if a circle occupies the box
boolean K4(int a) {
  return (eachbox[a].circled);
}

//Check if a cross occupies the box
boolean K1(int a) { //K1
  return (eachbox[a].crossed);
}

//Check if the computer won
boolean Op(int a, int b, int c) {
  if (K4(a) && K4(b) && K4(c)) {
    drawLines(a, c);
    return true;
  } else return false;
}//xp represent player's move and op represent AI

//Check if the user miraculously wins
boolean Xp(int a, int b, int c) {
  if (K1(a) && K1(b) && K1(c)) {
    drawLines(a, c); //Draw a line to show the winning positions
    return true;
  } else return false;
}

boolean K2(int a, int b, int c) { //check circle position
  return (K4(a) && K4(b) && boxIsEmpty(c));
}
boolean K3(int a, int b, int c) { //check circle position
  return (K1(a) && K1(b) && boxIsEmpty(c));
}

void drawLines(int a, int c) {
  line(eachbox[a].x, eachbox[a].y, eachbox[c].x, eachbox[c].y);
}//the function for draw lines

boolean circleWins() {
  if (Op(0, 1, 2)) return true;

  else return false;
}

boolean crossWins() {
  if (Xp(0, 1, 2)) return true;

  else return false;
}
//Above codes are all the postive pattern of win
class EachBox {
  int n; //number of this box
  int x, y; //position of box
  boolean crossed, circled;
// represent all the function Eachbox do for the program
  EachBox(int num) {
    rectMode(CENTER);
    n = num;
    num ++;

    setBoxSize(num, round(num/3f - 0.6));
  }//num variable use to determine the exactly size of box. Dont know what 3f represent yet)

  void setBoxSize(int num, float a) {
    x = round(boxSize * (num-a*3));
    y = round(height/2+50 - boxSize + boxSize*a);
  }


//determine the background and draw the board, X and O
  void drawCross() {
    crossed = true; //mark this box as a cross then switch turn to AI
    switchTurns();

    if (howmany == 9) tied = true;

    line(x-radius, y-radius, x+radius, y+radius);
    line(x-radius, y+radius, x+radius, y-radius);//cross code
  }

  void drawCircle() {
    circled = true; //mark this box as a cross then switch turn to AI
    switchTurns();

    if (howmany == 9) tied = true;

    line(x-radius, y+radius, x+radius, y-radius);
    line(x-radius, y-radius, x+radius, y+radius);//cross code
  }

  boolean isUserHoveringOverBox() {
    return overRect(x, y, boxSize, boxSize);
  }
}//determine which box will fill with cross
void gameOver(String message) {
  gameIsLive = false;// create variable message which represent the result of game 
  if (c < 200) c += 120/(fps+1);//float c = Game over menu's color and delay increment (add 120/(30+1) everytime until reach 200)
  stroke(0, c);
 rectCreator(color(0, c), width/2, height/2 + 50, width-100, 200);
  textCreator(round(95*min(width, height)/800), color(255, c), message, width/2, height/2);//message should only be lose or tied if the code working
  //restart board
  rect(width/3, height/2 + 100, 100, 50);
textCreator(round(25*min(width, height)/800), color(0, c), "RESTART", width/3, height/2+100);
  stroke(0);
  if (overRect(width/3, height/2+100, 100, 50) && mouseReleased) {
    mouseReleased = false;
    //when player click restart, reset all variables and clear background
    setup();
  }  else if (overRect(width*2/3, height/2+100, 100, 50) && mouseReleased) {
    mouseReleased = false;
    saveFrame ();
  }//when player click save, auto save the  screenshot of this particular game to folder
}
//circle draw

void startCorner() {
  int r = round(random(3));//Random a float number between 0-3(includ decimal), then round it to an interger(0 and 3 are 1/6, 1 and 2 are 1/3)
  int a = 0;//set the variable to 0
  if (r == 0) a = 0;
  else if (r == 1) a = 2;
  else if (r == 2) a = 6;
  else a = 8;// when r =3, a= 8
  //When player start at center,randomly decides a corner to start from, and put a circle in that position.
  eachbox[a].drawCircle();
  circleTurn = false;
}
void aiFirstMove() {
  if (K1(4)) startCorner();
  else moveTo(4);
   //Take the center if player didnt make their first move on it (K1 represent the player's first move)
}
void aiDelay() {
  //Delay the AI's move to let player hae time to make move
  finalTime = (int)frameRate;
  if (time < finalTime) time++;//increase time by 1 which is AI's delay time
  //When the time comes, play it once
  else {
    circleTurnTimer = false;
    circleTurn = true;

    if (howmany == 1) aiFirstMove();//when how many =1, it's player's move
    else circleMoves();

    time = 0;//set time back to zero
    
    circleTurn = false;
    crossTurn = true;//cross turn = player turn
  }
}
void circleMoves() {
 

    int i = round(random(8));
    if (boxIsEmpty(i) && i != 1) {
      moveTo(i);//work same with line 115. But here it could be any random number between 0-8 but 1(figure why is 1 later)
    }
  }
  


//
