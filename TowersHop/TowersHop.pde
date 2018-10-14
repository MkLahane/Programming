void setup() {
  int[] arr = new int[] {1, 2, 1};
  println(isHoppable(arr, 0));
} 

boolean isHoppable(int[] arr, int k) {
  int jumpTower = arr.length - 1;
  int targetTower = arr.length;
  while (jumpTower > 0) {
    if (jumpTower + arr[jumpTower] >= targetTower) {
      targetTower = jumpTower;
    } 
    jumpTower -= 1;
  } 
  return arr[0] >= targetTower;
} 
