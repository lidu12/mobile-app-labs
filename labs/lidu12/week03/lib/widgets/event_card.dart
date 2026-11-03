import 'package:flutter/material.dart';

import '../models/event.dart';

const _months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];

/// One event in the feed.
class EventCard extends StatelessWidget {
  const EventCard({required this.event, super.key});

  final Event event;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    final day = '${event.start.day}';
    final month = _months[event.start.month - 1];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            // 1. Date box: 56 px wide with primaryContainer color and rounded corners
            Container(
              width: 56,
              padding: const EdgeInsets.symmetric(vertical: 8),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: colors.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    day,
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colors.onPrimaryContainer,
                    ),
                  ),
                  Text(
                    month,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: colors.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),

            // 2. Event details wrapped in Expanded so long titles don't overflow
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title: at most 2 lines, then ellipsis "…"
                  Text(
                    event.title,
                    style: theme.textTheme.titleMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // Venue: bold label + ' · ' + location
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: event.venue.label,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        TextSpan(text: ' · ${event.venue.location}'),
                      ],
                    ),
                    style: theme.textTheme.bodyMedium,
                  ),
                  // Description: only rendered if not empty
                  if (event.description.isNotEmpty)
                    Text(
                      event.description,
                      style: theme.textTheme.bodySmall,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                ],
              ),
            ),

            // 3. Free Chip: only shown if event.isFree is true
            if (event.isFree) ...[
              const SizedBox(width: 8),
              const Chip(label: Text('Free')),
            ],
          ],
        ),
      ),
    );
  }
}
