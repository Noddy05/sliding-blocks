
class Ice{
  
  float mass, size;
  double x, y, speed;
  public Ice(float mass, float speed, float x, float y, float size){
    this.mass = mass; 
    this.speed = speed; 
    this.x = x; 
    this.y = y; 
    this.size = size;
  }
  
  void draw(){
    noStroke();
    fill(62, 171, 222);
    rect((int)x, (int)y - size, size, size);
    for(int i = 0; i <= ceil(size / 10); i++){
      fill(255);
      circle((int)x + i * 10, width / 2 - size + 5 / 2, 10);
    }
    strokeWeight(10);
    stroke(255);
    line((int)x, (int)y - size, (int)x + size, (int)y - size);
  }
  
  float bounce(float mass, double speed)
  {
    return (this.mass - mass) / (this.mass + mass) * (float)this.speed + (2 * mass) / (this.mass + mass) * (float)speed;
  }
}
