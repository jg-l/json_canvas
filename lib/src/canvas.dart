import 'package:json_canvas/src/edge.dart';
// Prevent conflict imports from dart:html
import 'package:json_canvas/src/node.dart' as json_canvas;

class Canvas {
  List<json_canvas.Node>? nodes;
  List<Edge>? edges;

  Canvas({this.nodes, this.edges});

  addNode(json_canvas.Node node) {
    nodes ??= [];
    if (nodes!.isNotEmpty) {
      if (nodes!.any((n) => n.id == node.id)) {
        throw Exception("Node id:${node.id} already exists in the canvas");
      }
    }
    nodes!.add(node);
  }

  addEdge(Edge edge) {
    edges ??= [];
    if (edges!.isNotEmpty) {
      if (edges!.any((e) => e.id == edge.id)) {
        throw Exception("Edge id:${edge.id} already exists in the canvas");
      }
    }
    edges!.add(edge);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    if (nodes != null) {
      data['nodes'] =
          List.generate(nodes!.length, (index) => nodes![index].toJson());
    }

    if (edges != null) {
      data['edges'] =
          List.generate(edges!.length, (index) => edges![index].toJson());
    }

    return data;
  }

  static Canvas fromJson(Map<String, dynamic> json) {
    var nodes = json["nodes"];
    var edges = json["edges"];
    return Canvas(
      nodes: nodes != null
          ? List.generate(nodes.length, (index) {
              print(nodes.length);
              return json_canvas.Node.fromJson(nodes[index]);
            })
          : null,
      edges: edges != null
          ? List.generate(edges.length, (index) {
              print(nodes.length);
              return Edge.fromJson(edges[index]);
            })
          : null,
    );
  }
}
