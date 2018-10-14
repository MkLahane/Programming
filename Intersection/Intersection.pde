import java.util.*;

void setup() { 
  //int[] a = {1, 3, 4, 6, 7, 9};
  //int[] b = {1, 2, 4, 5, 9};
  int[] a = new int[1000000];
  int[] b = new int[1000000];
  for (int i = 0; i < a.length; i++) {
    a[i] = floor(random(0, 100));
    if (i < b.length) {
      b[i] = floor(random(0, 100));
    }
  } 
  intersection(a, b);
  //printArray(intersection(a, b));
} 

IntList intersection(int[] a, int[] b) {
  IntList intersect = new IntList();
  int computations = 0;
  Map<Integer, Boolean> numbersDict = new Hashtable();
  //int equalLength = (a.length > b.length) ? b.length : a.length;
  int bi = 0;
  for (int ai = 0; ai < a.length || bi < b.length; ai++, bi++) {
    if (bi < b.length) {
      numbersDict.put(b[bi], true);
    }
    //println("Index:"+bi+", Value:"+a[ai]);
    if (numbersDict.containsKey(a[ai])) {
      intersect.append(a[ai]);
    }
    computations++;
  } 
  println("Number of computations:"+computations);
  return intersect;
} 


//IntList intersection(int[] a, int[] b) {
//  IntList intersect = new IntList();
//  for (int i = 0; i < a.length; i++) {
//    for (int j = 0; j < b.length; j++) {
//      if (a[i] == b[j]) {
//        intersect.append(a[i]);
//      } 
//    } 
//  } 
//  return intersect;
//} 
