# AI Note — Week 4

1. **Which task did you use an assistant for (or "none")?**
   Tasks 2 through 8 (reviewing navigation routes, deep linking syntax with `go_router`, and verifying tests).

2. **What did it get wrong, or what did you not understand?**
   Initially confused `context.go` with `context.push`. `context.go` replaces the location and discards the previous stack history, whereas `context.push` pushes a new route onto the stack so the Back button and `await` return results properly.

3. **What did you check yourself, and how?**
   Ran `flutter test` across all navigation and screen tests to ensure all tests passed, tested deep links (`/events/e3`, `/events/nope`, `/nothing`), and verified that editing the profile properly propagates the updated name upon saving.
