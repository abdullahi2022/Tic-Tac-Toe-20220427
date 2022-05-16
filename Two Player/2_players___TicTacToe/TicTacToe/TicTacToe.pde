boolean crossTurn, circleTurn, mouseReleased, tied;
int boxSize;

void setup() {
  size(700, 700);
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
   //rect(width/3, height/2 + 100, 100, 50);
  //textCreator(round(25*min(width, height)/800), color(0), "Player X", width/3, height/2+100);
    //text("Player O", width*2/3, height/2, + 100);//Create the text part of game over menu.
    
  rect(width*1/10, height*0.3/5, width*1.5/4, height*2.5/10);//rect for player X
    textCreator(round(25*min(width, height)/700), color(0), "Player X Score:", width*0.6/4, height*0.3/5);//score for player X

  rect(width*3.4/4, height*0.3/5, width*1.3/4, height*2.5/10);//rect for player O
    textCreator(round(25*min(width, height)/700), color(255, 0, 0), "Player O Score:", width*3.3/4, height*0.3/5);//score for player O

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

 // background(150, 225, 220);
}
void textCreator(int ts, color c, String s, float x, float y) {
  textSize(ts);
  fill(c);
  text(s, x, y);
}
void GameOver(){
  
  
}
  
  
