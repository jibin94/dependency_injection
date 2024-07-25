import 'package:flutter/material.dart';

class LoggerService {
  void log(String message) {
    final timestamp = DateTime.now().toIso8601String();
    debugPrint('[$timestamp] $message');
  }

  void logRequest(String url) {
    log('Requesting: $url');
  }

  void logResponse(String url, int statusCode, String responseBody) {
    log('Response from $url: [Status Code: $statusCode] $responseBody');
  }
}
