import java.util.*;
void setup() {
  int[][] square= {{1, 1, 0, 1, 0}, 
    {0, 1, 1, 1, 0}, 
    {1, 1, 1, 1, 0}, 
    {0, 1, 1, 1, 1}};
  println("Square:");
  print2dArray(square);
  println("Square of 1's:");
  largestSquare(square);
} 

void print2dArray(int[][] arr) {
  for (int i = 0; i < arr.length; i++) {
    println(Arrays.toString(arr[i]));
  }
} 

void largestSquare(int[][] square) {
  int[][] squareOfOnes = new int[square.length][square[0].length];
  int largestSquareSide = Integer.MIN_VALUE;

  for (int i = 0; i < squareOfOnes.length; i++) {
    for (int j = 0; j < squareOfOnes[0].length; j++) {
      if (i == 0 || j == 0) {
        squareOfOnes[i][j] = square[i][j];
      } else {
        if (square[i][j] != 0) {
          int topLeft = squareOfOnes[i - 1][j - 1];
          int left = squareOfOnes[i][j - 1];
          int top = squareOfOnes[i - 1][j];
          squareOfOnes[i][j] = square[i][j] + min(topLeft, top, left);
        }
      }
      if (squareOfOnes[i][j] > largestSquareSide) {
        largestSquareSide = squareOfOnes[i][j];
      } 
    }
  }
  print2dArray(squareOfOnes);
  println("Largest square of 1's in the matrix has a side of length:"+largestSquareSide);
} 
