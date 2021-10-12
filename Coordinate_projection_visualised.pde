int n = 20;
float transitionTime = 500;

float cellSize;

PVector[][] array = new PVector[n][n];

PVector[][] arrayNew = new PVector[n][n];

void setup() {
  size(750, 750);
  
  cellSize = width / (2 * n);
  
  for(int i = 0; i < n; i++) {
    for(int j = 0; j < n; j++) {
      array[i][j] = new PVector(i, j);
    }
  }
  
  for(int i = 0; i < n; i++) {
    for(int j = 0; j < n; j++) {
      arrayNew[i][j] = new PVector(0, 0);
      if(i % 2 == 0)
        arrayNew[i][j].x = i / 2;
      else
        arrayNew[i][j].x = -(i + 1) / 2;
        
      if(j % 2 == 0)
        arrayNew[i][j].y = j / 2;
      else
        arrayNew[i][j].y = -(j + 1) / 2;
    }
  }
}

void draw() {
  background(255);
  
  float lerpValue = (sin(millis() / transitionTime) + 1) / 2;
  
  for(int i = 0; i < n; i++) {
    for(int j = 0; j < n; j++) {
      PVector coords = array[i][j].copy();
      PVector coordsNew = arrayNew[i][j].copy();
      PVector coordsLerp = PVector.add(coords.mult(lerpValue), coordsNew.mult(1 - lerpValue));
      
      noStroke();
      fill(255 * i / n, 0, 255 * j / n);
      square(width / 2 + coordsLerp.x * cellSize, width / 2 + coordsLerp.y * cellSize, cellSize);
      //fill(0);
      //text(int(coords.x) + ", " + int(coords.y), width / 2 + (coordsLerp.x + 0.3) * cellSize, width / 2 + (coordsLerp.y + 0.5) * cellSize);
    }
  }
}
