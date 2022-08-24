import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';


void main() async {
  final f = File(r'\\.\pipe\Foo'); // File('/tmp/f2f2');
//  print(f.lastAccessedSync());
//  print(f.lengthSync());
  final r = await f.open();
  final sc = StreamController<Uint8List>();
  sc.stream.map(utf8.decode)
    .transform(new LineSplitter())
    .forEach((l) => print('line: $l'));
    
  while(true) {
    final bytes = await r.read(10);
    sc.sink.add(bytes);
//    final s = utf8.decode(bytes);
//    print(s);
  }
}