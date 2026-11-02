# Week 2 — Lifecycle and State

## Task 2: Widget State Decisions

| Widget | Stateless or stateful? | Why |
|---|---|---|
| `CampusCompanionApp` (`lib/app.dart`) | Stateless | It does not own any mutable values that change while on screen; it only configures the MaterialApp theme and routing. |
| `HomeScreen` (`lib/screens/home_screen.dart`) | Stateful | It owns mutable values that change over time: `_checkIns` (the check-in counter) and `_showLogger` (the toggle to show/hide the logger). |
| `LifecycleLogger` (`lib/widgets/lifecycle_logger.dart`, Task 3) | Stateful | It tracks and updates internal state (`_buildCount`) each time the widget rebuilds. |

## Task 3: Lifecycle Predictions

| Step | Prediction (callbacks in order; card text) | Console output | Same? |
|---|---|---|---|
| 1. Turn the switch on | Callbacks: `initState`, `didChangeDependencies`, `build`<br>Card: `Check-ins: 0 — built 1 time(s)` | `[LifecycleLogger] initState (Check-ins: 0)`<br>`[LifecycleLogger] didChangeDependencies`<br>`[LifecycleLogger] build` | Yes |
| 2. Press the FAB three times | For each tap: `didUpdateWidget`, `build`<br>Card ends at: `Check-ins: 3 — built 4 time(s)` | `[LifecycleLogger] didUpdateWidget (Check-ins: 0 → Check-ins: 1)`<br>`[LifecycleLogger] build`<br>(repeated for 2 and 3) | Yes |
| 3. Turn the switch off | Callbacks: `dispose`<br>Card: (removed from screen) | `[LifecycleLogger] dispose` | Yes |
| 4. Turn the switch on again | Callbacks: `initState`, `didChangeDependencies`, `build`<br>Card: `Check-ins: 3 — built 1 time(s)` (counter resets) | `[LifecycleLogger] initState (Check-ins: 3)`<br>`[LifecycleLogger] didChangeDependencies`<br>`[LifecycleLogger] build` | Yes |
