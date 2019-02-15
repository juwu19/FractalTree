private double fractionLength = .83; 
private int smallestBranch = 8; 
private double branchAngle = .32;  
public void setup() 
{   
  size(1000,800);    
  //noLoop(); 
} 
public void draw() 
{   
  background(0);   
  stroke(239, 239, 11);   
  line(500,700,500,600);
  drawBranches(500,600,100,3*Math.PI/2);
} 
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double angle1 = angle + branchAngle+ (mouseX-500) / (500/.2);
  double angle2 = angle - branchAngle+ (mouseX-500) / (500/.2);
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  line(x,y,endX1,endY1);
  line(x,y,endX2,endY2);
  if(branchLength>smallestBranch){
    branchLength = branchLength * fractionLength;
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
}
