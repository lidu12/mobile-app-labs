// Lab 3, Task 6 — "Your own design": a preview card for one note.

import 'package:flutter/material.dart';

void main() => runApp(const NoteCardPreview());

/// A preview card for one note: title, the start of the body, tags and the
/// date it was last edited.
class NoteCard extends StatelessWidget {
  const NoteCard({
    required this.title,
    required this.body,
    required this.edited,
    this.tags = const [],
    this.pinned = false,
    super.key,
  });

  final String title;
  final String body;
  final DateTime edited;
  final List<String> tags;
  final bool pinned;

  /// The widest the card may be, on any screen.
  static const maxCardWidth = 560.0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: maxCardWidth),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // 1. Title row: title with ellipsis + pin icon if pinned
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: theme.textTheme.titleMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (pinned) ...[
                      const SizedBox(width: 8),
                      const Icon(Icons.push_pin, size: 20),
                    ],
                  ],
                ),
                const SizedBox(height: 8),

                // 2. Body text: at most 3 lines
                Text(
                  body,
                  style: theme.textTheme.bodyMedium,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),

                // 3. Bottom row: wrapping tags on left, date on right
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: [
                          for (final tag in tags)
                            Chip(
                              label: Text(tag),
                              visualDensity: VisualDensity.compact,
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      editedLabel(edited),
                      style: theme.textTheme.labelSmall,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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

/// The date line of the card: 'Edited 14 Oct' for 14 October.
String editedLabel(DateTime date) =>
    'Edited ${date.day} ${_months[date.month - 1]}';

/// A small app that shows two sample cards in a list.
class NoteCardPreview extends StatelessWidget {
  const NoteCardPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NoteCard preview',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF00695C),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('NoteCard preview')),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            NoteCard(
              title: 'Shopping list for the field trip to Debre Libanos',
              body:
                  'Bread, water, two notebooks, the printed map and a '
                  'torch. Ask Abebe whether the bus leaves at seven or at '
                  'half past seven, and whether we need to bring our '
                  'student cards.',
              edited: DateTime(2026, 10, 14),
              tags: const ['trip', 'shopping', 'week 3', 'remember'],
              pinned: true,
            ),
            NoteCard(
              title: 'Layout',
              body: 'Constraints go down, sizes go up.',
              edited: DateTime(2026, 10, 2),
            ),
          ],
        ),
      ),
    );
  }
}
