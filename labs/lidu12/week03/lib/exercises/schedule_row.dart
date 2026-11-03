import 'package:flutter/material.dart';

class ScheduleRow extends StatelessWidget {
  const ScheduleRow({
    required this.time,
    required this.course,
    required this.room,
    super.key,
  });

  final String time;
  final String course;
  final String room;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 56,
            child: Text(time, style: theme.textTheme.labelLarge),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course,
                  style: theme.textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(room, style: theme.textTheme.bodySmall),
              ],
            ),
          ),
          const SizedBox(width: 8),
          FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              minimumSize: const Size(72, 40),
            ),
            child: const Text('Join'),
          ),
        ],
      ),
    );
  }
}
