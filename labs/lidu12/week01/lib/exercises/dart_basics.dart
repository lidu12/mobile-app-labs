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
  // 1. Edge case: if count is 0 or negative, return an empty list
  if (count <= 0) {
    return [];
  }

  // 2. Edge case: if only 1 number is requested, return [0]
  if (count == 1) {
    return [0];
  }

  // 3. Start the list with the first two base Fibonacci numbers: 0 and 1
  final list = <int>[0, 1];

  // 4. Keep adding numbers until the list has reached 'count' items
  while (list.length < count) {
    // Add the last number and the second-to-last number together
    final nextNumber = list[list.length - 1] + list[list.length - 2];
    
    // Append the new number to the end of our list
    list.add(nextNumber);
  }

  // 5. Return the completed list
  return list;
}
String summarise(Object? value) {
  return switch (value) {
    // 1. If the value is null
    null => 'no value',

    // 2. Exact boolean values
    true => 'yes',
    false => 'no',

    // 3. If the type is a double (decimal number)
    double() => 'a decimal number',

    // 4. If the type is a String, bind it to variable 's' to read its length
    String s => '"$s" has ${s.length} characters',

    // 5. If the type is a Map, bind it to variable 'm' to read its entry count
    Map m => 'a map with ${m.length} entries',

    // 6. Default fallback for any other type
    _ => 'unknown',
  };
}