import 'package:flutter/material.dart';

/// A widget that prints every lifecycle callback so you can watch the
/// StatefulWidget lifecycle in the console.
class LifecycleLogger extends StatefulWidget {
  const LifecycleLogger({required this.label, super.key});

  final String label;

  @override
  State<LifecycleLogger> createState() => _LifecycleLoggerState();
}

class _LifecycleLoggerState extends State<LifecycleLogger> {
  int _buildCount = 0;

  @override
  void initState() {
    super.initState(); // super.initState() first!
    debugPrint('[LifecycleLogger] initState (${widget.label})');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint('[LifecycleLogger] didChangeDependencies');
  }

  @override
  void didUpdateWidget(LifecycleLogger oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint(
      '[LifecycleLogger] didUpdateWidget (${oldWidget.label} → ${widget.label})',
    );
  }

  @override
  Widget build(BuildContext context) {
    _buildCount++;
    debugPrint('[LifecycleLogger] build');
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text('${widget.label} — built $_buildCount time(s)'),
      ),
    );
  }

  @override
  void dispose() {
    debugPrint('[LifecycleLogger] dispose');
    super.dispose(); // super.dispose() last!
  }
}
