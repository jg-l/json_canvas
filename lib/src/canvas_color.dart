enum CanvasColorPresets { red, orange, yellow, green, cyan, purple }

extension Number on CanvasColorPresets {
  int toNum() {
    return index + 1;
  }
}

typedef CanvasColor = String;
