// Week 1 Dart exercises — variables, operators, control flow, functions,
// collections. Replace each `throw UnimplementedError()` with a working
// implementation. Run the tests with:
//
//   flutter test test/exercises
//
// The worked examples from the lecture are in lecture_examples.dart. Each
// exercise below is similar to one of them, but not the same: read the
// example, close the file, then write the exercise yourself.
//
// You can also paste a function into https://dartpad.dev to experiment.

/// Returns 'Fizz' if [n] is divisible by 3, 'Buzz' if divisible by 5,
/// 'FizzBuzz' if divisible by both, otherwise [n] as a string.
String fizzBuzz(int n) {
  if (n % 3 == 0 && n % 5 == 0) {
    return 'FizzBuzz';
  } else if (n % 3 == 0) {
    return 'Fizz';
  } else if (n % 5 == 0) {
    return 'Buzz';
  } else {
    return '$n';
  }
}
 
double averageOfPositives(List<double> numbers) {
  double sum = 0.0;
  int count = 0;

  for (final n in numbers) {
    if (n > 0) {
      sum += n;
      count++;
    }
  }

  if (count == 0) {
    return 0.0;
  }

  return sum / count;
}

String bmiCategory(double bmi) {
  if (bmi <= 0) {
    throw ArgumentError('BMI must be positive');
  }

  if (bmi < 18.5) {
    return 'Underweight';
  } else if (bmi < 25) {
    return 'Normal';
  } else if (bmi < 30) {
    return 'Overweight';
  } else {
    return 'Obese';
  }
}

/// Returns true when [text] reads the same forwards and backwards,
/// ignoring case and any character that is not a letter or digit.
/// 'A man, a plan, a canal: Panama' → true.
bool isPalindrome(String text) {
  final cleaned = text.toLowerCase().replaceAll(RegExp('[^a-z0-9]'), '');
  final reversed = cleaned.split('').reversed.join('');
  return cleaned == reversed;
}

/// Counts how many times each letter a–z occurs in [text], ignoring case.
/// Spaces, digits and punctuation are not counted.
/// 'Hello, World!' → {'h': 1, 'e': 1, 'l': 3, 'o': 2, 'w': 1, 'r': 1, 'd': 1}
Map<String, int> letterCount(String text) {
  final counts = <String, int>{};
  final cleanedText = text.toLowerCase();

  for (final char in cleanedText.split('')) {
    if (RegExp(r'^[a-z]$').hasMatch(char)) {
      counts[char] = (counts[char] ?? 0) + 1;
    }
  }

  return counts;
}
double convertDistance(double value, {bool toKilometres = false}) {
  final double result;

  if (toKilometres) {
    result = value / 0.621371;
  } else {
    result = value * 0.621371;
  }

  final String roundedText = result.toStringAsFixed(1);
  return double.parse(roundedText);
}
List<int> fibonacci(int count) {
  // TODO(lab): Exercise 7
  throw UnimplementedError();
}

/// Summarises a value that may be null or of any type:
/// null → 'no value', true → 'yes', false → 'no',
/// a double → 'a decimal number', a String → '"hi" has 2 characters',
/// a Map → 'a map with 3 entries', anything else → 'unknown'.
String summarise(Object? value) {
  // TODO(lab): Exercise 8 — similar example: describe. Use a `switch`
  // with type patterns.
  throw UnimplementedError();
}
