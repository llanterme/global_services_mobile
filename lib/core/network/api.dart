import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as http;

import '../models/base_response.dart';
import '../models/chat.dart';
import '../models/chat_response.dart';
import '../models/user.dart';

class Api {
  static const serviceEndpoint = 'http://localhost:9022';

  var client = http.Client();
  final ioClient = HttpClient();

  Api() {
    ioClient.connectionTimeout = const Duration(seconds: 2);
    client = http.IOClient(ioClient);
  }

  Future<ChatResponse> getOpenApiAnswer(Chat chat) async {
    Uri uri = Uri.parse("https://api.openai.com/v1/completions");

    try {
      var response = await client.post(uri,
          headers: _buildOpenApiHeaders(), body: json.encode(chat));

      if (response.statusCode == 200) {
        print(json.decode(response.body));
        return ChatResponse.fromJson(json.decode(response.body));
      } else {
        throw response.body;
      }
    } on SocketException catch (e) {
      print(e);
    } on Exception catch (e) {
      print(e);
    }
  }

  Future<User> registerUser(User user) async {
    Uri uri = Uri.parse('$serviceEndpoint/register-user');

    try {
      var response = await client.post(uri,
          headers: _buildHeaders(), body: json.encode(user));

      if (response.statusCode == 200) {
        return User.fromJson(json.decode(response.body));
      } else {
        throw (response.body);
      }
    } on SocketException catch (e) {
      throw json.encode(_buildErrorResponse(e, "Connection Error"));
    }
  }

  BaseResponse _buildErrorResponse(Exception e, String message) {
    BaseResponse error = BaseResponse();
    error.responseCode = -1;
    error.responseMessage = message;

    return error;
  }

  Map<String, String> _buildHeaders() {
    String headerUsername = 'devutils';
    String headerPassword = r'tyme$97ital';
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$headerUsername:$headerPassword'))}';

    var headers = {
      'authorization': basicAuth,
      "Accept": "application/json",
      'Content-type': 'application/json',
    };
    return headers;
  }

  Map<String, String> _buildOpenApiHeaders() {
    var headers = {
      'authorization':
          "Bearer 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",
      "Accept": "application/json",
      'Content-type': 'application/json',
    };
    return headers;
  }
}
