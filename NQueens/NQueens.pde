import java.util.*;

int[] queens;
int currentSolution = 0;
int currentSolutionIndex = 0;

int N = 8;
ArrayList<int[]> solutions;
int numOfSolutions = 0;
float spacing;
void setup() {
  size(700, 700);
  queens = new int[N];
  spacing = width / N;
  for (int i = 0; i < queens.length; i++) {
    queens[i] = i;
  } 

  solutions = new ArrayList<int[]>();
  enumerate(0);
  println("Number of solutions for "+N+" queens is:"+numOfSolutions);
} 

void process() {
  numOfSolutions++;
  int[] solutionArr = new int[N];
  for (int i = 0; i < solutionArr.length; i++) {
    solutionArr[i] = queens[i];
    //println("(row, col)=("+i, solutionArr[i]+")");
  } 
  solutions.add(solutionArr);
  println(Arrays.toString(queens));
} 

void enumerate(int k) {
  if (k == N) {
    process();
    return;
  } 
  for (int i = k; i < N; i++) {
    swap(k, i);
    if (!isvalid(k)) {
      enumerate(k + 1);
    } 
    swap(k, i);
  }
} 

boolean isvalid(int k) {
  for (int i = 0; i < k; i++) {
    if (abs(queens[i] - queens[k]) == (k - i)) return true;
  } 
  return false;
} 

void swap(int aI, int bI) {
  int temp = queens[aI];
  queens[aI] = queens[bI];
  queens[bI] = temp;
} 

void draw() {
  background(255);
  int[] solutionSet = solutions.get(currentSolutionIndex);
  for (int i = 0; i < N; i++) {
    int col = i;
    int row = solutionSet[col];
    //println("Col no:"+col+", Row no:"+row);
    for (int j = 0; j < N; j++) {
      //if (col == j && row == i) {
      //  fill(0, 100);
      //} else {
      //  noFill();
      //} 
      noFill();
      stroke(0);
      strokeWeight(2);
      rect(j * spacing, i * spacing, spacing, spacing);
      fill(0, 100);
      stroke(0);
      strokeWeight(2);
      rect(col * spacing, row * spacing, spacing, spacing);
    }
  } 
  fill(200, 0, 200);
  textSize(30);
  text("Total solutions:"+numOfSolutions, 20, 30);
  text("Current solution:"+currentSolutionIndex, 20, 60);
  //noLoop();
} 

void keyPressed() {
  currentSolution++;
  currentSolutionIndex = currentSolution % numOfSolutions;
} 
