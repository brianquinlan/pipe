import 'dart:io';

void main() {
  final f = File('/tmp/f2f2');
  print(f.lastAccessedSync());
  print(f.lengthSync());
  var l = 0;
  while (true) {
    f.writeAsStringSync('test: $l\n');
    ++l;
  }
}
