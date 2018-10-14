import java.util.*;
void setup() {
  int[] arr = new int[7];
  for (int i = 0; i < arr.length; i++) {
    arr[i] = i + 1;
  } 
  println("Given array:");
  printArr(arr);
  Reverse(arr);
  println("Reversed array:");
  printArr(arr);
} 

void printArr(int[] arr) {
  println(Arrays.toString(arr));
} 

void Reverse(int[] arr) {
  int left = 0;
  int right = arr.length - 1;
  while(left <= right) {
    swap(arr, left, right);
    left++;
    right--;
  } 
} 

void swap(int[] arr, int index1, int index2) {
  int temp = arr[index1];
  arr[index1] = arr[index2];
  arr[index2] = temp;
} 
