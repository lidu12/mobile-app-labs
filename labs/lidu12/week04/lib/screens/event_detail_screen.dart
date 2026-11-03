import 'package:flutter/material.dart';

import '../models/event.dart';

/// Full-screen detail for one event. Pushed on the root navigator, so it
/// covers the bottom navigation bar and gets an automatic back button.
class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({required this.event, super.key});

  /// Null when the id in the URL does not match any event (deep link to a
  /// deleted event, typo in the address bar).
  final Event? event;

  @override
  Widget build(BuildContext context) {
    final event = this.event;
    if (event == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text('Event not found')),
      );
    }

    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(event.title)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(event.title, style: theme.textTheme.headlineSmall),
          const SizedBox(height: 8),
          const ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Icon(Icons.schedule),
            title: Text(''),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.place),
            title: Text(event.venue.label),
            subtitle: Text(event.venue.location),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.confirmation_number),
            title: Text(event.isFree ? 'Free' : 'Paid'),
          ),
          if (event.description.isNotEmpty) ...[
            const SizedBox(height: 16),
            Text(event.description, style: theme.textTheme.bodyLarge),
          ],
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.share),
              tooltip: 'Share',
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.calendar_today),
              tooltip: 'Add to calendar',
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.bookmark_border),
              tooltip: 'Bookmark',
              onPressed: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Registered for ')),
          );
        },
        icon: const Icon(Icons.how_to_reg),
        label: const Text('Register'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}