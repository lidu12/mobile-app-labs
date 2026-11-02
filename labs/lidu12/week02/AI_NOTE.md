# AI Note - Week 2

1. **Which task did you use an assistant for (or "none")?**
   Used an assistant for conceptual explanations of the StatefulWidget lifecycle and reviewing Task 4 syntax.

2. **What did it get wrong, or what did you not understand?**
   Initially, I did not understand why the build count resets when toggling the switch off and on; I clarified that unmounting disposes the State object completely.

3. **What did you check yourself, and how?**
   Wrote the failing widget test first in home_screen_test.dart, verified all test suites locally with `flutter test`, and ran `flutter analyze --fatal-infos`.
