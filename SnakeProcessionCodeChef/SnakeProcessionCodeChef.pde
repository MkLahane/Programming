import java.util.*;
void setup() {
 String snakeEntries = "HT";
 println(isValid(snakeEntries));
}

String isValid(String snakeEntries) {
  boolean didISawH = false;
  for (char ch : snakeEntries.toCharArray()) {
    if (ch == 'H') {
      if (didISawH) {
        return "Invalid";
      } else {
        didISawH = true;
      } 
    } else if (ch == 'T') {
      didISawH = false;
    } 
  } 
  return "Valid";
} 
