class Slice {
  
  float rot = 0;
  float dist = 50;
  float spread = 50;
  float speed = 0.5;
  color fc1, fc2;
  PVector root, center, leftSpread, rightSpread, peak, targetC, targetL, targetR;
  
  Slice(float _dist, float _spread) {
    rot = random(0, 360);
    dist = _dist;
    spread = _spread;
    init();
  }
  
  void init() {
    dist = random(dist/1.1, dist * 1.1);
    spread = random(spread/1.1, spread * 1.1);
    speed = random(0.1, 0.9);
    center = new PVector(width/2, height/2);
    root = new PVector(0,0);
    leftSpread = new PVector(0, 0);
    rightSpread = new PVector(0, 0);
    peak = new PVector(0, 0);
    targetC = new PVector(0, -dist*1.5);
    targetL = new PVector(-spread/2, -dist);
    targetR = new PVector(spread/2, -dist);
    
    fc1 = randomColor();
    fc2 = randomColor();    
  }
  
  void update() {
    peak = PVector.lerp(peak, targetC, speed);
    leftSpread = PVector.lerp(leftSpread, targetL, speed);
    rightSpread = PVector.lerp(rightSpread, targetR, speed);
    if (dist(targetC.x, targetC.y, peak.x, peak.y) < 2) {
      init();
    }
  }
    
  void draw() {
    pushMatrix();
    translate(center.x, center.y);
    rotate(radians(rot));
    noStroke();

    beginShape();
    fill(fc1);
    curveVertex(root.x, root.y);
    curveVertex(root.x, root.y);

    fill(fc2);
    curveVertex(leftSpread.x, leftSpread.y);
    curveVertex(leftSpread.x, leftSpread.y-spread/2);

    fill(fc1);
    curveVertex(peak.x, peak.y);
    curveVertex(peak.x, peak.y);
    
    fill(fc2);
    curveVertex(rightSpread.x, rightSpread.y-spread/2);
    curveVertex(rightSpread.x, rightSpread.y);
    
    fill(fc1);
    curveVertex(root.x, root.y);
    curveVertex(root.x, root.y);
    endShape();

    popMatrix();       
  }
  
  void run() {
    update();
    draw();
  }
  
  color randomColor() {
    int r = int(random(255));
    int g = int(random(255));
    int b = int(random(255));
    return color(r,g,b);
  }
  
}
