import javafx.scene.effect.Light;
import javafx.scene.effect.Light;
//Global Variables
//
PFont quitButtonFont;
PFont titleFont;
color purple = #2C08FF; //Ink
color purpleQuitButton = #FFDBFB;
color yellowQuitButton = #FEFFDB, otherYellow = #FAFF03;
color black = #000000;


void quitButtonRect() {
  noStroke();
  rect(width*19/20, height*0, width*1/20, height*1/20);
  stroke(1);
}
//

 

PFont font;
int Xscore = 0;
int Oscore = 0;
int turn = 1;
int mode = 0;
int light;
int dark;
int gamePlayDraw;
boolean darkMode = false;
int r1c1 = 0;
int r1c2 = 0;
int r1c3 = 0;
int r2c1 = 0;
int r2c2 = 0;
int r2c3 = 0;
int r3c1 = 0;
int r3c2 = 0;
int r3c3 = 0;
boolean over = false;
int spaceToChange;


void draw() {
  if (over) {
    delay(3000);
    mousePressed = false;
    reset();
    turn=1;
    over = false;
  }
  if (turn==0) {
    turn=1;
  }
  if (darkMode) {
    light = 0;
    dark = 255;
  } else {
    light = 255;
    dark = 0;
  }

  fill(light);
  stroke(dark);
  rect(0, 0, width, height);
  fill(dark);
  stroke(light);
  text(Xscore, 50, 50);
  text(Oscore, 400, 50);
  fill(dark);
  stroke(light);
  fill(#DB58CE);
  rect(0, 0, 15, 15);
  fill(light);
  stroke(dark);
fill(255,200,200);
  rect (100, 25, 350, 100);
  modeDraw();

fill(255,0,0);
  rect(0, 100, 150, 250);//row 1
  rect(150, 100, 300, 250);
  rect(300, 100, 450, 250);
  rect(0, 250, 150, 400);//row2
  rect(150, 250, 300, 400);
  rect(300, 250, 450, 400);
  rect(0, 400, 150, 550);//row3
  rect(150, 400, 300, 550);
  rect(300, 400, 450, 550);

    gamePlay();
  if (Xscore == 10) {
    Xwin();
  }
  if (Oscore == 10) {
    Owin();
  }
  quitButtonDraw();
}

void mouseClicked() {
  if (over != true) {
    if (mouseX<15&&mouseX>0&&mouseY<15&&mouseY>0) {
      if (darkMode) {
        darkMode = false;
      } else {
        darkMode = true;
      }
    }
    if (mouseX<450&&mouseX>100&&mouseY<125&&mouseY>25) {
      if (mode<3) {
        mode++;
        if (turn == 2) {
          AI();
          score();
        }
      } else {
        mode=0;
      }
    }
    if (turn == 1) || mode == 1);
       }
}
void gamePlayClick(){
      score();
      if (mode != 0 && turn == 2) {
        AI();
        score();
      }
    }
    gamePlayDraw();
  }
   quitButtonFont();
}

void modeDraw() {
  fill(dark);
  stroke(light);
  if (mode==0) {
    text("2 PLAYER MODE", 225, 65);
  }
  if (mode==1) {
    text("EASY MODE", 225, 65);
  }
  if (mode==2) {
    text("MEDIUM MODE", 225, 65);
  }
  if (mode==3) {
    text("IMPOSSIBLE MODE", 225, 65);
  }
  fill(light);
  stroke(dark);
}


void mouseReleased(){  
}

//
void score() {
  if (r1c1 == r1c2 && r1c2 == r1c3 && r1c1 != 0) {//row 1
    over = true;
    fill(light);
    rect(0, 0, width, 100);
    fill(dark);
    turn = 0;
    if (r1c1 == 1) {
      text("X Wins", width/2, height/10);
      Xscore++;  
    }
    if (r1c1 == 2) {
      text("O Wins", width/2, height/10);
      Oscore++;
    }
  }
  if (r2c1 == r2c2 && r2c2 == r2c3 && r2c1 != 0) {//row 2
    over = true;
    fill(light);
    rect(0, 0, width, 100);
    fill(dark);
    turn = 0;
    if (r2c1 == 1) {
      text("X Wins", width/2, height/10);
      Xscore++;  
    }
    if (r2c1 == 2) {
      text("O Wins", width/2, height/10);
      Oscore++;
    }
  }
  if (r3c1 == r3c2 && r3c2 == r3c3 && r3c1 != 0) {//row 3
    over = true;
    fill(light);
    rect(0, 0, width, 100);
    fill(dark);
    turn = 0;
    if (r3c1 == 1) {
      text("X Wins", width/2, height/10);
      Xscore++;  
    }
    if (r3c1 == 2) {
      text("O Wins", width/2, height/10);
      Oscore++;
    }
  }
  if (r1c1 == r2c1 && r2c1 == r3c1 && r1c1 != 0) {//colmn 1
    over = true;
    fill(light);
    rect(0, 0, width, 100);
    fill(dark);
    turn = 0;
    if (r1c1 == 1) {
      text("X Wins", width/2, height/10);
      Xscore++;  
    }
    if (r1c1 == 2) {
      text("O Wins", width/2, height/10);
      Oscore++;
    }
  }
  if (r1c2 == r2c2 && r2c2 == r3c2 && r1c2 != 0) {//colmn 2
    over = true;
    fill(light);
    rect(0, 0, width, 100);
    fill(dark);
    turn = 0;
    if (r1c2 == 1) {
      text("X Wins", width/2, height/10);
      Xscore++;  
    }
    if (r1c2 == 2) {
      text("O Wins", width/2, height/10);
      Oscore++;
    }
  }
  if (r1c3 == r2c3 && r2c3 == r3c3 && r1c3 != 0) {//colmn 3
    over = true;
    fill(light);
    rect(0, 0, width, 100);
    fill(dark);
    turn = 0;
    if (r1c3 == 1) {
      text("X Wins", width/2, height/10);
      Xscore++;  
    }
    if (r1c3 == 2) {
      text("O Wins", width/2, height/10);
      Oscore++;
    }
  }
  if (r1c1 == r2c2 && r2c2 == r3c3 && r1c1 != 0) {//D=
    over = true;
    fill(light);
    rect(0, 0, width, 100);
    fill(dark);
    turn = 0;
    if (r1c1 == 1) {
      text("X Wins", width/2, height/10);
      Xscore++;  
    }
    if (r1c1 == 2) {
      text("O Wins", width/2, height/10);
      Oscore++;
    }
  }
  if (r1c3 == r2c2 && r2c2 == r3c1 && r1c3 != 0) {//D!=
    over = true;
    fill(light);
    rect(0, 0, width, 100);
    fill(dark);
    turn = 0;
    if (r1c3 == 1) {
      text("WINNER IS X!!! HOOOOOOOOOOOO", width/2, height/10);
      Xscore++;  
    }
    if (r1c3 == 2) {
      text("WINNER IS O!!! HOOOOOOOOOOOO", width/2, height/10);
      Oscore++;
    }
  }
  if (r1c1 != 0 && r1c2 != 0 && r1c3 != 0 && r2c1 != 0 && r2c2 != 0 && r2c3 != 0 && r3c1 != 0 && r3c2 != 0 &&r3c3 != 0 && over != true) {
    over = true;
    fill(light);
    rect(width, 0, 0, 100);
    fill(dark);
    text("TIE !!! THEY ARE SUCKS", width/2, height/10);
    turn = 0;
  }
  fill(light);
}

void reset() {
  r1c1 = 0;
  r1c2 = 0;
  r1c3 = 0;
  r2c1 = 0;
  r2c2 = 0;
  r2c3 = 0;
  r3c1 = 0;
  r3c2 = 0;
  r3c3 = 0;
}

void Xwin() {
  fill(light);
  rect(width, height, 0, 0);
  fill(dark);
  text("WINNER IS X!!! HOOOOOOOOOOOO "+Xscore+" to "+Oscore, width/2, 100/2);
  over = true;
}

void Owin() {
  fill(light);
  rect(width, height, 0, 0);
  fill(dark);
  text("WINNER IS O!!! HOOOOOOOOOOOO"+Oscore+" to "+Xscore, width/2, 100/2);
  over = true;
}
void setup()
{
  size(600, 600); //fullScreen(); //displayWidth, displayHeight
  //Code evaluates if the WINDOW Size will be able to be displayed, reduce by percentage if "NO"
  //Code inspects geometry, what is the shorter side, always displays board right side up
  println("What is bigger? DisplayWidth or width:", displayWidth, width);
  println("What is bigger? DisplayHeight or height:", displayHeight, height);
  println("what is the geometery for a Square Orientation?");
  //Code creates Square Geometry
  //Thus, phone can be either orientation, still able to play Tic Tac Toe
  //Algorithm saves user from themselves, always displays CANVAS
//
 size(600, 600); //To Illustrate use of Display Geometry
  //fullScreen(); //uses displayWidth and displayHeight
  println("Screen Width:", displayWidth, "\tHeight:", displayHeight);
  println("Starting of Console"); // If you cannot see this, the find another way to see the list on the program
  
  background(255);
  
  //Main Divisions
  line(width*1/3, 0, width*1/3, height);
  
  line(width*2/3, 0, width*2/3, height);
  line(0, height*1/4, width, height*1/4);
  line(0, height*1/2, width, height*1/2);
  line(0, height*3/4, width, height*3/4);
  
  //Easy, Medium, Mastery Buttons
  line(0, height*1/12, width*1/3, height*1/12);
  line(0, height*2/12, width*1/3, height*2/12);
  
}//End Setup
//
void quitButtonDraw() {
if (mouseX >= width*19/20  && mouseX <= width && mouseY >= height*0 && mouseY <= height) {
    fill(otherYellow);
    quitButtonRect();
  } else {
    fill(purpleQuitButton);
    quitButtonRect();
  }

  //Text in Quit Button
  fill(purple); //Ink, hexidecimal copied from Color Selector
  textAlign (CENTER, CENTER); //Align X&Y, see Processing.org / Reference
  //Values: [LEFT | CENTER | RIGHT] & [TOP | CENTER | BOTTOM | BASELINE]
  textFont(quitButtonFont, 20); //Change the number until it fits, largest font size
  fill(255); //Reset to white for rest of the program
}


void mousePressed(){
}//End mousePressed
//
void keyPressed() {}//End keyPressed
//
//End MAIN Program
