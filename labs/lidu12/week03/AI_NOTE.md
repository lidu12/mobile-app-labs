# AI Note - Week 3

1. **Which task did you use an assistant for (or "none")?**
   Used an assistant for conceptual explanations of `LayoutBuilder` breakpoints (Task 3), responsive portrait vs landscape layout in `ProfileScreen` (Task 4), and comparing explanations in Task 5 (`schedule_row.md`).

2. **What did it get wrong, or what did you not understand?**
   In Task 5 (`schedule_row.md`), the saved AI answer had an invalid parameter (`minWidth: 72` on `FilledButton`) and completely misstated the Flutter layout algorithm: it claimed that a `Row` constrains children to its width, whereas in reality a `Row` measures children with unbounded width (causing `RenderFlex` overflow unless wrapped in `Expanded`).

3. **What did you check yourself, and how?**
   Ran all 28 widget and screen tests with `flutter test` (all passing), verified static analysis with `flutter analyze --fatal-infos` (0 issues), and inspected responsive layout transitions across 320 px, 360 px, 600 px, and 900 px widths.
