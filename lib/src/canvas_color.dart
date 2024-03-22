enum CanvasColorPresets { red, orange, yellow, green, cyan, purple }

extension Number on CanvasColorPresets {
  num toNum() {
    return index + 1;
  }
}

typedef CanvasColor = String;

// abstract class CanvasColor {
//   String fromPreset(CanvasColorPresets preset);
//   String fromHexcodeString(String hexcode);
//   dynamic toJson();
// }
