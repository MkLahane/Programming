class Graph {
  ArrayList<Node> nodes;
  Map<Integer, Node> graph;
  Graph() {
    graph = new Hashtable();
    nodes = new ArrayList<Node>();
  } 
  void addNode(int index1) {
    index1--;
    Node node = new Node(index1);
    nodes.add(node);
    graph.put(index1, node);
  } 
  void connect(int index1, int index2, int edgeCost) {
    index1--;
    index2--;
    graph.get(index1).neighbors.put(graph.get(index2), edgeCost);
    graph.get(index2).neighbors.put(graph.get(index1), edgeCost);
    
  }
  void printNodes() {
    println("Node indexes:");
    for (Node node : nodes) {
      print(node.index+" ");
    } 
    println();
  } 
  void printLog() {
    printNodes();
    println();
    for (int index : graph.keySet()) {
      print("Node no:"+(index + 1));
      print(", neigbors:");
      for (Node node : graph.get(index).neighbors.keySet()) {
        print("{Node index:"+(node.index + 1)+", Edge cost:"+graph.get(index).neighbors.get(node)+"}, ");
      }
      println();
    } 
  } 
} 
