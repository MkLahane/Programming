import java.util.*;
void setup() {
  int[] arr = {2, -4, -1, 4};
  sumOfSubsets(arr, 5);
}



void sumOfSubsets(int[] arr, int desiredSum) {
  Map<String, Integer> memo = new Hashtable();
  println(sumOfSubsets(arr, memo, desiredSum, arr.length - 1, new int[arr.length]));
  
} 

void printSubset(int[] subset) {
  
  for (int i = 0; i < subset.length; i++) {
    if (subset[i] != MAX_INT) {
      print(subset[i]+" ");
    } 
  } 
  println();
} 

int sumOfSubsets(int[] arr, Map<String, Integer> memo, int desiredSum, int current, int[] subset) {
  String k = desiredSum+":"+current;
  if (memo.containsKey(k)) {
    return memo.get(k);
  } 
  if (desiredSum == 0) {
    printSubset(subset);
    return 1;
  } else if (desiredSum < 0 || current < 0) {
    return 0;
  } 
  int result = 0;
  if (arr[current] > desiredSum) {
    subset[current] = MAX_INT;
    result = sumOfSubsets(arr, memo, desiredSum, current - 1, subset);
  } else {
    subset[current] = MAX_INT;
    int p1 = sumOfSubsets(arr, memo, desiredSum, current - 1, subset);
    subset[current] = arr[current];
    int p2 = sumOfSubsets(arr, memo, desiredSum - arr[current], current - 1, subset);
    result = p1 + p2;
  } 
  return result;
} 
