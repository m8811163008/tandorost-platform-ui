import 'dart:convert';
import 'dart:io';

class ColorsParser {
  final String path;
  ColorsParser({required this.path});

  String _parseColors(String colorName, Map<String, dynamic> jsonValue) {
    String colorValue = jsonValue['Color']['sys'][colorName]['\$value'];
    if (colorValue.contains('.')) {
      colorValue = colorValue.replaceAll(RegExp(r'[{}]'), '');
      final colorPath = colorValue.split('.');
      colorValue = jsonValue[colorPath[0]][colorPath[1]][colorPath[2]]
          [colorPath[3]]['\$value'];
    }
    colorValue = colorValue.replaceAll('#', '');

    return colorValue;
  }

  void generateParameters(List<String> parameters) {
    final buffer = StringBuffer();
    final jsonString = File(path).readAsStringSync();
    final jsonValue = json.decode(jsonString) as Map<String, dynamic>;
    for (var parameter in parameters) {
      final color = _parseColors(parameter, jsonValue);
      buffer.writeln('$parameter : Color(0xff$color),');
    }
    // print(buffer.toString());
  }
}
