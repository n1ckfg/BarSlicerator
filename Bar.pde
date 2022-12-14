class Bar {
  
  PVector p;
  PVector s;
  float c, c2;
  float speed;
  int timestamp = 0 ;
  int duration = 4000;
  
  Bar(float px, float py, float sx, float sy, float _speed) {
    p = new PVector(px, py);
    s = new PVector(sx, sy);
    speed = _speed + random(0, 0.1) - random(0, 0.1);
    c = 0.0;
    c2 = random(0, 255);
    timestamp = millis();
  }
  
  void update() {
    c = lerp(c, c2, speed);
    if (millis() > timestamp + duration || (c > c2 - 255 * speed && c < c2 + 255 * speed)) {
      timestamp = millis();
      c2 = random(0, 255);
    }
  }
  
  void draw() {
    rectMode(CORNER);
    noStroke();
    fill(color(c));
    rect(p.x, p.y, s.x, s.y);
  }
  
  void run() {
    update();
    draw();
  }

}
