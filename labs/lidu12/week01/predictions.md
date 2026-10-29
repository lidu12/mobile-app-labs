# Lab 1 Predictions

## Task 2 — Hot Reload vs Hot Restart

| Step | Prediction: what will you see? | What you saw | Same? |
| :--- | :--- | :--- | :--- |
| **a.** Change 'Hello World!' in `lib/main.dart` to a greeting in your language, then press `r` |The greeting text updates on screen |The greeting text updated on screen immediately |Yes |
| **b.** Change `runApp(const MainApp())` to `runApp(const Placeholder())`, then press `r` |The screen changes to a placeholder box |Nothing changed; it still showed the greeting |No |
| **c.** With the change from step b still there, press `R` |A placeholder box appears |A big box with an "X" (Placeholder widget) appeared |Yes |

## Task 5 — Check an Assistant's Answer (`capitalizeWords`)

### 1. Predictions vs. Actual Behavior

| Input | Prediction: what will it return? | What actually happened | Same? |
| :--- | :--- | :--- | :--- |
| `'addis ababa'` | `'Addis Ababa'` | `'Addis Ababa'` | Yes |
| `'hello  world'` (two spaces) | `'Hello  World'` (or error on empty word) | Crashed with `RangeError (index): Index out of range: no indices are valid: 0` | No |
| `''` (empty string) | `''` (empty string) | Crashed with `RangeError (index): Index out of range: no indices are valid: 0` | No |

---

### 2. Incorrect Statements in the Assistant's Answer

1. **Claim:** *"It ignores repeated spaces, so `'hello   world'` works correctly too."*
   - **Why it is wrong:** `split(' ')` does not collapse spaces; consecutive spaces produce empty strings (`""`). Calling `word[0]` on an empty string causes a `RangeError`.
   - **How found:** Running it in Dart / runtime error.

2. **Claim:** *"Tip: for a single word you can also simply call `'hello'.capitalize()`, which Dart provides on every `String`."*
   - **Why it is wrong:** Dart does not have a built-in `.capitalize()` method in `dart:core` on `String`.
   - **How found:** Dart analyzer (`The method 'capitalize' isn't defined for the class 'String'`) and official Dart API documentation ([api.dart.dev](https://api.dart.dev/)).

3. **Claim:** *"This function handles all inputs safely."*
   - **Why it is wrong:** The function crashes whenever the string is empty or contains leading, trailing, or consecutive spaces.
   - **How found:** Running it with edge cases (`''` and `'hello  world'`).

---

### 3. Corrected Implementation

```dart
String capitalizeWords(String text) {
  return text
      .split(' ')
      .map((word) =>
          word.isEmpty ? '' : word[0].toUpperCase() + word.substring(1))
      .join(' ');
}
```