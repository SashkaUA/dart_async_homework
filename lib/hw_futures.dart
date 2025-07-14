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

Future<void> sequentialExecution() async {
  final stopwatch = Stopwatch();

  stopwatch.start();
  
  final name = await fetchName();
  final age = await fetchAge();

  stopwatch.stop();

  print('Ім\'я: $name. Років: $age');
  print('Час послідовного виконання ${stopwatch.elapsedMilliseconds} мсек');
}

Future<void> parallelExecution() async {
  final stopwatch = Stopwatch();

  stopwatch.start();
  
  final [name, age] = await Future.wait([fetchName(), fetchAge()]);
  
  stopwatch.stop();

  print('Ім\'я: $name. Років: $age');
  print('Час паралельного виконання ${stopwatch.elapsedMilliseconds} мсек');
}

Future<String> delayedCountdown(int seconds) async {
  for (var i = seconds; i > 0; i--) {
    await Future.delayed(const Duration(seconds: 1), () => print('$i...'));
  }

  print('Старт!');

  return '';
}

void main() async {
  print('---------- Task 1 ----------');
  await fetchName(isPrint: true);

  print('---------- Task 2 ----------');
  await fetchAge(isPrint: true);

  print('---------- Task 3 ----------');
  await sequentialExecution();

  print('---------- Task 4 ----------');
  await parallelExecution();

  print('---------- Task 5 ----------');
  await delayedCountdown(3);
}