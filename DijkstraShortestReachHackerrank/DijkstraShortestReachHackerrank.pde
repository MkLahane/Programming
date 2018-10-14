import java.util.*;
void setup() {
  Graph graph = new Graph();
  for (int i = 0; i < 4; i++) {
    graph.addNode(i + 1);
  }
  graph.connect(1, 2, 24);
  graph.connect(1, 4, 20);
  graph.connect(3, 1, 3);
  graph.connect(4, 3, 12);
  
  graph.printLog();

  int[] distance = dijkstra(graph, 0);
  println("Least amount of distance needed to be travelled to reach every other node from:"+0);
  println(Arrays.toString(distance));
} 

int[] dijkstra(Graph graph, int sourceIndex) {
  PriorityQueue<Node> minHeap = new PriorityQueue(new DijkstraComparator());
  for (Node node : graph.nodes) {
    node.dijDist = MAX_INT;
    node.visited = false;
  } 
  graph.graph.get(sourceIndex).dijDist = 0;
  minHeap.add(graph.graph.get(sourceIndex));
  while (!minHeap.isEmpty()) {
    Node current = minHeap.remove();
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
  //println(Arrays.toString(distance));
  int[] distance = new int[graph.nodes.size()];
  for (int i = 0; i < graph.nodes.size(); i++) {
    Node node = graph.nodes.get(i);
    distance[i] = node.dijDist;
  } 
  return distance;
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
