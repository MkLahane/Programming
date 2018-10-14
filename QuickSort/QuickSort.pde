import java.util.*;
float[] values;
void setup() {
  values = new float[] {2, 8, 5, 7, 9, 3, 4};
  values = new float[10];
  for (int i = 0; i < values.length; i++) {
    values[i] = floor(random(0, 20));
  } 
  printarray(values);
  quickSort(values, 0, values.length - 1);
  println("Sorted:");
  printarray(values);
}

void quickSort(float[] arr, int low, int high) {
  if (low < high) {
    int midPoint = partition(arr, low, high);
    println("From low:"+low+", to high:"+high);
    println("Mid Point:"+midPoint);
    printarray(arr); 
    quickSort(arr, low, midPoint - 1);
    quickSort(arr, midPoint + 1, high);
  }
} 

int partition(float[] arr, int low, int high) {
  int left = low - 1;
  float pivot = arr[high];
  int right = high - 1;
  while (left < right) {
    left++;
    if (arr[left] > pivot) {
      while (right > left) {
        if (arr[right] < pivot) {
          swap(arr, left, right);
          break;
        } 
        right--;
      }
    } 
    
  }
  if (arr[left] > arr[high]) {
    swap(arr, left, high);
    return left;
  }
  return high; 
  //return high;
  //swap(arr, left - 1, high);
  //return left - 1;
} 

//int partition (float[] arr, int low, int high)
//{
//  // pivot (Element to be placed at right position)
//  float pivot = arr[high];  

//  int i = (low - 1);  // Index of smaller element

//  for (int j = low; j <= high- 1; j++)
//  {
//    // If current element is smaller than or
//    // equal to pivot
//    if (arr[j] <= pivot)
//    {
//      i++;    // increment index of smaller element
//      swap(arr, i, j);
//    }
//  }
//  swap(arr, i + 1, high);
//  return (i + 1);
//}


void swap(float[] arr, int a, int b) {
  float temp = arr[a];
  arr[a] = arr[b];
  arr[b] = temp;
} 

void printarray(float[] arr) {
  println(Arrays.toString(arr));
} 
