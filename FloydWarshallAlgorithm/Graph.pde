class Graph {
  ArrayList<Integer> nodes;
  int[][] edges;
  Graph() {
    nodes = new ArrayList<Integer>();
  } 
  void addNode(int val) {
    nodes.add(val);
  } 
  void startConnecting() {
    edges = new int[nodes.size()][nodes.size()];
    for (int i = 0; i < edges.length; i++) {
      for (int j = 0; j < edges[0].length; j++) {
        if (i == j) {
          edges[i][j] = 0;
        } else {
          edges[i][j] = MAX_INT;
        }
      }
    }
  }
  void printNodes() {
    println("Nodes:");
    for (int i = 0; i < nodes.size(); i++) {
      print(nodes.get(i)+" ");
    } 
    println();
  } 
  void printEdges() {
    println("Edges:");
    for (int i = 0; i < edges.length; i++) {
      for (int j = 0; j < edges[0].length; j++) {
        if (edges[i][j] >= MAX_INT) {
          print("Inf ");
        } else {
          print(edges[i][j]+" ");
        }
      } 
      println();
    } 
    println();
  } 
  void printLog() {
    printNodes();
    printEdges();
  } 
  void connect(int val1, int val2, int edgeCost) {
    val1--;
    val2--;
    edges[val1][val2] = edgeCost;
  }
} 
