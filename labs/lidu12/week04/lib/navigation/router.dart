import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/sample_events.dart';
import '../screens/about_screen.dart';
import '../screens/check_in_screen.dart';
import '../screens/edit_profile_screen.dart';
import '../screens/event_detail_screen.dart';
import '../screens/events_screen.dart';
import '../screens/lost_found_screen.dart';
import '../screens/notes_screen.dart';
import '../screens/profile_screen.dart';
import 'app_shell.dart';

/// Route paths in one place so screens never hard-code strings twice.
abstract final class Routes {
  static const events = '/events';
  static const eventDetail = '/events/:id';
  static const notes = '/notes';
  static const lostFound = '/lost-found';
  static const profile = '/profile';
  static const editProfile = '/profile/edit';
  static const checkIn = '/check-in';
  static const about = '/about';

  static String eventDetailFor(String id) => '/events/$id';
}

/// The root navigator hosts full-screen routes (detail, edit, about) that
/// cover the bottom navigation bar. Each shell branch has its own
/// navigator, which is what keeps the tab's back stack when you switch
/// tabs and come back.
final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

GoRouter createRouter({String initialLocation = Routes.events}) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: initialLocation,
    debugLogDiagnostics: false,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            AppShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.events,
                builder: (context, state) => const EventsScreen(),
                routes: [
                  GoRoute(
                    path: ':id',
                    parentNavigatorKey: rootNavigatorKey,
                    builder: (context, state) {
                      final id = state.pathParameters['id']!;
                      final event = sampleEvents
                          .where((e) => e.id == id)
                          .firstOrNull;
                      return EventDetailScreen(event: event);
                    },
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.notes,
                builder: (context, state) => const NotesScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.lostFound,
                builder: (context, state) => const LostFoundScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: Routes.profile,
                builder: (context, state) => const ProfileScreen(),
                routes: [
                  GoRoute(
                    path: 'edit',
                    parentNavigatorKey: rootNavigatorKey,
                    builder: (context, state) => EditProfileScreen(
                      initialName: state.uri.queryParameters['name'] ?? '',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: Routes.checkIn,
        builder: (context, state) => const CheckInScreen(),
      ),
      GoRoute(
        path: Routes.about,
        builder: (context, state) => const AboutScreen(),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Not found')),
      body: Center(child: Text('No route for ${state.uri}')),
    ),
  );
}
