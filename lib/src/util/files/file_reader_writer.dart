import 'dart:io';

Future<String> readFile(String path) async {
  return File(path).readAsString();
}

Future<void> writeFile(String path, String content) async {
  File(path).writeAsString(content);
}
