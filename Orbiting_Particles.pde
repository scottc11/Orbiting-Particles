
MotherParticle motherParticle;
ChildParticle childParticle;

ArrayList<MotherParticle> motherArray = new ArrayList<MotherParticle>();

int distance;

void setup() {
  size(400, 400);
  //fullScreen();
  background(0);
  distance = 30;
  createMotherParticles();
}


void draw() {
  fill(0, 15);
  noStroke();
  rect(0, 0, width, height);
  motherParticle.drawParticle();
}

void createMotherParticles() {
  
  motherParticle = new MotherParticle(width/2, height/2, 20.0, color(255));
  
  
}