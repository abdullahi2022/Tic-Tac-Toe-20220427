boolean crossTurn, circleTurn, tied, mouseReleased, box;
//use to control the program's flow goes true or false;
int boxSize, a, fps=12;
 int n; //number of this box
  int x, y; //position of box
  boolean crossed, circled;
  float radius;


void setup() {
  size(700, 700);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
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
 background(0,255,0);

//column 1
  rect(width*1.2/5, height*1.8/5, width*1/4, height*2.5/10);//game board 1
  rect(width*2.3/5, height*1.8/5, width*1/4, height*2.5/10);//game board 2
  rect(width*3.5/5, height*1.8/5, width*1/4, height*2.5/10);//game board 3
  
  //column 2
  rect(width*1.2/5, height*3.05/5, width*1/4, height*2.5/10);//game board 4
  rect(width*2.3/5, height*3.05/5, width*1/4, height*2.5/10);//game board 5
  rect(width*3.5/5, height*3.05/5, width*1/4, height*2.5/10);//game board 6
  
  //column 3
    rect(width*1.2/5, height*4.3/5, width*1/4, height*2.5/10);//game board 7
    rect(width*2.3/5, height*4.3/5, width*1/4, height*2.5/10);//game board 8
    rect(width*3.5/5, height*4.3/5, width*1/4, height*2.5/10);//game board 9

 //Scoreboard
  rect(width*1.3/10, height*1/24, width*5/15, height*4/24); //Player 1
    textCreator(round(25*min(width, height)/700), color(0), "Player X Score:", width*1.3/10, height*1/24);//score for player O

  rect(width*1.8/5, height*1/24, width*5/48, height*4/24); //Player 1 Score
  rect(width*4/7, height*1/24, width*4/15, height*4/24); //Player 2
      textCreator(round(25*min(width, height)/700), color(225, 225, 225), "Player O Score:", width*4/7, height*1/24);//score for player O

  rect(width*41/48, height*1/24, width*5.3/48, height*4/24); //Player 2 Score
}
void textCreator(int ts, color c, String s, float x, float y) {
  textSize(ts);
  fill(c);
  text(s, x, y);
}
void GameOver(){
}
 void drawCross() {
    crossed = true; //mark this box as a cross then switch turn to AI


    line(width*1.2/5, height*1.8/5, width*1/4, height*2.5/10);//game board 1

    line(width-radius, height+radius, width+radius,height-radius);//cross code
  }

  //test
  boolean boxIsEmpty(int a) {
  return (!eachbox[a].crossed && !eachbox[a].circled);
}//used to indicate the value to return from a function
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
