part of 'http.dart';

void _printLogs(Map<String, dynamic> logs, StackTrace? stackTrace) {
  if (kDebugMode && stackTrace != null) log(const JsonEncoder.withIndent('    ').convert(logs), stackTrace: stackTrace);
  // if (kDebugMode) log(const JsonEncoder.withIndent('    ').convert(logs), stackTrace: stackTrace);
}
