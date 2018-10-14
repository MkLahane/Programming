int[] a;
int N = 4;
void setup() {
  a = new int[N];
  for (int i = 0; i < N; i++) {
    a[i] = 0;
  } 
  enumerate(0);
} 

void enumerate(int k) {
  if (k == N) {
    Print(); 
    return;
  } 
  enumerate(k + 1);
  a[k] = 1;
  enumerate(k + 1);
  a[k] = 0;
} 

void Print() {
  for (int i = 0; i < a.length; i++) {
    print(a[i]);
  } 
  println();
} 
