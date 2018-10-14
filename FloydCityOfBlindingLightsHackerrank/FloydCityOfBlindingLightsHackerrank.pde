import java.util.*;
void setup() {
  Graph graph = new Graph();
  graph.addNode(1);
  graph.addNode(2);
  graph.addNode(3);
  graph.addNode(4);
  graph.connect(1, 2, 5);
  graph.connect(1, 4, 24);
  graph.connect(2, 4, 6);
  graph.connect(3, 4, 4);
  graph.connect(3, 2, 7);
  graph.printLog();
  println(dijkstra(graph, 1, 2));
  println(dijkstra(graph, 3, 1));
  println(dijkstra(graph, 1, 4));
} 

int dijkstra(Graph graph, int sourceIndex, int endIndex) {
  sourceIndex--;
  endIndex--;
  PriorityQueue<Node> minHeap = new PriorityQueue(new DijkstraComparator());
  for (Node node : graph.nodes) {
    node.dijDist = MAX_INT;
    node.visited = false;
  } 
  graph.graph.get(sourceIndex).dijDist = 0;
  minHeap.add(graph.graph.get(sourceIndex));
  while (!minHeap.isEmpty()) {
    Node current = minHeap.remove();
    if (current.index == endIndex) {
      return current.dijDist; 
    }
    current.visited = true;
    for (Node neighbor : current.neighbors.keySet()) {
      if (!neighbor.visited) {
        int edgeCost = current.neighbors.get(neighbor);
        int newNeighborEdgeCost = current.dijDist + edgeCost;
        if (newNeighborEdgeCost < neighbor.dijDist) {
          neighbor.dijDist = newNeighborEdgeCost;
        }
        minHeap.add(neighbor);
      }
    }
  }
  return -1;
} 


class DijkstraComparator implements Comparator<Node> {

  // Overriding compare()method of Comparator 
  // for descending order of cgpa
  public int compare(Node s1, Node s2) {
    if (s1.dijDist > s2.dijDist)
      return 1;
    else if (s1.dijDist  < s2.dijDist)
      return -1;
    return 0;
  }
}
