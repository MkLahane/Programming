void setup() {
  //findNthOcc("cdab","ab");
  println(findLastOcc("cdabwerqwwewas","wwe"));
  //println(getSubString("abcd",0,1,2));
} 

String getSubString(String s,int start,int end,int len) {
  char[] str=new char[len];
  for(int i=start,index=0;i<=end;i++,index++) {
    str[index]=s.charAt(i);
  } 
  String r=new String();
  for(int i=0;i<str.length;i++) {
    r+=str[i];
  }
  return r;
} 


int findNthOcc(String str,String subStr) {
  for(int i=0;i<str.length();i++) {
    //println(i+" to "+(i+subStr.length()-1));
    String subString=getSubString(str,i,i+subStr.length()-1,subStr.length());
    //println(subString);
    if(stringComp(subString,subStr)) {
      return i;
    } 
  }
  return -1;
} 

int findLastOcc(String str,String subStr) {
  for(int i=0;i<str.length();i++) {
    //println(i+" to "+(i+subStr.length()-1));
    String subString=getSubString(str,i,i+subStr.length()-1,subStr.length());
    //println(subString);
    if(stringComp(subString,subStr)) {
      return i+subStr.length()-1;
    } 
  }
  return -1;
} 


boolean stringComp(String a,String b) {
  return a.equals(b);
} 