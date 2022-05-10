EachBox [] eachbox;//Every each box represent one data in the list from 0-8
boolean crossTurn, circleturn, mouseReleased, tied;//use to control the program's flow goes true or false
int howmany; //Total count of crosses/circles
int time, finalTime; //Delays AI
int boxSize, fps = 12;//12 frames per second

float c; //Game over menu's color and delay increment

boolean circleturnTimer; //check if timer for Ai's delay is on
boolean gameIsLive; //checks if game is being played

float radius;
void setup() {
  size(700, 700);
  fps = 30;
  frameRate(fps);//Specifies the number of frames to be displayed every second
                  // I will figure out why it is 30 fps later.

  rectMode(CENTER);//Set first two parameters of rect as the shape's center point
  textAlign(CENTER, CENTER);//Sets the current alignment for drawing text to center
  ellipseMode(RADIUS);//Set the first two parameters of ellipse() as the shape's center point, but uses the third and fourth parameters to specify half of the shapes's width and height.
  strokeWeight(3);

  setup2();
}

void setup2 () {
  stroke(0);//color of stroke set to black
  //Reset the variables and check it everytime when game start
  gameIsLive = true;
  crossTurn = true;
  circleturnTimer = false;
  circleturn = false;
  tied = false;
  time = 0;//set the time to zero
  howmany = 0;//set the total count of crosses/circles to zero
  boxSize = round(min(width, height)/4);
  radius = boxSize/2.5;
  c = 0;

  //Clean up background
  background(150, 225, 220);
  eachbox = new EachBox[9];

  for (int i = 0; i < 9; i ++) {
    eachbox[i] = new EachBox(i);
    eachbox[i].drawBoard();
  }//index refers the number of boxes
  textAtTop();//a procedure lead to line 93
}

//Separate input/setup from what needs to be drawn constantly
void draw() {
  //draw doesn't loop after tying..

  //Not only checks gameover but also plays fade-in animation
  checkIfGameOver();
  
  //Delays AI's turn when it is Ai's turn
  

  //checkFrameRate();
}


void checkFrameRate() {
  noStroke();
  rectCreator(color(150, 225, 220), 100, 50, 80, 30);
  stroke(0);
  textCreator(15, color(0), "Lag: " + round(100-100*(frameRate)/fps) + " %", 100, 50);
}//check frame rate lag to make sure it work

void mousePressed() {

  
  mouseReleased = true;

  for (int i = 0; i < 9; i ++) {
    if (boxIsEmpty(i) && crossTurn && eachbox[i].isUserHoveringOverBox() && mouseReleased && gameIsLive) {
      eachbox[i].drawCross();//if the box is empty and the player plays,and game is live. leave a cross there
      mouseReleased = false;
    }
  }
}

void mouseReleased() {
  mouseReleased = false;//when mouse released, confirm the movenment player made
}

void textAtTop() {
  textCreator(40, color(0), "Tic-Tac-Toe", width/2, 40);
  textCreator(20, color(255, 0, 0), "UNBEATABLE", width/2, 75);
  textCreator(25, color(0), "By Tanay Singhal", width/2, 100);
 textCreator(15, color(0), " Analyzed By Yan", width/2, 125);
}//Text Part

void textCreator(int ts, color c, String s, float x, float y) {
  textSize(ts);
  fill(c);
  text(s, x, y);
}

void rectCreator(color c, float x, float y, float w, float h) {
  fill(c);
  rect(x, y, w, h);
}//They use default values to textCreator/textCreator

void moveTo(int a) {
  eachbox[a].drawCircle();
  circleturn = false;//Put a circle in this position
}

void startCorner() {
  int r = round(random(3));//Random a float number between 0-3(includ decimal), then round it to an interger(0 and 3 are 1/6, 1 and 2 are 1/3)
  int a = 0;//set the variable to 0
  if (r == 0) a = 0;
  else if (r == 1) a = 2;
  else if (r == 2) a = 6;
  else a = 8;// when r =3, a= 8
  //When player start at center,randomly decides a corner to start from, and put a circle in that position.
  eachbox[a].drawCircle();
  circleturn = false;
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

void checkIfGameOver() {
  if (circleWins()) {
    gameOver("YOU LOSE");
  } else if (crossWins()) {
    gameOver("YOU WIN");
  } else if (tied) {
    gameOver("TIED");
  } //connect the String message (line 259)
}

//Create the game over menu
void gameOver(String message) {
  gameIsLive = false;// create variable message which represent the result of game 
  if (c < 200) c += 120/(fps+1);//float c = Game over menu's color and delay increment (add 120/(30+1) everytime until reach 200)
  stroke(0, c);
  rectCreator(color(0, c), width/2, height/2 + 50, width-100, 200);
  textCreator(round(95*min(width, height)/800), color(255, c), message, width/2, height/2);//message should only be lose or tied if the code working
  rect(width/3, height/2 + 100, 100, 50);
  rect(width*2/3, height/2 + 100, 100, 50);//Create the rect part of game over menu.

  textCreator(round(25*min(width, height)/800), color(0, c), "RESTART", width/3, height/2+100);
  text("SAVE", width*2/3, height/2 + 100);//Create the text part of game over menu.

  stroke(0);
  if (overRect(width/3, height/2+100, 100, 50) && mouseReleased) {
    mouseReleased = false;
    //when player click restart, reset all variables and clear background
    setup();
  } else if (overRect(width*2/3, height/2+100, 100, 50) && mouseReleased) {
    mouseReleased = false;
    saveFrame ();
  }//when player click save, auto save the  screenshot of this particular game to folder
}

void switchTurns() {
  //Player's turn

  howmany ++; 
  if (howmany % 2 == 1 && gameIsLive) {
    crossTurn = false;
    circleturnTimer = true;
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
  else if (Op(3, 4, 5)) return true;
  else if (Op(6, 7, 8)) return true;
  else if (Op(0, 3, 6)) return true;
  else if (Op(1, 4, 7)) return true;
  else if (Op(2, 5, 8)) return true;
  else if (Op(0, 4, 8)) return true;
  else if (Op(2, 4, 6)) return true;
  else return false;
}

boolean crossWins() {
  if (Xp(0, 1, 2)) return true;
  else if (Xp(3, 4, 5)) return true;
  else if (Xp(6, 7, 8)) return true;
  else if (Xp(0, 3, 6)) return true;
  else if (Xp(1, 4, 7)) return true;
  else if (Xp(2, 5, 8)) return true;
  else if (Xp(0, 4, 8)) return true;
  else if (Xp(2, 4, 6)) return true;
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

  void drawBoard() {
    rectCreator(color(255, 255, 220), x, y, boxSize, boxSize);
  }
//determine the background and draw the board
  void drawCross() {
    crossed = true; //mark this box as a cross then switch turn to AI
    switchTurns();

    if (howmany == 9) tied = true;

    line(x-radius, y-radius, x+radius, y+radius);
    line(x-radius, y+radius, x+radius, y-radius);//cross code
  }

  void drawCircle() {
    circled = true; //mark this box as a circle and draw one there
    switchTurns();

   
  }

  boolean isUserHoveringOverBox() {
    return overRect(x, y, boxSize, boxSize);
  }
}//determine which box will fill with cross
