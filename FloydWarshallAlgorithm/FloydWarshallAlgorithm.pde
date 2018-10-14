import java.util.*;
void setup() {
  Graph graph = new Graph();
  graph.addNode(1);
  graph.addNode(2);
  graph.addNode(3);
  graph.addNode(4);
  graph.addNode(5);
  graph.startConnecting();
  graph.connect(4, 1, 4);
  graph.connect(1, 2, 5);
  graph.connect(1, 5, 3);
  graph.connect(2, 3, 1);
  graph.connect(5, 3, 2);
  

  graph.printLog();
  floydWarshall(graph);
  graph.printLog();
  int from = 4;
  int to = 3;
  from--;to--;
  println("Min Distance:"+graph.edges[from][to]);
} 


void print2dArr(int[][] arr) {
  for (int i = 0; i < arr.length; i++) {
    for (int j = 0; j < arr[0].length; j++) {
      print(arr[i][j]+" ");
    }
    println();
  } 
  println();
} 

void floydWarshall(Graph g) {
  int[][] path = new int[g.nodes.size()][g.nodes.size()];
  for (int i = 0; i < path.length; i++) {
    for (int j = 0; j < path[0].length; j++) {
      path[i][j] = i;
      if (g.edges[i][j] == 0 || g.edges[i][j] == MAX_INT) {
        path[i][j] = -1;
      }
    }
  }
  println("Original Path:");
  print2dArr(path);

  for (int k = 0; k < path.length; k++) {
    for (int i = 0; i < path.length; i++) {
      for (int j = 0; j < path.length; j++) {
        if (g.edges[i][k] == MAX_INT || g.edges[k][j] == MAX_INT) {
          continue;
        } 
        if (g.edges[i][j] > g.edges[i][k] + g.edges[k][j]) {
          g.edges[i][j] = g.edges[i][k] + g.edges[k][j];
          path[i][j] = path[k][j];
        }
      }
    }
  }
  println("New path:");
  print2dArr(path);
  println();
} 
