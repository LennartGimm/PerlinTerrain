float zoom = 100;
float gridSize = 5;
float gridHeight = 200;
float[][] grid;
int gridLength = 1000;


void setup(){
  //size(1920,1080,P3D);
  fullScreen(P3D);
  grid = new float[2*int(gridLength/gridSize)+1][2*int(gridLength/gridSize)+1];
  noiseSeed(1);
}



void draw(){
  for(int x=-int(gridLength/gridSize); x<=gridLength/gridSize; x++){
    for(int y=-int(gridLength/gridSize); y<=gridLength/gridSize; y++){
      grid[x+int(gridLength/gridSize)][y+int(gridLength/gridSize)] = gridHeight*noise(x/zoom+5*gridLength + float(frameCount)/100, y/zoom+5*gridLength);
    }
  }
  
  background(50);
  strokeWeight(2);
  
  //camera(0,0,-200, sin(float(frameCount)/100)*1000, cos(float(frameCount)/100)*1000, 0, 0.0, 0.0, 1.0);
  camera(sin(float(frameCount+2400)/100)*1.5*gridLength, cos(float(frameCount+2400)/100)*1.5*gridLength,-200, 0,0, 0, 0.0, 0.0, 1.0);
  
  for(int x=-int(gridLength/gridSize); x<=gridLength/gridSize-1; x++){
    for(int y=-int(gridLength/gridSize); y<=gridLength/gridSize-1; y++){
      if(grid[x+int(gridLength/gridSize)][y+int(gridLength/gridSize)]/gridHeight > 0.55){
        stroke(0,0,200);
      }
      else{
        if(grid[x+int(gridLength/gridSize)][y+int(gridLength/gridSize)]/gridHeight < 0.45){
          stroke(50,200,0);
        }
        else{
          stroke(200,200,50);
        }
      }
      
      line(x*gridSize, y*gridSize, grid[x+int(gridLength/gridSize)][y+int(gridLength/gridSize)], (x+1)*gridSize, y*gridSize, grid[x+1+int(gridLength/gridSize)][y+int(gridLength/gridSize)]);
      line(x*gridSize, y*gridSize, grid[x+int(gridLength/gridSize)][y+int(gridLength/gridSize)], x*gridSize, (y+1)*gridSize, grid[x+1+int(gridLength/gridSize)][(y+1)+int(gridLength/gridSize)]);
      //point(x*gridSize, y*gridSize, grid[x+int(gridLength/gridSize)][y+int(gridLength/gridSize)]);
      
    }
  }
  
  saveFrame("output4/frame####.png");
  if(frameCount == 1200){
    exit();
  }
}
