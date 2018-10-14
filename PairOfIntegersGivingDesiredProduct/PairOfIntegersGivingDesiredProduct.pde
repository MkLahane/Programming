import java.util.*;
void setup() {
  //int[] arr = {-1, 4, 2, 7, 6, 2, 3, 8, -5, 5};
  int desiredProduct = 20;
  int[] arr = new int[1000];
  
  printArray(getPair(arr, desiredProduct));
} 

int[] getPair(int[] arr, int desiredProduct) {
  Map<Integer, Boolean> numbersDict = new Hashtable();
  int[] desiredPair = new int[2];
  for (Integer number : arr) {
    if (desiredProduct % number != 0) {
      continue;
    } 
    desiredPair[0] = number;
    if (!numbersDict.containsKey(number)) {
      numbersDict.put(number, true);
    } 
    
    int requiredMultiplier = desiredProduct / number;
    println("Pair:("+number+", "+requiredMultiplier+")");
    if (numbersDict.containsKey(requiredMultiplier)) {
      desiredPair[1] = requiredMultiplier;
      return desiredPair;
    } 
  }
  return new int[] {-1};
} 
