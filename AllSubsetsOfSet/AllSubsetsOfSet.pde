void setup() {
  int[] arr = {1, 2, 3};
  int[] temp = new int[arr.length];
  print("All possible subsets of set:");
  for (int i = 0; i < arr.length; i++) {
    if (i == 0) {
      print("{"+arr[i]+",");
    } else if (i == arr.length - 1) {
      print(arr[i]+"}");
    } else {
      print(arr[i]+",");
    }
  } 
  println();
  generateSubsets(arr);
} 

void generateSubsets(int[] arr) {
  int[] subset = new int[arr.length];
  generateSubsets(arr, subset, 0);
} 

void generateSubsets(int[] arr, int[] subset, int currentIndex) {
  if (currentIndex == arr.length) {
    printArr(subset);
    return;
  } 
  subset[currentIndex] = -1;
  generateSubsets(arr, subset, currentIndex + 1);
  subset[currentIndex] = arr[currentIndex];
  generateSubsets(arr, subset, currentIndex + 1);
} 



void printArr(int[] arr) {
  print("{");
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] != -1) {
      print(arr[i]+",");
    }
  } 
  print("}");
  println();
} 
