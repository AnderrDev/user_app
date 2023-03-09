import 'dart:convert';
import 'package:http/http.dart' as http;

// ignore: constant_identifier_names
const String API_URL = 'http://54.156.128.171:3000/';

class ApiResponse {
  final int status;
  final dynamic data;

  ApiResponse({required this.status, required this.data});
}

class ApiService {
  static Future<ApiResponse> getHttp(
    String endpoint, {
    // ignore: unnecessary_question_mark
    dynamic? filter,
    bool? count,
    String? token,
  }) async {
    String url = API_URL + endpoint;

    if (count != null && count) {
      url += '/count';
    }
    if (filter != null) {
      // encode filter for url
      filter = jsonEncode(filter);
      url += '?filter=$filter';
    }
    try {
      if (token != null) {
        final response = await http.get(
          Uri.parse(url),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        );
        return ApiResponse(
          status: response.statusCode,
          data: response.body,
        );
      } else {
        final response = await http.get(
          Uri.parse(url),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'accept': 'application/json',
          },
        );
        return ApiResponse(status: response.statusCode, data: response.body);
      }
    } catch (e) {
      return ApiResponse(status: 500, data: e.toString());
    }
  }

  static Future<ApiResponse> postHttp(String endpoint, dynamic body,
      {String? token}) async {
    String url = API_URL + endpoint;
    try {
      if (token != null) {
        final response = await http.post(
          Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
          body: body,
        );
        return ApiResponse(status: response.statusCode, data: response.body);
      } else {
        final response = await http.post(
          Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'accept': 'application/json',
          },
          body: body,
        );
        return ApiResponse(status: response.statusCode, data: response.body);
      }
    } catch (e) {
      return ApiResponse(status: 500, data: e.toString());
    }
  }

  static deleteHttp(String table, String id, {String? token}) async {
    String url = '$API_URL$table/$id';
    try {
      if (token != null) {
        final response =
            await http.delete(Uri.parse(url), headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
        return ApiResponse(status: response.statusCode, data: response.body);
      } else {
        final response =
            await http.delete(Uri.parse(url), headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'accept': 'application/json',
        });
        return ApiResponse(status: response.statusCode, data: response.body);
      }
    } catch (e) {
      return ApiResponse(status: 500, data: e.toString());
    }
  }
}
