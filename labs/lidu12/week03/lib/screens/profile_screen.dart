import 'package:flutter/material.dart';

/// Static profile screen.
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final orientation = MediaQuery.orientationOf(context);
    final isLandscape = orientation == Orientation.landscape;

    // 1. Header: Avatar + Name + Degree
    final header = Column(
      children: [
        const CircleAvatar(
          radius: 48,
          backgroundImage: AssetImage('assets/images/logo.png'),
        ),
        const SizedBox(height: 12),
        Text(
          'Sara Bekele',
          style: theme.textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text.rich(
          const TextSpan(
            children: [
              TextSpan(text: 'B.Sc. '),
              TextSpan(
                text: 'Computer Science',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: ' · 3rd year'),
            ],
          ),
          style: theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ],
    );

    // 2. Stats: 12 Events, 34 Notes, 3 Posts
    const stats = Row(
      children: [
        Expanded(child: _StatTile(value: '12', label: 'Events')),
        Expanded(child: _StatTile(value: '34', label: 'Notes')),
        Expanded(child: _StatTile(value: '3', label: 'Posts')),
      ],
    );

    // 3. Actions: Wrap lets buttons flow onto a second line if width is tight
    final actions = Wrap(
      spacing: 8,
      runSpacing: 8,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        FilledButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.edit),
          label: const Text('Edit profile'),
        ),
        OutlinedButton(
          onPressed: () {},
          child: const Text('Share'),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Sign out'),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.settings),
          tooltip: 'Settings',
        ),
      ],
    );

    // 4. Orientation banner with rounded corners
    final banner = Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        'Orientation: ${orientation.name}',
        style: theme.textTheme.bodyMedium,
      ),
    );

    // 5. Layout decision: Side-by-side in landscape, single column in portrait
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: isLandscape
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: header),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Column(
                      children: [
                        stats,
                        const SizedBox(height: 16),
                        actions,
                        const SizedBox(height: 16),
                        banner,
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  header,
                  const SizedBox(height: 24),
                  stats,
                  const SizedBox(height: 16),
                  actions,
                  const SizedBox(height: 16),
                  banner,
                ],
              ),
      ),
    );
  }
}

/// Helper tile for one statistic (number on top of label)
class _StatTile extends StatelessWidget {
  const _StatTile({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Text(value, style: theme.textTheme.headlineSmall),
        Text(label, style: theme.textTheme.labelMedium),
      ],
    );
  }
}
