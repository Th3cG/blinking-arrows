//introducing variables
//n manages the timing for left and right arrows
int n;

//m and on manage the timing for emergency arrows
int m;
boolean on;


void setup() {
  //I'm forced to slow down frameRate to have an appreciable result
  frameRate(20);

  size(640, 360);
  background(0);

  //assigning initial values to variables
  n = 0;
  m = 0;
  on = false;
}


void draw() {

  fill(255, 215, 0);
  noStroke();

  //calling the various functions
  leftArrow();
  rightArrow();
  emergencyArrow();
  brake();

  //creating rectangles to make the arrows seem discontinuous
  fill(0);

  for (int i = 0; i < 30; i++) {
    rect(i * width/30, height/2-10, 2, 20);
  }

  //increasing variables
  n++;
  m += 2;
}

//a function to show a progressive left arrow
void leftArrow() {
  //if left arrow is pressed
  if (keyCode == LEFT) {
    //AND on is true
    if (on == true) {
      //I draw the rectangles 
      //modulo operator is useful to introduce different time lapses
      if (n % 10 == 0) {
        rect(9 * width/30 - width/30, height/2-10, width/30, 20);
      } else if (n % 10 == 1) {
        rect(8 * width/30, height/2-10, width/30, 20);
      } else if (n % 10 == 2) {
        rect(7 * width/30, height/2-10, width/30, 20);
      } else if (n % 10 == 3) {
        rect(6 * width/30, height/2-10, width/30, 20);
      } else if (n % 10 == 4) {
        rect(5 * width/30, height/2-10, width/30, 20);
      } else if (n % 10 == 5 ) {
        rect(4 * width/30, height/2-10, width/30, 20);
      } else if (n % 10 == 6) {
        rect(3 * width/30, height/2-10, width/30, 20);
      } else if (n % 10 == 7) {
        rect(2 * width/30, height/2-10, width/30, 20);
      } else if (n % 10 == 8) {
        rect(width/30, height/2-10, width/30, 20);
      } else if (n % 10 == 9) {
        rect(0, height/2-10, width/30, 20);
      }

      //then a condition to make the rectagles disappear is introduced
      if (n > 11) {
        n = 0;
        background(0);
      }
    }
  }
}

//a function to show a progressive right arrow
void rightArrow() {
  //if right arrow is pressed
  if (keyCode == RIGHT) {
    //AND on is true
    if (on == true) {
      //I draw the rectangles 
      //modulo operator is useful to introduce different time lapses
      if (n % 10 == 0) {
        rect(2 * width/3, height/2-10, width/30, 20);
      } else if (n % 10 == 1) {
        rect(2 * width/3, height/2-10, 2 * width/30, 20);
      } else if (n % 10 == 2) {
        rect(2 * width/3, height/2-10, 3 * width/30, 20);
      } else if (n % 10 == 3) {
        rect(2 * width/3, height/2-10, 4 * width/30, 20);
      } else if (n % 10 == 4) {
        rect(2 * width/3, height/2-10, 5 * width/30, 20);
      } else if (n % 10 == 5 ) {
        rect(2 * width/3, height/2-10, 6 * width/30, 20);
      } else if (n % 10 == 6) {
        rect(2 * width/3, height/2-10, 7 * width/30, 20);
      } else if (n % 10 == 7) {
        rect(2 * width/3, height/2-10, 8 * width/30, 20);
      } else if (n % 10 == 8) {
        rect(2 * width/3, height/2-10, 9 * width/30, 20);
      } else if (n % 10 == 9) {
        rect(2 * width/3, height/2-10, 10 * width/30, 20);
      }

      //then a condition to make the rectagles disappear is introduced
      if (n > 11) {
        n = 0;
        background(0);
      }
    }
  }
}

//a function to show two blinking arrows
void emergencyArrow() {
  //introducing a timer
  int t = m % 50;

  //if up arrow is pressed
  if (keyCode == UP) {
    //AND on is true
    if (on == true) {
      //I draw some blinking rectangles
      if (t < 25) {
        fill(255, 215, 0);
        rect(0, height/2 - 10, width/3, 20);
        rect(2 * width/3, height/2 - 10, width/3, 20);
      } else {
        background(0);
      }
    }
  }
}

//a function to show brake lights
void brake() {
  noStroke();
  //if down arrow is pressed
  if (keyCode == DOWN) {
    //I draw all the red rectangles
    fill(255, 0, 0);
    rect(width/3, 0, width/3, 20);
    rect(0, height/2 + 10, width/3, 20);
    rect(2 * width/3, height/2 + 10, width/3, 20);
  } 

  //introducing the condition to make the lights switch off
  if ((keyCode == DOWN) && (keyPressed == false)) {
    background(0);
  }
}

//changing the boolean to its opposite to "arm" the switches
//if I press again the same keys, the arrows are switched off
void keyPressed() { 
  if ((keyPressed == true) && ((keyCode == UP) || (keyCode == RIGHT) || (keyCode == LEFT))) {
    on = !on;
    background(0);
  }
}
