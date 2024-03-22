import 'package:json_canvas/src/canvas_color.dart';

sealed class Node {
  String id;
  String type;
  int x;
  int y;
  int width;
  int height;
  CanvasColor? color;

  Node({
    required this.id,
    required this.type,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    this.color,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['id'] = id;
    data['type'] = type;
    data['x'] = x;
    data['y'] = y;
    data['width'] = width;
    data['height'] = height;
    if (color != null) {
      data['color'] = color!;
    }

    return data;
  }

  static Node fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': String id,
        'type': 'text',
        'x': int x,
        'y': int y,
        'width': int width,
        'height': int height,
        'text': String text,
      } =>
        TextNode(
          id: id,
          text: text,
          x: x,
          y: y,
          width: width,
          height: height,
          color: json["color"],
        ),
      {
        'id': String id,
        'type': 'file',
        'file': String file,
        'x': int x,
        'y': int y,
        'width': int width,
        'height': int height,
      } =>
        FileNode(
          id: id,
          file: file,
          subpath: json["subpath"],
          x: x,
          y: y,
          width: width,
          height: height,
          color: json["color"],
        ),
      {
        'id': String id,
        'type': 'link',
        'url': String url,
        'x': int x,
        'y': int y,
        'width': int width,
        'height': int height,
      } =>
        LinkNode(
          id: id,
          url: url,
          x: x,
          y: y,
          width: width,
          height: height,
          color: json["color"],
        ),
      {
        'id': String id,
        'type': 'group',
        'background': String? background,
        'backgroundStyle': String? backgroundStyle,
        'x': int x,
        'y': int y,
        'width': int width,
        'height': int height,
      } =>
        GroupNode(
          id: id,
          label: json["label"],
          background: background,
          backgroundStyle: GroupNodeBackgroundStyle.values.firstWhere(
              (element) => element.name == backgroundStyle,
              orElse: () => throw StateError(
                  'no match found for side: $backgroundStyle')),
          x: x,
          y: y,
          width: width,
          height: height,
          color: json["color"],
        ),
      _ => throw FormatException("Node didn't match any patterns"),
    };
  }
}

class TextNode extends Node {
  /// In plain text with Markdown syntax
  String text;
  TextNode(
      {required this.text,
      required super.id,
      super.type = "text",
      required super.x,
      required super.y,
      super.color,
      required super.width,
      required super.height});

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> parent = super.toJson();

    parent['text'] = text;

    return parent;
  }
}

class FileNode extends Node {
  /// Path to the file within the system
  String file;

  /// A subpath may link to a heading or a block. Always starts with a #
  String? subpath;
  FileNode(
      {required this.file,
      this.subpath,
      required super.id,
      super.type = "file",
      required super.x,
      required super.y,
      super.color,
      required super.width,
      required super.height});

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> parent = super.toJson();

    parent['file'] = file;

    if (subpath != null) {
      parent['subpath'] = subpath;
    }

    return parent;
  }
}

class LinkNode extends Node {
  /// Path to the file within the system
  String url;

  LinkNode(
      {required this.url,
      required super.id,
      super.type = "link",
      required super.x,
      required super.y,
      super.color,
      required super.width,
      required super.height});

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> parent = super.toJson();

    parent['url'] = url;

    return parent;
  }
}

enum GroupNodeBackgroundStyle { cover, ratio, repeat }

/// [GroupNode] is used as a visual container for nodes within it.
class GroupNode extends Node {
  /// Text label for the group
  String? label;

  /// Path to the background image
  String? background;

  /// The rendering style of the background image. Valid values "cover", "ratio", "repeat"
  GroupNodeBackgroundStyle? backgroundStyle;

  GroupNode(
      {this.label,
      this.background,
      this.backgroundStyle,
      required super.id,
      super.type = "group",
      required super.x,
      required super.y,
      super.color,
      required super.width,
      required super.height});

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> parent = super.toJson();

    if (label != null) {
      parent['label'] = label;
    }
    if (background != null) {
      parent['background'] = background;
    }
    if (backgroundStyle != null) {
      parent['backgroundStyle'] = backgroundStyle!.name;
    }

    return parent;
  }
}
