//TicTacToe medium mode
//there is 50/50 chance of either the computer or you winning it .
boolean crossTurn, ComputerTurn, mouseReleased, tied, ComputerTurnTimer, gameIsLive ;//use to control the program's flow goes true or false
int howmany, finalTime, boxSize, time, fps = 12 ;
float c, radius; 

void setup() {
  size(700, 700);
  fps = 30;
  frameRate(fps);//Specifies the number of frames to be displayed every second

  
  textAlign(CENTER, CENTER);//Sets the current alignment for drawing text to center
ellipseMode(RADIUS);
  strokeWeight(9);

  setup2();
}
EachBox [] eachbox;
void setup2 () {
  stroke(0);//color of stroke set to black
  //Reset the variables and check it everytime when game start
  gameIsLive = true;
  crossTurn = true;
  ComputerTurnTimer = false;
  ComputerTurn = false;
  tied = false;
  time = 0;//set the time to zero
  howmany = 0;//set the total count of crosses/circles to zero
  boxSize = round(min(width, height)/4);
  radius = boxSize/2.5;
  c = 0;

  //Clean up background of the board
  background(555, 333, 220);
  eachbox = new EachBox[9];

   for (int i = 0; i < 9; i ++) {
    eachbox[i] = new EachBox(i);
    eachbox[i].drawBoard();
  }//index refers the number of boxes
  textAtTop();//a procedure lead to line 93
}
//dawing the game board and stuff
void draw() {
  checkIfGameOver();
  
  //Delays Computer's turn when it is Human's turn
  if (ComputerTurnTimer && gameIsLive) {
    ComputerDelay();
  }

  //checkFrameRate();
}


void checkFrameRate() {
  noStroke();
  rectCreator(color(150, 225, 220), 100, 50, 80, 30);
  stroke(222, 333);
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

//text part
void textAtTop() {
  textCreator(40, color(0), "Tic Tac Toe", width/2, 40);
    textCreator(25, color(0), "Human vs Ai", width/2, 100);
  textCreator(29, color(255, 0, 0), "Medium Mode", width/2, 75);
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

//computer moves
void moveTo(int a) {
  eachbox[a].drawCircle();
  ComputerTurn = false;//Put a circle in this position
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
  ComputerTurn = false;
}

void ComputerFirstMove() {
  if (K1(4)) startCorner();
  else moveTo(6);
   //Take the center if player didnt make their first move on it (K1 represent the player's first move)
}

void ComputerMoves() {
   //Attack movies corresponding  to the player's action (Only Run Once When Computer have chance to make threaten)
  if (K2(1, 2, 0)) moveTo(0);
  else if (K2(0, 2, 1)) moveTo(1);
  else if (K2(4, 5, 3)) moveTo(3);
  else if (K2(6, 8, 7)) moveTo(7);
  //done with horizontal

  else if (K2(5, 8, 2)) moveTo(2);
  else if (K2(0, 6, 3)) moveTo(3);
  else if (K2(1, 7, 4)) moveTo(4);
  else if (K2(2, 8, 5)) moveTo(5);
  else if (K2(0, 3, 6)) moveTo(6);
  else if (K2(1, 4, 7)) moveTo(7);
  else if (K2(2, 5, 8)) moveTo(8);
  //done with vertical
  else if (K2(6, 4, 2)) moveTo(2); 
  else if (K2(0, 8, 4)) moveTo(4); 
  else if (K2(0, 4, 8)) moveTo(8); 

  //Attack movies corresponding  to the player's action (Only run once when player already made threaten)
  else if (K3(0, 2, 1)) moveTo(1);
  else if (K3(4, 5, 3)) moveTo(3);
  else if (K3(3, 5, 4)) moveTo(4); //not necessary cause Computer will take it first move on center if it's possibe (Player didn't take it)
  else if (K3(6, 7, 8)) moveTo(8);
  //done with horizontal
  else if (K3(3, 6, 0)) moveTo(0);
  else if (K3(5, 8, 2)) moveTo(2);

  else if (K3(0, 6, 3)) moveTo(3);
  else if (K3(1, 7, 4)) moveTo(4); //not necessary cause Computer will take it first move on center if it's possibe (Player didn't take it)
  else if (K3(0, 3, 6)) moveTo(6);
  else if (K3(2, 5, 8)) moveTo(8);
  //done with vertical
  else if (K3(4, 6, 2)) moveTo(2);
  else if (K3(0, 8, 4)) moveTo(4); //not necessary cause Computer will take it first move on center if it's possibe (Player didn't take it)
  else if (K3(2, 4, 6)) moveTo(6); //not necessary cause player wont got chance to go center if they didnt make their first move on it
  else if (K3(0, 4, 8)) moveTo(8); //not necessary cause player wont got chance to go center if they didnt make their first move on it

  //defending strategy (thinking 2 steps ahead to avoid the double threaten)
  //Set A
  else if (K3(1, 3, 0)) moveTo(0);
  else if (K3(5, 7, 8)) moveTo(8);

  //Set B
  else if (K3(3, 8, 7)) moveTo(7); //3,8--> 7
  else if (K3(5, 6, 7)) moveTo(7);//6,5--> 7
 
  else if (K3(0, 7, 3)) moveTo(3); //2,7--> 3
  else if (K3(1, 6, 3)) moveTo(3);//1,8--> 3
  else if (K3(2, 3, 1)) moveTo(1);//2,3-->1

  //Set C
  
  else if (K3(4, 8, 2)) moveTo(2);//0,5-->1
 
  //random moves
  //Set 4 when the player take their first two step at corner take random action
  else if (K1(2) && K1(6)) randomAction(); //2, 6
  else if (K1(0) && K1(8)) randomAction(); //0, 8

  //If no threat or attacking opportunity, play in random position
  else while (true) {
    int i = round(random(8));
    if (boxIsEmpty(i) && i != 1) {
      moveTo(i);//work same with line 115. But here it could be any random number between 0-8 but 1(figure why is 1 later)
      break;//end the execution of while
    }
  }
}

//Random moves but it puts you in a correct positions
void randomAction() {
  while (true) {
    int i = round(random(1, 4))*2 - 1;//possibilities: 1, 3, 5, 7
    if (boxIsEmpty(i)) {
      moveTo(i);
      break;
    }
  }
}

//If all the boxes are filled up, we have tied. Screen would show up saying "TIED". 
void checkHowMany () {
  if (howmany == 9) tied = true;
}


void switchTurns() {
  //Player's turn

  howmany ++; 
  if (howmany % 2 == 1 && gameIsLive) {
    crossTurn = false;
    ComputerTurnTimer = true;
  }//because player always play first so every time when howmany % 2 == 1 it will be player's turn
}

//Delaying the Computer's move to let the player make a move. 
void ComputerDelay() {
  //Delay the Computer's move to let player hae time to make move
  finalTime = (int)frameRate;
  if (time < finalTime) time++;//increase time by 1 which is Computer's delay time
  //When the time comes, play it once and then it switches to players turn
  else {
    ComputerTurnTimer = false;
    ComputerTurn = true;

    if (howmany == 1) ComputerFirstMove();//when how many =1, it's player's move
    else ComputerMoves();

    time = 0;//set time back to zero
    
    ComputerTurn = false;
    crossTurn = true;//cross turn = player turn
  }
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
}//xp represent player's move and op represent Computer

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

//postive pattern of win
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
class EachBox {
  int n; //number of this box
  int x, y; //position of box
  boolean crossed, circled;
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


//Dawing Game board (rectangles)
void drawBoard() {
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
}
//Drawing X and O inside the circle
  void drawCross() {
    crossed = true; //mark this box as a cross then switch turn to Computer
    switchTurns();

    if (howmany == 9) tied = true;

    line(x-radius, y-radius, x+radius, y+radius);
    line(x-radius, y+radius, x+radius, y-radius);//cross code
  }

  void drawCircle() {
    circled = true; //mark this box as a circle and draw one there
    switchTurns();

    if (howmany == 9) tied = true;
    fill(255, 255, 220);
    ellipse(x, y, radius, radius);//circle code
  }

  boolean isUserHoveringOverBox() {
    return overRect(x, y, boxSize, boxSize);
  }
}
//check if the game is over or if someone won
void checkIfGameOver() {
  if (circleWins()) {
    gameOver("YOU LOSE");
  } else if (crossWins()) {
    gameOver("YOU WIN:)");
  } else if (tied) {
    gameOver("TIED");
  } 
}
//Creates the game over menu and variable message which represent the result of game
void gameOver(String message) {
  gameIsLive = false;// create variable message which represent the result of game 
  if (c < 200) c += 120/(fps+1);//float c = Game over menu's color and delay increment (add 120/(30+1) everytime until reach 200)
  stroke(0, c);
  rectCreator(color(444, 555, 150), width/2, height/2 + 50, width-100, 200);
  textCreator(round(95*min(width, height)/800), color(255, 11, 222), message, width/2, height/2);
  rect(width*3/6, height/2 + 100, 100, 50);
  textCreator(round(25*min(width, height)/800), color(555, 333, 220), "RESTART", width*3/6, height/2+100);
  //when player click restart, reset all variables and clear background
//this "restart" button allows to you play the game again when you press it.


  stroke(0);
  if (overRect(width*3/6, height/2+100, 100, 50) && mouseReleased) {
    mouseReleased = false;
    setup();

  }
}
