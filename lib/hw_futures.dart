import 'dart:async';

Future<String> fetchName({bool isPrint = false}) async {
  final name = await Future.delayed(const Duration(seconds: 2), () => 'Олександр');

  if (isPrint) print('Мене звати $name');

  return name;
}

Future<String> fetchAge({bool isPrint = false}) async {
  final ageString = await Future.delayed(const Duration(microseconds: 1500), () => '25');
  final age = int.parse(ageString);
  final agePlural = switch (age) {
    _ when age % 100 > 10 && age % 100 < 20 => 'років',
    _ when age % 10 > 1 && age % 10 < 5 => 'роки',
    _ when age % 10 == 1 => 'рік',
    _ => 'років'
  };

  if (isPrint) print('Мені $age $agePlural');

  return ageString;
}

void main() async {
  print('---------- Task 1 ----------');
  await fetchName(isPrint: true);

  print('---------- Task 2 ----------');
  await fetchAge(isPrint: true);
}