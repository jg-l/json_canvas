import 'package:json_canvas/src/canvas_color.dart';
import 'package:json_canvas/src/node.dart';

enum Side { top, right, bottom, left }

enum End { none, arrow }

class Edge {
  String id;
  String fromNode;
  Side? fromSide;
  End? fromEnd;
  String toNode;
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
    data['fromNode'] = fromNode;
    if (fromSide != null) {
      data['fromSide'] = fromSide!.name;
    }
    if (fromEnd != null) {
      data['fromEnd'] = fromEnd!.name;
    }
    data['toNode'] = toNode;
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

  static Edge fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': String id,
        'fromNode': String fromNode,
        'toNode': String toNode,
        // 'fromSide': String? fromSide,
        // 'fromEnd': String? fromEnd,
        // 'toSide': String? toSide,
        // 'toEnd': String? toEnd,
        // 'color': String? color,
        // 'label': String? label,
      } =>
        Edge(
          id: id,
          fromNode: fromNode,
          toNode: toNode,
          fromSide: Side.values.firstWhere(
              (element) => element.name == json["fromSide"],
              orElse: () => throw StateError('no match found for fromSide')),
          fromEnd: End.values.firstWhere(
              (element) => element.name == json["fromEnd"],
              orElse: () => throw StateError('no match found for fromEnd')),
          toSide: Side.values.firstWhere(
              (element) => element.name == json["toSide"],
              orElse: () => throw StateError('no match found for side toSide')),
          toEnd: End.values.firstWhere(
              (element) => element.name == json["toEnd"],
              orElse: () => throw StateError('no match found for toEnd')),
          color: json["color"],
          label: json["label"],
        ),
      _ => throw FormatException("Edge didn't match any patterns"),
    };
  }
}
