
class ChildParticle {
  float radius;
  PVector location;
  color particleColor;
  PVector velocity;
  
  ChildParticle(float _locX, float _locY, float _radius, color _particleColor) {
    location = new PVector(_locX, _locY);
    velocity = new PVector(random(-0.2, 0.2), random(-0.2, 0.2));
    radius = random(_radius * 0.25, _radius);
    particleColor = _particleColor;
  }
  
  void drawParticle() {
    noStroke();
    fill(particleColor);
    ellipse(location.x, location.y, radius, radius);
    updateLocation();
  }
  
  void updateLocation() {
    location.add(velocity);
  }
  
  // inverts the direction the paricle is moving by inverting velocity
  void invertVelocity() {
    
    //INVERT X
    if (velocity.x < 0) {
      velocity.x = velocity.x * -1;
    } else {
      velocity.x = velocity.x * -1;
    }
    
    // INVERT Y
    if (velocity.y < 0) {
      velocity.y = velocity.y * -1;
    } else {
      velocity.y = velocity.y * -1;
    }
  }
  
  void adjustColor(color c) {
    particleColor = c;
  }
  
  float getLocX() {
    return location.x;
  }
  
  float getLocY() {
    return location.y;
  }
  
  PVector getVectorLocation() {
    return location;
  }
  
}