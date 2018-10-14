class Node {
  int index;
  Map<Node, Integer> neighbors;
  boolean visited;
  int dijDist = MAX_INT;
  Node(int _index) {
    visited = false;
    neighbors = new Hashtable();
    index = _index;
  } 
} 
