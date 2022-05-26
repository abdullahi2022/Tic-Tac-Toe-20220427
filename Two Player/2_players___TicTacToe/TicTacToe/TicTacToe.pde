EachBox [] eachbox;//Every each box represent one data in the list from 0-8
boolean crossTurn, circleTurn, mouseReleased, tied;//use to control the program's flow goes true or false
int howmany; //Total count of crosses/circles
int time, finalTime; //Delays AI
int boxSize, fps = 12;//12 frames per second

float c; //Game over menu's color and delay increment

boolean gameIsLive; //checks if game is being played

float radius;
void setup() {
 background(150,300,150);

  size(700, 700);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
    rectMode(CENTER);//Set first two parameters of rect as the shape's center point
  textAlign(CENTER, CENTER);//Sets the current alignment for drawing text to center
  ellipseMode(RADIUS);//Set the first two parameters of ellipse() as the shape's center point, but uses the third and fourth parameters to specify half of the shapes's width and height.
  strokeWeight(3);
  

  setup2();


   //rect(width/3, height/2 + 100, 100, 50);
  //textCreator(round(25*min(width, height)/800), color(0), "Player X", width/3, height/2+100);
    //text("Player O", width*2/3, height/2, + 100);//Create the text part of game over menu.
    
  //rect(width*1/10, height*0.3/5, width*1.5/4, height*2.5/10);//rect for player X
   // textCreator(round(25*min(width, height)/700), color(0), "Player X Score:", width*0.6/4, height*0.3/5);//score for player X

  //rect(width*3.4/4, height*0.3/5, width*1.3/4, height*2.5/10);//rect for player O
  //  textCreator(round(25*min(width, height)/700), color(255, 0, 0), "Player O Score:", width*3.3/4, height*0.3/5);//score for player O

//text t the top
//  rect(width*1.1/5, height*1/10, width*2/4, height*2.5/10);//rect for player X
  //rect(width*3.9/5, height*1/10, width*2/4, height*2.5/10);//rect for player X

//column 1
  rect(width*1.25/5, height*1.6/5, width*1/4, height*2.5/10);//game board 1
  rect(width*2.45/5, height*1.6/5, width*1/4, height*2.5/10);//game board 2
  rect(width*3.7/5, height*1.6/5, width*1/4, height*2.5/10);//game board 3
  
  //column 2
  rect(width*1.25/5, height*2.87/5, width*1/4, height*2.5/10);//game board 4
  rect(width*2.45/5, height*2.87/5, width*1/4, height*2.5/10);//game board 5
  rect(width*3.7/5, height*2.87/5, width*1/4, height*2.5/10);//game board 6
  
  //column 3
    rect(width*1.25/5, height*4.1/5, width*1/4, height*2.5/10);//game board 7
    rect(width*2.45/5, height*4.1/5, width*1/4, height*2.5/10);//game board 8
    rect(width*3.7/5, height*4.1/5, width*1/4, height*2.5/10);//game board 9

 //Scoreboard
  rect(width*1.3/10, height*1/24, width*5/15, height*4/24); //Player 1
    textCreator(round(25*min(width, height)/700), color(0), "Player X Score:", width*1.3/10, height*1/24);//score for player O

  rect(width*1.8/5, height*1/24, width*5/48, height*4/24); //Player 1 Score
  rect(width*4/7, height*1/24, width*4/15, height*4/24); //Player 2
      textCreator(round(25*min(width, height)/700), color(225, 225, 225), "Player O Score:", width*4/7, height*1/24);//score for player O

  rect(width*41/48, height*1/24, width*5.3/48, height*4/24); //Player 2 Score
  
  //Abd code
}

void setup2 () {
  stroke(0);//color of stroke set to black
  //Reset the variables and check it everytime when game start
  gameIsLive = true;
  crossTurn = true;
  circleTurn = false;
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
  //draw doesn't loop after tying..

  //Not only checks gameover but also plays fade-in animation
  checkIfGameOver();
  
  
  //checkFrameRate();
}


void checkFrameRate() {
  noStroke();
  rectCreator(0, 100, 50, 80, 30);
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

void startCorner() {
  int r = round(random(3));//Random a float number between 0-3(includ decimal), then round it to an interger(0 and 3 are 1/6, 1 and 2 are 1/3)
  int a = 0;//set the variable to 0
  if (r == 0) a = 0;
  else if (r == 1) a = 2;//circleTurn
  else if (r == 2) a = 6;
  else a = 8;// when r =3, a= 8
  //When player start at center,randomly decides a corner to start from, and put a circle in that position.
  eachbox[a].drawCircle();
  circleTurn = false;
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
    gameOver("Player X WINS");
  } else if (crossWins()) {
    gameOver("Player O WIN");
  } else if (tied) {
    gameOver("TIED");
  } //connect the String message (line 259)
}

//Create the game over menu


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
