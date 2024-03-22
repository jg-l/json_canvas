import 'package:json_canvas/json_canvas.dart';

void main() {
// Create your Canvas
  final myCanvas = Canvas();

// Create a text node
  final myTextNode = TextNode(
    id: 'unique-id-123',
    x: 0,
    y: 0,
    width: 100,
    height: 100,
    text: 'Hello Word!',
  );

// Add the node to th
  myCanvas.addNode(myTextNode);

  final myOtherTextNode = TextNode(
    id: 'unique-id-999',
    x: 100,
    y: 100,
    width: 100,
    height: 100,
    text: 'Hello Again, World!',
  );

// Add Another one
  myCanvas.addNode(myOtherTextNode);

// Make a connection between the two nodes
  myCanvas.addEdge(Edge(
    id: "edge-1",
    fromNode: myTextNode.id,
    toNode: myOtherTextNode.id,
    label: "Connection 1",
  ));

// Remove a node and all of its connections
  myCanvas.removeNode(myTextNode.id);

// Export to JSON Canvas
  myCanvas.toJson();
}
