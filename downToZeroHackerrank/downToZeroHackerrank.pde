int[] minMoves = new int[1000001];
void setup() {
  int N = 59;
  int moves = 0;
  println(minMove(N));
} 


public int minMove(int n) {
    if (n <= 3) return n;
    if (minMoves[n] > 0) return minMoves[n];
    int min = Integer.MAX_VALUE;
    for (int i=2; i<=Math.sqrt(n); i++) {
        if (n % i == 0) {
            int factor = n/i;
            min = Math.min(min, 1 + minMove(factor));
        }
    }
    min = Math.min(min, 1 + minMove(n-1));
    minMoves[n] = min;
    return min;
}
