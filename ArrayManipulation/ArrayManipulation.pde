import java.util.*;
//the challenge was that given an array, you had to shift all the zeros on the right side of the array
//and had to be done in place.
void setup() {
  int[] arr = new int[] { 1, 0, 2, 3, 0, 5, 0, 0, 0, -1, 10, 20, 0, 0, 0, 1, 0};
  println("Old array:");
  println(Arrays.toString(arr));
  shiftZeros(arr);
} 

void swap(int[] arr, int idx1, int idx2) {
  int temp = arr[idx1];
  arr[idx1] = arr[idx2];
  arr[idx2] = temp;
} 

void shiftZeros(int[] arr) {
  int left = 0;
  int right = arr.length - 1;
  while (left < right) {
    if (arr[left] == 0) {
      if (arr[right] != 0) {
        swap(arr, left, right);
        right--;
        left++;
      } else {
        right--;
      } 
    } else {
      left++;
    }
  }
  println("New array:");
  println(Arrays.toString(arr));
} 
