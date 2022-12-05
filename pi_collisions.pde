
int digits = 6;
Ice small;
Ice big;

int timeSteps = 100000;
float smallSize = 20;

int collisions = 0;
void setup() {
  size(800, 800);

  big = new Ice(pow(100, digits - 1), -1, 75, height / 2, smallSize * digits);
  small = new Ice(1, 0, 50, height / 2, smallSize);
}

void draw() {
  background(30);
  fill(70, 240, 250);
  noStroke();
  rect(0, height / 2, width, height / 2);
  for(int i = 0; i <= ceil(width / 20); i++){
    fill(255);
    circle(i * 20, width / 2 + 20, 15);
  }
  stroke(255);
  strokeWeight(25);
  line(0, height / 2 + 10, width, height / 2 + 10);
  
  println(big.speed / (float)timeSteps);
  for (int i = 0; i < timeSteps; i++) {
    physics(timeSteps);
  }
  big.draw();
  small.draw();

  fill(255);
  textSize(50);
  textAlign(CENTER);
  text("Collisions: " + collisions, width / 2, 120);
}

void physics(int timeSteps) {
  big.x += big.speed / timeSteps;
  small.x += small.speed / timeSteps;
  if (abs((float)big.x - (float)small.x) <= smallSize) {
    float speed1 = big.bounce(small.mass, small.speed);
    float speed2 = small.bounce(big.mass, big.speed);
    big.speed = speed1;
    small.speed = speed2;
    collisions++;
  }
  if (small.x <= 0) {
    collisions++;
    small.speed = -small.speed;
  }
}
