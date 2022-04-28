Boolean twoPlayer2 = false, twoPlayerAI = false;

void twoPlayerBoolean() {
  if (twoPlayer2 == false && mouseX >= scoreA  && mouseX <= impossibleY+scoreWidth && mouseY >= impossibleY && mouseY <= impossibleY+impossibleHeight) {
    twoPlayer2 = true;
    twoPlayerAI = false;
  } else if (twoPlayerAI == false && mouseX >= scoreA  && mouseX <= impossibleY+scoreWidth && mouseY >= impossibleY && mouseY <= impossibleY+impossibleHeight) {
    twoPlayer2 = false;
    twoPlayerAI = true;
  }
}

void twoPlayerGame() {
  if (twoPlayer2 == true) {
    fill(yellowQuitButton);
    noStroke();
    rect(scoreA, impossibleY, scoreWidth, impossibleHeight);
    stroke(1);
    textDraw(playerMode2, titleFont, height, black, CENTER, TOP, scoreA, impossibleY, scoreWidth, impossibleHeight);
  }
  if (twoPlayerAI == true) {
    fill(yellowQuitButton);
    noStroke();
    rect(scoreA, impossibleY, scoreWidth, impossibleHeight);
    stroke(1);
    textDraw(playerModeAI, titleFont, height, black, CENTER, CENTER, scoreA, impossibleY, scoreWidth, impossibleHeight);
  }
}
void play2player() {
  //Current Procedure
  //println("Play two player");
  drawXO();
  Boolean win = winCheck();
  if(win == true) winDraw();
}

void twoPlayerKey() {
  if ( twoPlayer2 == true) {
    play2player();
  } else if (twoPlayerAI == true) {
    //println("Now playing 2-Player AI");
  } //should reset all varaibles with 2-Player
}
