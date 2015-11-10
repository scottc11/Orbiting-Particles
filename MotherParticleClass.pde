
class MotherParticle {
  float motherRadius;
  float childRadius;
  float systemRadius;  // the radius in which all particles are contained
  PVector location;
  color motherColor;
  color childColor;
  ArrayList<ChildParticle> childArray = new ArrayList<ChildParticle>();
  
  MotherParticle(int _locX, int _locY, float _radius, color _motherColor) {
    location = new PVector(_locX, _locY);
    motherRadius = _radius;
    childRadius = _radius * 0.75;
    motherColor = _motherColor;
    childColor = (0);
    createChilds();
  }
  
  void drawParticle() {
    //Draw Mother
    noStroke();
    fill(motherColor);
    ellipse(location.x, location.y, motherRadius, motherRadius);
    
    //Draw Childs
    for (int i = 0; i < childArray.size(); i++) {
      if (dist(location.x, location.y, childArray.get(i).getLocX(), childArray.get(i).getLocY()) < 80) {
        childArray.get(i).drawParticle();
        connectParticles(i);
        adjustChildColor(i);
      } else {
        childArray.get(i).invertVelocity();
        childArray.get(i).drawParticle();
        connectParticles(i);
        adjustChildColor(i);
        
      }
    }
  }
  
  void createChilds() {
    for (int i = 0; i < 6; i++) {
      float randomX = random(-30, 30);
      float randomY = random(-30, 30);
      childArray.add(new ChildParticle(location.x + randomX, location.y + randomY, childRadius, 0));
    }
  }
  
  void connectParticles(int i) {
    stroke(255, map(getDistance(i), 0, 80, 255, 30));  //maping distance for oppacity
    line(location.x, location.y, childArray.get(i).getLocX(), childArray.get(i).getLocY());
    
  }
  
  void adjustChildColor(int i) {
    color newColor = int(map(getDistance(i), 0, 80, 255, 30));
    childArray.get(i).adjustColor(newColor);
  }
  
  float getDistance(int i) {
    return dist(location.x, location.y, childArray.get(i).getLocX(), childArray.get(i).getLocY());
  }

  float getLocX() {
    return location.x;
  }
  
  float getLocY() {
    return location.y;
  }
  
  
}