int[] bitArr;

void setup() {
  String s1 = "Hello";
  bitArr = new int[s1.length()];
  generate(s1);
} 

void generate(String str) {
  generate(str, 0);
} 

void printString(String str) {
  String result = "";
  for (int i = 0; i < str.length(); i++) {
    char ch = str.charAt(i);
    if (bitArr[i] == 1) {
      result += ch;
    }
  } 
  if (result == "") {
    println("Empty subset");
  } else {
    println("Subset:"+result);
  }
} 

void generate(String str, int index) {
  if (index == str.length()) {
    printString(str);
    return;
  } 
  bitArr[index] = 1;
  generate(str, index + 1);
  bitArr[index] = 0;
  generate(str, index + 1);
} 
