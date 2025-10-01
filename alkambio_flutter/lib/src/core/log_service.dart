import 'package:flutter/material.dart';

class LogMessage {
  final String message;
  final DateTime timestamp;

  LogMessage(this.message) : timestamp = DateTime.now();
}

class LogService {
  final List<LogMessage> _logs = [];

  List<LogMessage> get logs => _logs;

  void log(String message) {
    _logs.add(LogMessage(message));
  }

  void clear() {
    _logs.clear();
  }
}
