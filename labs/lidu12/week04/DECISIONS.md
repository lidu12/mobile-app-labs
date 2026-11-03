# Settings Screen Design Decisions

## Decision 1: Entry Point
**Decision:** Settings is opened from an action button in the `AppBar` (with tooltip `'Settings'`) and also accessible from the `Drawer`.
**Reason:** The requirement states that Settings must be reachable from every tab. The `AppBar` and `Drawer` are persistent and shared across all tabs in `DesignShell`. Putting an icon button in the `AppBar` allows immediate 1-tap access from any tab, while placing it in the drawer keeps secondary configuration grouped with other global app destinations. It does not belong in the bottom `NavigationBar` because the bottom bar is reserved for primary, frequently switched content destinations (Home, Timetable, Map), and Settings is accessed occasionally.

## Decision 2: Navigator Placement
**Decision:** The `/settings` route is declared at the top-level of `GoRouter` outside the `StatefulShellRoute`, using `parentNavigatorKey: designRootKey`.
**Reason:** The requirement states that Settings must hide the bottom bar. Any route nested inside a `StatefulShellBranch` stays within the shell frame and keeps the `NavigationBar` visible. Placing it on the root navigator ensures that `SettingsPage` pushes as a full-screen route covering the entire shell, including the bottom bar, and automatically provides a back button that pops back to the previous tab.
