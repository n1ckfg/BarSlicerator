ArrayList<Slice> slices = new ArrayList<Slice>();
int numSlices = 20;

ArrayList<Bar> bars;
float barWidth = 5;
float speed = 0.03;

void setup() {
  size(640,640,P2D);
  for (int i=0; i<numSlices; i++) {
    slices.add(new Slice(50, 150));
  }
  
  bars = new ArrayList<Bar>();
  
  for (int i=0; i<int(width/barWidth); i++) {
    float pos = i * barWidth;
    Bar bar = new Bar(pos, 0.0, barWidth, float(height), speed);
    bars.add(bar);
  }
  
  background(0);
}

void draw() {
  blendMode(BLEND);
  noStroke();
  fill(0,10);
  rect(0,0,width,height);

  for (int i=0; i<slices.size(); i++) {
    Slice slice = slices.get(i);
    slice.speed *= 0.99;
    if (slice.speed < 0.01) slice.init();
    slice.run();
  }

  blendMode(SUBTRACT);
  for (int i=0; i<bars.size(); i++) {
    bars.get(i).run();
  }
  
  surface.setTitle("" + frameRate);
}
