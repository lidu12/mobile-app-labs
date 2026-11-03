import 'package:flutter/material.dart';

import '../data/sample_events.dart';
import '../widgets/event_card.dart';

/// The events feed.
class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  static const wideBreakpoint = 600.0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= wideBreakpoint) {
          return GridView.builder(
            padding: const EdgeInsets.all(8),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 480,
              mainAxisExtent: 200,
            ),
            itemCount: sampleEvents.length,
            itemBuilder: (context, index) =>
                EventCard(event: sampleEvents[index]),
          );
        }

        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: sampleEvents.length,
          itemBuilder: (context, index) =>
              EventCard(event: sampleEvents[index]),
        );
      },
    );
  }
}
