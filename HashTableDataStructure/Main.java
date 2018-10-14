import hash.HashTable;
public class Main {
  public static void main(String[] args) {
    HashTable arr=new HashTable(200);
    arr.putData("ABC",100);
    arr.putData("AB",11);
    arr.putData("A",10);
    System.out.println(arr.getData("A"));
  }
}
