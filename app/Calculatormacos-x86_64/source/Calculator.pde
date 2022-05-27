// Calculator Oct 2021 | Ethan Reynolds
// Colors for numbers: #31A30F, #99F07F operators: #59C2FA, #A3DAFF and Clear/Enter color: #FA9F38, #FFC380

Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
String dVal = "0"; // used to update the display
String op = ""; // used to set the operator value
boolean left = true; // used to decide left or right of the operator
float r = 0.0; // number right of the operator
float l = 0.0; // number left of the operator
float result = 0.0; // number used for result of a calculation

void setup() {
  size(150, 250);
  numButtons[0] = new Button(20, 180, 20, 20, "0", color(#31A30F), color(#99F07F));
  numButtons[1] = new Button(20, 150, 20, 20, "1", color(#31A30F), color(#99F07F));
  numButtons[2] = new Button(50, 150, 20, 20, "2", color(#31A30F), color(#99F07F));
  numButtons[3] = new Button(80, 150, 20, 20, "3", color(#31A30F), color(#99F07F));
  numButtons[4] = new Button(20, 120, 20, 20, "4", color(#31A30F), color(#99F07F));
  numButtons[5] = new Button(50, 120, 20, 20, "5", color(#31A30F), color(#99F07F));
  numButtons[6] = new Button(80, 120, 20, 20, "6", color(#31A30F), color(#99F07F));
  numButtons[7] = new Button(20, 90, 20, 20, "7", color(#31A30F), color(#99F07F));
  numButtons[8] = new Button(50, 90, 20, 20, "8", color(#31A30F), color(#99F07F));
  numButtons[9] = new Button(80, 90, 20, 20, "9", color(#31A30F), color(#99F07F));
  opButtons[0] = new Button(50, 180, 20, 20, ".", color(#59C2FA), color(#A3DAFF));
  opButtons[1] = new Button(110, 90, 20, 20, "÷", color(#59C2FA), color(#A3DAFF));
  opButtons[2] = new Button(110, 120, 20, 20, "x", color(#59C2FA), color(#A3DAFF));
  opButtons[3] = new Button(110, 150, 20, 20, "+", color(#59C2FA), color(#A3DAFF));
  opButtons[4] = new Button(110, 180, 20, 20, "-", color(#59C2FA), color(#A3DAFF));
  opButtons[5] = new Button(20, 60, 20, 20, "C", color(#FA9F38), color(#FFC380));
  opButtons[6] = new Button(20, 210, 80, 20, "Enter", color(#FA9F38), color(#FFC380));
  opButtons[7] = new Button(50, 60, 20, 20, "sin", color(#59C2FA), color(#A3DAFF));
  opButtons[8] = new Button(80, 60, 20, 20, "√", color(#59C2FA), color(#A3DAFF));
  opButtons[9] = new Button(110, 60, 20, 20, "x²", color(#59C2FA), color(#A3DAFF));
  opButtons[10] = new Button(110, 210, 20, 20, "|x|", color(#59C2FA), color(#A3DAFF));
  opButtons[11] = new Button(80, 180, 20, 20, "±", color(#59C2FA), color(#A3DAFF));
}
void draw() {
  background(225);
  rect(10, 10, 130, 230);
  updateDisplay();
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
  fill(255);
}
void mouseReleased() {
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].on && dVal.length()<16) {
      handleEvent(numButtons[i].val, true);
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    if(opButtons[i].on) {
      handleEvent(opButtons[i].val,false);
    }
  }
  println("L:" + l + " Op:" + op + " R:" + r + " Result:" + result + " Left:" + left);
}

void updateDisplay() {
  fill(200);
  rect(20, 20, 110, 30, 5);
  fill(0);
  if (dVal.length()<8) {
    textSize(25);
  } else if (dVal.length()<9) {
    textSize(23);
  } else if (dVal.length()<10) {
    textSize(21);
  } else if (dVal.length()<11) {
    textSize(19);
  } else if (dVal.length()<12) {
    textSize(17);
  } else if (dVal.length()<13) {
    textSize(16);
  } else if (dVal.length()<14) {
    textSize(15);
  } else if (dVal.length()<15) {
    textSize(13);
  } else {
    textSize(12);
  }
  textAlign(RIGHT);
  text(dVal, width-30, 43);
}
void performCalc() {
  if (op.equals("+")) {
    result = l+r;
  } else if (op.equals("-")) {
    result = l-r;
  } else if (op.equals("*")) {
    result = l*r;
  } else if (op.equals("/")) {
    result = l/r;
  }
  dVal = str(result);
  l = result;
  left = true;
}

void handleEvent(String val, boolean num) {
  if (num) {
    // handle all logic relating to numbers
    if (dVal.equals("0")) {
      dVal = val;
      if (left) {
        l = float(dVal);
      } else if (!left) {
        r = float(dVal);
      }
    } else if (dVal.length()<16) {
      dVal = dVal + val;
      if (left) {
        l = float(dVal);
      } else if (!left) {
        r = float(dVal);
      }
    }
  } else if (val.equals("C")) {
      // Reset all variable to their defaults
      dVal = "0";
      op = "";
      left = true;
      r = 0.0;
      l = 0.0;
      result = 0.0;
    } else if (val.equals("+")) {
      dVal = "0";
      op = "+";
      left = false;
    } else if (val.equals("Enter")) {
      performCalc();
    } else if (val.equals("-")) {
      dVal = "0";
      op = "-";
      left = false;
    } else if (val.equals("x")) {
      dVal = "0";
      op = "*";
      left = false;
    } else if (val.equals("÷")) {
      dVal = "0";
      op = "/";
      left = false;
    } else if (val.equals(".")) {
      if (!dVal.contains(".") || dVal.contains(".0")) {
        dVal = dVal + ".";
      }
    } else if (val.equals("±")) {
      if (left) {
        l*=-1;
        dVal = str(l);
      } else if (!left) {
        r*=-1;
        dVal = str(r);
      }
    } else if (val.equals("sin")) {
      if (left) {
        l = sin(radians(l));
        dVal = str(l);
      } else if (!left) {
        r = sin(radians(r));
        dVal = str(r);
      }
    } else if (val.equals("√")) {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else if (!left) {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (val.equals("x²")) {
      if (left) {
        l = sq(l);
        dVal = str(l);
      } else if (!left) {
        r = sq(r);
        dVal = str(r);
      }
    } else if (val.equals("|x|")) {
      if (left) {
        l = abs(l);
        dVal = str(l);
      } else if (!left) {
        r = abs(r);
        dVal = str(r);
      }
    }
}

void keyPressed () {
  println("key:" + key);
  println("keyCode:" + keyCode);
  if(keyPressed) {
    if (keyCode == 49 || keyCode == 97) {
      // handle the event for 1
      handleEvent("1", true);
    } else if (keyCode == 50 || keyCode == 98) {
      // handle the event for 2
      handleEvent("2", true);
    } else if (keyCode == 51 || keyCode == 99) {
      // handle the event for 3
      handleEvent("3", true);
    } else if (keyCode == 52 || keyCode == 100) {
      // handle the event for 4
      handleEvent("4", true);
    } else if (keyCode == 53 || keyCode == 101) {
      // handle the event for 5
      handleEvent("5", true);
    } else if (keyCode == 54 || keyCode == 102) {
      // handle the event for 6
      handleEvent("6", true);
    } else if (keyCode == 55 || keyCode == 103) {
      // handle the event for 7
      handleEvent("7", true);
    } else if (keyCode == 56 || keyCode == 104) {
      // handle the event for 8
      handleEvent("8", true);
    } else if (keyCode == 57 || keyCode == 105) {
      // handle the event for 9
      handleEvent("9", true);
    } else if (keyCode == 10) {
      // handle the event for Enter
      handleEvent("Enter", false);
    } else if (keyCode == 48 || keyCode == 96) {
      // handle the event for 0
      handleEvent("0", true);
    } else if (keyCode == 67 || keyCode == 12) {
      // handle the event for C
      handleEvent("C", false);
    } else if (keyCode == 61 || keyCode == 107) {
      // handle the event for +
      handleEvent("+", false);
    } else if (keyCode == 45 || keyCode == 109) {
      // handle the event for -
      handleEvent("-", false);
    } else if (keyCode == 88 || keyCode == 106) {
      // handle the event for *
      handleEvent("x", false);
    } else if (keyCode == 47 || keyCode == 111) {
      // handle the event for /
      handleEvent("÷", false);
    }  else if (keyCode == 46|| keyCode == 110) {
      // handle the event for .
      handleEvent(".", false);
    }
  }
}
