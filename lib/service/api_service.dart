import 'dart:convert';

import 'package:dependency_injection/service/logger_service.dart';
import 'package:http/http.dart' as http;

import 'locator.dart';

class ApiService {
  final String _baseUrl = 'https://reqres.in/api';
  final LoggerService _loggerService = getIt<LoggerService>();

  Future<List<dynamic>> fetchUsers() async {
    final url = '$_baseUrl/users?page=2';
    _loggerService.logRequest(url);

    final response = await http.get(Uri.parse(url));
    final responseBody = response.body;
    _loggerService.logResponse(url, response.statusCode, responseBody);

    if (response.statusCode == 200) {
      final data = json.decode(responseBody);
      return data['data'];
    } else {
      throw Exception('Failed to load users');
    }
  }
}
