import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data/sample_events.dart';
import '../models/event.dart';
import '../navigation/router.dart';
import '../widgets/event_card.dart';

/// The events feed.
///
/// [now] is injectable so tests (and the sample data) do not depend on the
/// real clock.
class EventsScreen extends StatelessWidget {
  const EventsScreen({this.now, super.key});

  final DateTime? now;

  static const wideBreakpoint = 600.0;

  @override
  Widget build(BuildContext context) {
    final clock = now ?? DateTime.now();
    final upcoming = sampleEvents
        .where((e) => e.isUpcoming(now: clock))
        .toList();
    final past = sampleEvents
        .where((e) => !e.isUpcoming(now: clock))
        .toList();

    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'Upcoming'),
              Tab(text: 'Past'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _EventList(events: upcoming, emptyText: 'No upcoming events'),
                _EventList(events: past, emptyText: 'No past events'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _EventList extends StatelessWidget {
  const _EventList({required this.events, required this.emptyText});

  final List<Event> events;
  final String emptyText;

  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) {
      return Center(child: Text(emptyText));
    }

    Widget item(BuildContext context, int index) {
      final event = events[index];
      return EventCard(
        event: event,
        onTap: () => context.push(Routes.eventDetailFor(event.id)),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= EventsScreen.wideBreakpoint) {
          return GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 480,
              mainAxisExtent: 200,
            ),
            itemCount: events.length,
            itemBuilder: item,
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: events.length,
          itemBuilder: item,
        );
      },
    );
  }
}
