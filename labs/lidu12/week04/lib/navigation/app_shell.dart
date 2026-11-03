import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'router.dart';

/// The persistent frame around the four main sections: an AppBar, a
/// Drawer with secondary destinations, and a bottom NavigationBar.
class AppShell extends StatelessWidget {
  const AppShell({required this.navigationShell, super.key});

  final StatefulNavigationShell navigationShell;

  static const _titles = ['Events', 'Notes', 'Lost & found', 'Profile'];

  void _goBranch(int index) {
    // Tapping the current tab again pops that branch to its first route.
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[navigationShell.currentIndex])),
      drawer: const AppDrawer(),
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: _goBranch,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.event_outlined),
            selectedIcon: Icon(Icons.event),
            label: 'Events',
          ),
          NavigationDestination(
            icon: Icon(Icons.note_outlined),
            selectedIcon: Icon(Icons.note),
            label: 'Notes',
          ),
          NavigationDestination(
            icon: Icon(Icons.search_outlined),
            selectedIcon: Icon(Icons.search),
            label: 'Lost & found',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

/// Secondary destinations. A Drawer is a Scaffold slot; the ListView inside
/// scrolls if the list outgrows a small screen.
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: const Align(
              alignment: Alignment.bottomLeft,
              child: Text('Campus Companion', style: TextStyle(fontSize: 22)),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.how_to_reg),
            title: const Text('Check-in'),
            onTap: () {
              Navigator.pop(context); // close the drawer first
              context.push(Routes.checkIn);
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context); // close the drawer first
              context.push(Routes.about);
            },
          ),
          const Divider(),
          const AboutListTile(
            icon: Icon(Icons.info_outline),
            applicationName: 'Campus Companion',
            applicationVersion: '0.4.0',
          ),
        ],
      ),
    );
  }
}
