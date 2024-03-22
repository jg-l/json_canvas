import 'dart:convert';

import 'package:json_canvas/src/canvas.dart';
import 'package:json_canvas/src/canvas_color.dart';
import 'package:json_canvas/src/edge.dart';
import 'package:json_canvas/src/node.dart';
import 'package:test/test.dart';

void main() {
  group('Canvas API Test', () {
    final myCanvas = Canvas();

    final textNode = TextNode(
      id: '1',
      x: 0,
      y: 0,
      width: 1,
      height: 1,
      text: 'Hello World',
    );

    final groupNode = GroupNode(
      id: '2',
      x: 5,
      y: 5,
      width: 1,
      background: '/path/to/background.png',
      backgroundStyle: GroupNodeBackgroundStyle.cover,
      height: 1,
    );

    final urlNode = LinkNode(
      id: '3',
      x: 5,
      y: 5,
      width: 1,
      height: 1,
      url: 'myurl.com',
      color: "Hello",
    );

    final edge1 = Edge(
      id: 'edge-id-1',
      fromNode: textNode.id,
      toNode: groupNode.id,
      toEnd: End.arrow,
      fromEnd: End.arrow,
      fromSide: Side.bottom,
      toSide: Side.top,
      color: CanvasColorPresets.red.toNum().toString(),
    );

    setUp(() {});

    test('add nodes to Canvas', () {
      myCanvas.addNode(textNode);
      myCanvas.addNode(groupNode);
      expect(myCanvas.nodes?.isNotEmpty, true);
      expect(myCanvas.nodes?.length, 2);
    });

    test('add edges to Canvas', () {
      myCanvas.addEdge(edge1);
      expect(myCanvas.edges?.isNotEmpty, true);
      expect(myCanvas.edges?.length, 1);
    });

    test('encode to Canvas to jsoncanvas', () {
      final jsonCanvas = jsonEncode(myCanvas);
      expect(jsonCanvas,
          '{"nodes":[{"id":"1","type":"text","x":0,"y":0,"width":1,"height":1,"text":"Hello World"},{"id":"2","type":"group","x":5,"y":5,"width":1,"height":1,"background":"/path/to/background.png","backgroundStyle":"cover"}],"edges":[{"id":"edge-id-1","fromNode":"1","fromSide":"bottom","fromEnd":"arrow","toNode":"2","toSide":"top","toEnd":"arrow","color":"1"}]}');
    });

    test('decode from jsoncanvas to Canvas', () {
      final testCanvas =
          '{"nodes":[{"id":"1","type":"text","x":0,"y":0,"width":1,"height":1,"text":"Hello World"},{"id":"2","type":"group","x":5,"y":5,"width":1,"height":1,"background":"/path/to/background.png","backgroundStyle":"cover"}],"edges":[{"id":"edge-id-1","fromNode":"1","fromSide":"bottom","fromEnd":"arrow","toNode":"2","toSide":"top","toEnd":"arrow","color":"1"}]}';
      final decodedJson = jsonDecode(testCanvas);
      final canvasFromJson = Canvas.fromJson(decodedJson);
      expect(canvasFromJson.edges?.length, 1);
      expect(canvasFromJson.nodes?.length, 2);

      // expect(jsonCanvas,
      //     '{"nodes":[{"id":"1","type":"text","x":0,"y":0,"width":1,"height":1,"text":"Hello World"},{"id":"2","type":"group","x":5,"y":5,"width":1,"height":1,"background":"/path/to/background.png","backgroundStyle":"cover"}],"edges":[{"id":"edge-id-1","fromNode":"1","fromSide":"bottom","fromEnd":"arrow","toNode":"2","toSide":"top","toEnd":"arrow","color":"1"}]}');
    });
  });
}
