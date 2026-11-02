# Week 2 Predictions

## Task 1 — The Event Model & Venue Enum

### Predictions

| Expression | Predicted Value | Actual Value | Same? |
|---|---|---|---|
| `Venue.online.location` | `'Zoom / Teams'` | `'Zoom / Teams'` | Yes |
| `Venue.values.length` | `4` | `4` | Yes |

### Explanation & Notes

1. **`Venue.online.location`**:
   - `Venue` is an enhanced enum with constructor `const Venue(this.label, this.location)`.
   - `Venue.online` is declared as `online('Online', 'Zoom / Teams')`, so its `location` field evaluates to `'Zoom / Teams'`.

2. **`Venue.values.length`**:
   - The enum defines four cases: `mainCampus`, `scienceFaculty`, `technology`, and `online`.
   - Dart generates a `.values` list containing all declared instances in order, so its length is `4`.

3. **Self-check 1 (Injectable Clock)**:
   - `isUpcoming({DateTime? now})` takes `now` as an optional parameter (`start.isAfter(now ?? DateTime.now())`) rather than calling `DateTime.now()` directly so that tests can inject a fixed timestamp. This makes the method deterministic and testable across different dates and times.
