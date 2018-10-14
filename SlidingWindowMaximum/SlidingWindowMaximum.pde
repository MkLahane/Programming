import java.util.*;
void setup() {
  int[] arr = {10, 5, 2, 7, 8, 7};
  int k = 3;
  //println(Arrays.toString(maxK(arr, k)));
  maxK(arr, k);
} 

void maxK(int[] arr, int k) {
  Deque<Integer> deq = new LinkedList();
  for (int i = 0; i < k; i++) {
    while(!deq.isEmpty() && arr[i] >= arr[deq.peekLast()]) {
      deq.removeLast();
    } 
    deq.addLast(i);
  } 
  for (int i = k; i < arr.length; i++) {
    println(arr[deq.peekFirst()]+" ");
    while(!deq.isEmpty() && deq.peekFirst() <= i - k) {
      deq.removeFirst();
    } 
    while(!deq.isEmpty() && arr[i] >= arr[deq.peekLast()]) {
      deq.removeLast();
    } 
    deq.addLast(i);
  }
  println(arr[deq.peekFirst()]);
} 
