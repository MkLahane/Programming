import java.util.*;
void setup() {
  String A = "abbd";
  String B = "azzb";
  println(longestCommonSubSeq(A, B, A.length(), B.length()));
  longestCommonSubSeqDP(A, B);
} 

void longestCommonSubSeqDP(String s1, String s2) {
  int[][] table = new int[s1.length() + 1][s2.length() + 1];
  for (int i = 0; i <= s1.length(); i++) {
    for (int j = 0; j <= s2.length(); j++) {
      if (i == 0 || j == 0) {
        table[i][j] = 0;
      } else if (s1.charAt(i - 1) != s2.charAt(j - 1)) {
        table[i][j] = max(table[i][j - 1], table[i - 1][j]);
      } else {
        table[i][j] = table[i - 1][j - 1] + 1;
      }
    }
  } 
  print2dArray(table);
  int currI = s1.length();
  int currJ = s2.length();
  String path = "";
  while (table[currI][currJ] != 0) {
    int currVal = table[currI][currJ];
    int leftVal = table[currI][currJ - 1];
    int topVal = table[currI - 1][currJ];
    println("Current I:"+currI+", Current J:"+currJ);
    if (leftVal == currVal) {
      currJ--;
    } else if (topVal == currVal) {
      currI--;
    } else {
      path += s1.charAt(currI - 1) + " ";
      currI--;
      currJ--;
    } 
  } 
  println(path);
} 


void print2dArray(int[][] arr) {
  for (int i = 0; i < arr.length; i++) {
    println(Arrays.toString(arr[i]));
  }
} 

int longestCommonSubSeq(String str1, String str2, int str1N, int str2N) {
  if (str1N == 0 || str2N == 0) {
    return 0;
  } 
  if (str1.charAt(str1N - 1) == str2.charAt(str2N - 1)) {
    return 1 + longestCommonSubSeq(str1, str2, str1N - 1, str2N - 1);
  } else {
    return max(longestCommonSubSeq(str1, str2, str1N - 1, str2N), longestCommonSubSeq(str1, str2, str1N, str2N - 1));
  }
} 
