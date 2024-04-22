import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:global_services_mobile/core/models/activities_model.dart';
import 'package:global_services_mobile/core/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as http;

class Api {
  static const serviceEndpoint =
      'https://1u4tmo572i.execute-api.eu-west-2.amazonaws.com/dev/';

  var client = http.Client();
  final ioClient = HttpClient();

  Api() {
    ioClient.connectionTimeout = const Duration(seconds: 2);
    client = http.IOClient(ioClient);
  }

  Future<void> uploadImage(Uint8List bytes, String randomString,
      String fileType, String localUser) async {
    String pipeSeperator = "_";
    try {
      final fileName =
          '${localUser.trim()}$pipeSeperator$randomString.$fileType'; // Construct the file name

      Uri uri = Uri.parse(
          '$serviceEndpoint/sentiment-upload-bucket/${Uri.encodeComponent(fileName)}');

      final response = await http.put(
        uri,
        body: bytes,
        headers: {
          'Content-Type': 'image/$fileType',
          'x-api-key': 'mvtOF0C0QJ65CoOKhVrdcanmWHR5aQo96I9fxTwx',
        },
      );

      if (response.statusCode == 200) {
        print('Image uploaded successfully');
      } else {
        print('Failed to upload image: ${response.reasonPhrase}');
      }
    } on SocketException catch (e) {
      throw Exception('Connection Error: $e');
    } on TimeoutException catch (e) {
      throw Exception('Timeout Error: $e');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<List<ActivitiesModel>> fetchActivities(String user) async {
    final uri = Uri.parse('$serviceEndpoint/activities/$user');

    try {
      final response = await http.get(
        uri,
        headers: {
          'x-api-key': 'mvtOF0C0QJ65CoOKhVrdcanmWHR5aQo96I9fxTwx',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> parsed = json.decode(response.body);
        List<ActivitiesModel> activities =
            parsed.map((option) => ActivitiesModel.fromJson(option)).toList();

        // Sort activities by date in descending order
        activities.sort((a, b) =>
            DateTime.parse(b.date!).compareTo(DateTime.parse(a.date!)));

        return activities;
      } else {
        throw HttpException(
            'Failed to load activities: ${response.statusCode}');
      }
    } on SocketException catch (e) {
      throw Exception('Connection Error: $e');
    } on TimeoutException catch (e) {
      throw Exception('Timeout Error: $e');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Map<String, String> _buildHeaders() {
    var headers = {
      "Accept": "application/json",
      'Content-type': 'application/json',
    };
    return headers;
  }
}
