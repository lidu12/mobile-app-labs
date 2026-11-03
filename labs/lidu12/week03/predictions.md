# Week 3 Predictions

## Task 1 — Register the asset

| Step | Prediction: what will you see? | What you saw | Same? |
|---|---|---|---|
| a. Add `Image.asset('assets/images/logo.png')` to the stub `ProfileScreen`, press `R` (hot restart), switch to *Profile* | App will compile, but throwing an `Unable to load asset: "assets/images/logo.png"` exception at runtime because the asset isn't registered in the asset bundle. | An `Unable to load asset` error message appeared in the console / error screen. | Yes |
| b. Declare the folder in `pubspec.yaml` (step 3 below), then press `R` | The logo image will load and display properly inside the Center widget. | The logo image was successfully loaded and rendered on screen. | Yes |

### Self-check 1
- **Why did the app build without an error in step a, but fail when it ran?**
  In step a, `'assets/images/logo.png'` is just a Dart `String` passed to the constructor. Dart and the compiler only check type validity, not whether the file exists in the bundle. At runtime, Flutter attempts to locate the key in the compiled `AssetManifest.json` and loads the bytes; since it was not declared in `pubspec.yaml`, the lookup fails and throws an `AssetNotFoundException` / `FlutterError`.

## Task 2 — EventCard (Self-check 2)

**What you will see if you remove the `Expanded` around the details and the title is very long:**

- **Prediction:** A `RenderFlex overflowed` exception will occur because a `Row` measures children with unbounded horizontal width, causing the Column to be wider than the available screen width.
- **Actual observation:** Yellow and black hazard tape with `RenderFlex overflowed by ... pixels on the right`.

## Task 3 — EventsScreen: list, then grid

| Step | Prediction | What you saw | Same? |
|---|---|---|---|
| a. Drag the Chrome window from narrower than 600 px to wider | The layout switches responsively from a single column vertical list to a multi-column grid of cards | The view smoothly transitioned from 1-column list to 2-column grid when width exceeded 600 px | Yes |
| b. Change `mainAxisExtent` to `120`, hot reload, look at a wide window | Grid tiles become squished; cards with titles and descriptions overflow vertically | Cards suffered bottom overflow errors because 120 px is not enough height for all card elements | Yes |
| c. With `120`, run `flutter test test/screens/events_screen_test.dart`: which test fails, and with which message? | A layout test failure occurs due to child overflow inside the grid cell | Tests fail with RenderFlex overflow on the bottom | Yes |

## Task 5 — Check an assistant's layout code (schedule_row.md)

### 1. Initial Predictions (Without running code)
- **(a) Does the code compile?**
  No, `FilledButton` has no named parameter `minWidth`.
- **(b) What does a 360-pixel wide phone show for `Mobile Applications Development`?**
  It crashes with `RenderFlex overflowed by ... pixels on the right` because the Column is unconstrained inside a Row.
- **(c) What does it show for `Compilers`?**
  "Compilers" is short enough to fit horizontally, so it displays without overflow.

### 2. Issues & Markings
1. **Compilation error (`minWidth`):**
   - Line 55: `minWidth: 72` does not exist on `FilledButton`. (Found via analyzer: `The named parameter 'minWidth' isn't defined`).
2. **False explanation on Row width:**
   - Explanation #2 claims a Row limits children to the width of the row. This is false: a Row measures un-flexed children with unbounded (infinite) width. (Found via Flutter documentation on `Row` layout algorithm).
3. **False explanation on Text ellipsis:**
   - Explanation #3 claims `overflow: TextOverflow.ellipsis` will cut off the long title. This is false because ellipsis only operates inside bounded constraints; inside an unconstrained Column in a Row, it never truncates. (Found via widget test).
4. **False explanation on Spacer:**
   - Explanation #4 claims `Spacer` shrinks to 0 px to prevent overflow. A `Spacer` cannot prevent an overflow caused by unconstrained sibling widgets taking more than the row's total width. (Found via widget test).
