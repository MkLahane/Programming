import java.util.*;
void setup() {
  int[] arr = {1, 4, 6, 4, 1};
  println(findOdd(arr));
} 
int findOdd(int[] arr) {
  Map<Integer, Boolean> occurence = new Hashtable();
  for (int number : arr) {
    if (occurence.containsKey(number)) {
      occurence.remove(number);
    } else {
      occurence.put(number, true);
    } 
  } 
  return (int)occurence.keySet().toArray()[0];
} 
