import 'dart:io';
import 'dart:convert';

void main() {
  final f = File('/tmp/f2f2');
  print(f.lastAccessedSync());
  print(f.lengthSync());
  final r = f.openRead();

  r.map(utf8.decode)
    .transform(new LineSplitter())
    .forEach((l) => print('line: $l'));  
}
