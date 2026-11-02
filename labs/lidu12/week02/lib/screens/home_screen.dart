import 'package:campus_companion/widgets/lifecycle_logger.dart';
import 'package:flutter/material.dart';

/// Home screen.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _checkIns = 0;
  bool _showLogger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Campus Companion')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Welcome to Campus Companion'),
            Text(
              'Check-ins today: $_checkIns',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SwitchListTile(
              title: const Text('Show lifecycle logger'),
              value: _showLogger,
              onChanged: (value) => setState(() => _showLogger = value),
            ),
            if (_showLogger)
              LifecycleLogger(label: 'Check-ins: $_checkIns'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => _checkIns++),
        child: const Icon(Icons.add),
      ),
    );
  }
}
