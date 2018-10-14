void setup() {
  int[] arr = {5, 2, 3, 8, 2, 1};
  maxSubksum(arr, 3);
} 

void maxSubksum(int[] arr, int k) {
  int sum = 0;
  int maxSum = 0;
  int index = 0; 
  for (int i = 0; i < k; i++) {
    sum += arr[i];
  } 
  for (int i = k; i < arr.length; i++) {
    sum += arr[i] - arr[i - k];
    maxSum = max(sum, maxSum);
  } 
  println("Max sum:"+maxSum);
} 
