
void setup() {
  int[] arr={2,4,10,3,8,5};
  sortArray(arr);
  println(arr);
} 

void sortArray(int arr[]) {
  divide(arr,0,arr.length-1);
} 

void divide(int[] arr,int start,int end) {
  if(start>=end) {
    return; 
  }
  int mid=(end+start)/2;
  divide(arr,start,mid);
  divide(arr,mid+1,end);
  mergeSort(arr,start,mid,end);
}

void mergeSort(int[] arr,int start,int mid,int end) {
  int left=start;
  int index=start;
  int right=mid+1;
  int size=end-start+1;
  int[] temp=new int[arr.length];
  while(left<=mid && right<=end) {
    if(arr[left]<=arr[right]) {
      temp[index]=arr[left];
      left++;
    } else {
      temp[index]=arr[right];
      right++;
    } 
    index++;
  } 
  for(int i=left;i<=mid;i++) {
    temp[index]=arr[i];
    index++;
  } 
  for(int i=right;i<=end;i++) {
    temp[index]=arr[i];
    index++;
  } 
  for(int i=start;i<=end;i++) {
    arr[i]=temp[i];
  } 
} 