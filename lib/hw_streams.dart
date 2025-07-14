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

Future<void> streamTask7() async {
  final Stream<int> stream2 = Stream.periodic(Duration(seconds: 1), (i) => ++i).take(10);

  stream2.listen((value) {
    print('Task 7 / $value...');
  });
}

Future<void> streamTask8() async {
  final controller = StreamController<String>();

  controller.stream.listen(
    (value) => print('Task 8 / StreamController: $value'),
    onDone: () => print('Task 8 / Стрім завершено')
  );

  controller.add("Hello");
  controller.add("World");
  controller.add("Dart");

  await controller.close();
}

void main() async {
  print('---------- Task 6 ----------');
  await streamTask6();

  print('---------- Task 7 ----------');
  await streamTask7();

  print('---------- Task 8 ----------');
  await streamTask8();
}