package hash;
import java.util.*;

public class HashTable {
  public static class HashData {
    public String key;
    public int value;
  }
  private final int maxSize;
  private LinkedList<HashData>[] data;

  public HashTable(int _maxSize) {
    maxSize=_maxSize;
    data=new LinkedList[maxSize];
    for(int i=0;i<maxSize;i++) {
      data[i]=null;
    }
  }
  private HashData getHashData(String key) {
    if(key==null) {
      return null;
    }
    int index=key.hashCode()%maxSize;
    LinkedList<HashData> itemsAtIndex=data[index];
    if(itemsAtIndex==null) {
      return null;
    }
    for(HashData hashData:itemsAtIndex) {
      if(hashData.key.equals(key)) {
        return hashData;
      }
    }
    return null;
  }

  public int getData(String key) {
    HashData hData=getHashData(key);
    if(hData==null) {
      return -1;
    }else {

      return hData.value;
    }
  }

  public void putData(String key,int value) {
    int index=key.hashCode()%maxSize;
    LinkedList<HashData> items=data[index];
    if(items==null) {
      items=new LinkedList<HashData>();
      HashData item=new HashData();
      item.key=key;
      item.value=value;
      items.add(item);
      data[index]=items;
    }else {
      for(HashData item:items) {
        if(item.key.equals(key)) {
          item.value=value;
          return;
        }
      }
      HashData item=new HashData();
      item.key=key;
      item.value=value;
      items.add(item);
    }
  }

  public void deleteData(String key) {
    int index=key.hashCode()%maxSize;
    LinkedList<HashData> items=data[index];
    if(items==null) {
      return;
    }
    for(HashData item:items) {
      if(item.key.equals(key)) {
        items.remove(item);
        return;
      }
    }
  }

}
