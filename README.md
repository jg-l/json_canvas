<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->
## Features
A package that implements the [JSON Canvas](https://jsoncanvas.org/) in Dart! You can easily use it in Flutter projects.

## Usage

```dart
import 'package:json_canvas/json_canvas.dart';


// Create a canvas
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

// Add the node to the Canvas
myCanvas.addNode(myTextNode);

// Create another node
final myOtherTextNode = TextNode(
id: 'unique-id-999',
x: 100,
y: 100,
width: 100,
height: 100,
text: 'Hello Again, World!',
);

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
```

## Additional information

- Read the [JSON Canvas Spec](https://jsoncanvas.org/spec/1.0/)
- [ ] Flutter Implementation


