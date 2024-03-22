import 'package:json_canvas/src/canvas_color.dart';
import 'package:json_canvas/src/node.dart';

enum Side { top, right, bottom, left }

enum End { none, arrow }

class Edge {
  String id;
  Node fromNode;
  Side? fromSide;
  End? fromEnd;
  Node toNode;
  Side? toSide;
  End? toEnd;
  CanvasColor? color;
  String? label;

  Edge({
    required this.id,
    required this.fromNode,
    this.fromSide,
    this.fromEnd,
    required this.toNode,
    this.toSide,
    this.toEnd,
    this.color,
    this.label,
  });

  Map<String, dynamic> toJson() {
    final Map<String, String> data = {};

    data['id'] = id;
    data['fromNode'] = fromNode.id;
    if (fromSide != null) {
      data['fromSide'] = fromSide!.name;
    }
    if (fromEnd != null) {
      data['fromEnd'] = fromEnd!.name;
    }
    data['toNode'] = toNode.id;
    if (toSide != null) {
      data['toSide'] = toSide!.name;
    }
    if (toEnd != null) {
      data['toEnd'] = toEnd!.name;
    }
    if (color != null) {
      data['color'] = color!;
    }
    if (label != null) {
      data['label'] = label!;
    }

    return data;
  }
}
