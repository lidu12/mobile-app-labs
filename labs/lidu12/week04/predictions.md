# Week 4 Predictions

## Task 1 — Read and predict: named routes

| Step | Prediction | What you saw | Same? |
|---|---|---|---|
| a. Open the address `…/#/events/42`. Which screen appears? | The `DemoEventPage` appears with the title "Event 42" and body "Career fair". | `DemoEventPage` ("Event 42", "Career fair") | Yes |
| b. Then press the back arrow in the app bar. Which screen appears? Press it again. | First press opens the event list (`DemoEventListPage`). Second press goes to home (`DemoHomePage`). | Shows `Events`, then `Named routes demo`. | Yes |
| c. Open the address `…/#/events/abc`. Which screen appears, and what does the console show? | It fails to resolve the initial route, logs "Could not navigate to initial route" in console, and falls back to home (`DemoHomePage`). | Console warning: "Could not navigate to initial route", home screen shown. | Yes |

### Questions
- **Which line turns the text `42` into the number 42?**
  Line 67: `final id = int.tryParse(segments[1]);`
- **What does `generateDemoRoute` return for `/events/5`, and which screen does the user then see?**
  It returns `null` because `5` is not in `demoEvents` (only 7, 42, and 108 exist). The user sees `DemoNotFoundPage` ("No screen for /events/5") via `onUnknownRoute`.
- **The app must also open `/events/42/photos/3`. Which lines would you have to add or change?**
  Check `segments.length == 4 && segments[0] == 'events' && segments[2] == 'photos'`, parse `int.tryParse(segments[1])` and `int.tryParse(segments[3])`, and return a `MaterialPageRoute` building the photo detail page.

## Task 2 — Open the detail with Navigator.push

| Step | Prediction | What you saw | Same? |
|---|---|---|---|
| a. Tap a card. Is the bottom navigation bar visible on the detail? | No, `Navigator.push` pushes a full-screen route above the entire Scaffold and bottom navigation bar. | Bottom bar is hidden. | Yes |
| b. With the detail open, tap *Profile*, then *Events*. What do you see? | You cannot tap Profile or Events because the bottom bar is completely covered by the pushed route. | Cannot tap tabs until pressing back. | Yes |

## Task 3 — Four branches
### Self-check 2:
- **(a) What happens when you remove Notes and tap the third icon (Profile)?**
  Profile branch opens because the destination index maps directly to branch index 2 (which now corresponds to the 3rd destination).
- **(b) What happens when you type `#/profile`?**
  The route still resolves and opens Profile, but the destination selection may mismatch if the destinations and branches are out of sync.

## Task 4 — A deep-linkable detail route

| Address | Prediction | What you saw | Same? |
|---|---|---|---|
| a. `#/events/e3` | Opens `EventDetailScreen` for event `e3` ("Flutter study group") | EventDetailScreen for e3 with details | Yes |
| b. `#/events/nope` | Opens `EventDetailScreen` with event as null, showing "Event not found" | "Event not found" displayed | Yes |
| c. `#/nothing` | Shows custom 404 error page: "Not found" / "No route for /nothing" | AppBar titled "Not found", body "No route for /nothing" | Yes |

## Task 5 — Drawer

| Step | Prediction | What you saw | Same? |
|---|---|---|---|
| a. Remove the line that closes the drawer, open About, press back | Pressing back returns to the screen with the drawer still open over the content. | Drawer stays open upon returning. | Yes |

## Task 6 — Return a result

| Step | Prediction | What you saw | Same? |
|---|---|---|---|
| a. Edit the name to `Hana Tadesse`. What does the address end with on the edit page the next time you open it? | Ends with `?name=Hana+Tadesse` (or `Hana%20Tadesse`). | Address ends with `?name=Hana+Tadesse` | Yes |
| b. Open the edit page and press back. What does `push` return? | Returns `null`. | Returns `null`, name remains unchanged | Yes |

## Task 7 — Upcoming and Past tabs
### Self-check 3:
- **What happens if you remove the `Expanded` around the `TabBarView`?**
  `TabBarView` requires bounded height constraints. Without `Expanded` inside a `Column`, it throws a layout exception: "Vertical viewport was given unbounded height".
