// Week 2 Dart exercises — classes, inheritance, sealed types, mixins,
// generics, extensions and async.
import 'dart:async';
import 'dart:math' as math;

// ---------------------------------------------------------------------------
// Exercise 1 — Student
// ---------------------------------------------------------------------------

class Student {
  Student({required this.firstName, required this.lastName, required this.id});

  /// Named constructor for an anonymous visitor.
  Student.guest()
      : firstName = 'Guest',
        lastName = '',
        id = 'GUEST';

  final String firstName;
  final String lastName;
  final String id;

  String get fullName => lastName.isEmpty ? firstName : '$firstName $lastName';

  @override
  String toString() => 'Student($id, $fullName)';
}

// ---------------------------------------------------------------------------
// Exercise 2 — Shapes: sealed class & pattern matching area()
// ---------------------------------------------------------------------------

sealed class Shape {
  const Shape();
}

class Circle extends Shape {
  const Circle(this.radius);
  final double radius;
}

class Rectangle extends Shape {
  const Rectangle(this.width, this.height);
  final double width;
  final double height;
}

class Square extends Rectangle {
  const Square(double side) : super(side, side);
}

double area(Shape shape) => switch (shape) {
      Circle(:final radius) => math.pi * radius * radius,
      Rectangle(:final width, :final height) => width * height,
    };

// ---------------------------------------------------------------------------
// Exercise 3 (Extra task) — Mixins
// ---------------------------------------------------------------------------

mixin Logger {
  final List<String> logs = [];

  void log(String message) {
    logs.add('[$runtimeType] $message');
  }
}

mixin Greeter {
  String get name;
  String greet() => 'Hello, I am $name';
}

class Robot with Logger, Greeter {
  Robot(this.name);

  @override
  final String name;

  String introduce() {
    final message = greet();
    log(message);
    return message;
  }
}

// ---------------------------------------------------------------------------
// Exercise 4 — Stack<T>
// ---------------------------------------------------------------------------

class Stack<T> {
  final List<T> _items = [];

  bool get isEmpty => _items.isEmpty;
  int get length => _items.length;

  void push(T item) => _items.add(item);

  T pop() {
    if (_items.isEmpty) throw StateError('Stack is empty');
    return _items.removeLast();
  }

  T? peek() => _items.isEmpty ? null : _items.last;
}

// ---------------------------------------------------------------------------
// Exercise 5 (Extra task) — Extension StringX
// ---------------------------------------------------------------------------

extension StringX on String {
  String capitalize() {
    if (isEmpty) return '';
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  String titleCase() {
    if (isEmpty) return '';
    return split(' ').map((word) => word.capitalize()).join(' ');
  }
}

// ---------------------------------------------------------------------------
// Exercise 6 — Wallet with custom exception
// ---------------------------------------------------------------------------

class InsufficientFundsException implements Exception {
  InsufficientFundsException(this.requested, this.available);
  final int requested;
  final int available;
}

class Wallet {
  Wallet([this._balance = 0]);
  int _balance;

  int get balance => _balance;

  void deposit(int amount) {
    if (amount <= 0) throw ArgumentError('Deposit must be positive');
    _balance += amount;
  }

  void withdraw(int amount) {
    if (amount > _balance) {
      throw InsufficientFundsException(amount, _balance);
    }
    _balance -= amount;
  }

  bool tryWithdraw(int amount) {
    try {
      withdraw(amount);
      return true;
    } on InsufficientFundsException {
      return false;
    }
  }
}

// ---------------------------------------------------------------------------
// Exercise 7 — Futures
// ---------------------------------------------------------------------------

Future<String> fetchGreeting(String name,
    {Duration delay = const Duration(milliseconds: 10)}) async {
  await Future<void>.delayed(delay);
  return 'Hello, $name';
}

Future<List<String>> fetchAllGreetings(List<String> names) {
  return Future.wait(names.map(fetchGreeting));
}

Future<String> fetchGreetingOrThrow(String name) async {
  if (name.isEmpty) throw ArgumentError('Name must not be empty');
  return fetchGreeting(name);
}
