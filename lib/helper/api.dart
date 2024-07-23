import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, String? token}) async {
    Map<String, String> headers = {
      "Content-Type": "application/x-www-form-urlencoded",
    };
    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }

    http.Response response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode <= 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> post(
      {required String url,
      required Map<String, dynamic> body,
      String? token}) async {
    Map<String, String> headers = {
      "Content-Type": "application/x-www-form-urlencoded",
    };
    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }

    http.Response response = await http.post(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode <= 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} With body ${jsonDecode(response.body)}');
    }
  }

  Future<dynamic> put(
      {required String url,
      required Map<String, dynamic> body,
      String? token}) async {
    Map<String, String> headers = {};
    headers.addAll({
      "Content-Type": "application/x-www-form-urlencoded",
    });
    if (token != null) {
      headers.addAll({
        "Authorization": "Bearer $token",
      });
    }
    log("Url : $url , Body : $body ");
    http.Response response = await http.put(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
    if (response.statusCode <= 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      return data;
    } else {
      throw Exception(
          'there is a problem with status code ${response.statusCode} With body ${jsonDecode(response.body)}');
    }
  }
}
