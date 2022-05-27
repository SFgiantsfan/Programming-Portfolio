// realization
Line l1, l2, l3,l4, l5; 

void setup() {
  background(random(100, 255));
  size(displayWidth, displayHeight);
  l1 = new Line(random(width),random(height));
  l2 = new Line(random(width),random(height));
  l3 = new Line(random(width),random(height));
  l4 = new Line(random(width),random(height));
  l5 = new Line(random(width),random(height));
}

void draw() {
  l1.display();
  l2.display();
  l3.display();
  l4.display();
  l5.display();
}
