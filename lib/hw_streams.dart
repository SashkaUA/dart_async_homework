import 'dart:async';

Future<void> streamTask6() async {
  final stream = Stream.fromIterable([1, 2, 3, 4, 5]);

  await for (final value in stream) {
    print('Task 6 / Await for: $value');
  }

  stream.listen((value) {
    print('Task 6 / Listen: $value');
  });
}

void main() async {
  print('---------- Task 6 ----------');
  await streamTask6();
}