import 'dart:async';

Future<String> fetchName({bool isPrint = false}) async {
  final name = await Future.delayed(const Duration(seconds: 2), () => 'Олександр');

  if (isPrint) print('Мене звати $name');

  return name;
}

void main() async {
  print('---------- Task 1 ----------');
  await fetchName(isPrint: true);
}