import java.util.*;
void setup() {
  println("Number of ways:"+decode("12"));
} 

int decode(String givenString, int k, int[] memo) {
  if (k == 0) {
    return 1;
  } 
  int i = (givenString.length() - k);
  if (givenString.charAt(i) == '0') {
    return 0;
  }
  if (memo[k] != -1) {
    return memo[k];
  } 
  
  int result = decode(givenString, k - 1, memo);
  if (k >= 2 && Integer.parseInt(givenString.substring(i, i + 2)) <= 26) {
    result += decode(givenString, k - 2, memo);
  } 
  memo[k] = result;
  return result;
} 

int decode(String givenStr) {
  int[] memo = new int[givenStr.length() + 1];
  for (int i = 0; i < memo.length; i++) {
    memo[i] = -1;
  } 
  return decode(givenStr, givenStr.length(), memo);
} 
