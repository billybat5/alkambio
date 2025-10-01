import 'package:flutter/material.dart';

import '../../core/log_service.dart';
import '../../injection_container.dart';

class LogScreen extends StatefulWidget {
  const LogScreen({super.key});

  @override
  _LogScreenState createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  final LogService _logService = sl<LogService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logs'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              setState(() {
                _logService.clear();
              });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _logService.logs.length,
        itemBuilder: (context, index) {
          final log = _log_service.logs[index];
          return ListTile(
            title: Text(log.message),
            subtitle: Text(log.timestamp.toIso8601String()),
          );
        },
      ),
    );
  }
}
