import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as http;
import '../models/profile.dart';
import '../models/user.dart';

class Api {
  static const serviceEndpoint =
      'http://payment-cluster-load-balancer-1798404675.eu-west-2.elb.amazonaws.com:8001';

  var client = http.Client();
  final ioClient = HttpClient();

  Api() {
    ioClient.connectionTimeout = const Duration(seconds: 2);
    client = http.IOClient(ioClient);
  }

  FutureOr<User> registerUser(User user) async {
    Uri uri = Uri.parse('$serviceEndpoint/register-user');

    try {
      var response = await client.post(uri, body: json.encode(user));

      if (response.statusCode == 200) {
        return User.fromJson(json.decode(response.body));
      } else {
        throw (response.body);
      }
    } on SocketException catch (e) {
      throw Exception('Connection Error: $e');
    } on TimeoutException catch (e) {
      throw Exception('Timeout Error: $e');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<Profile> getProfile(String id) async {
    Uri uri = Uri.parse('$serviceEndpoint/profile/$id');
    try {
      var response = await client.get(uri);

      if (response.statusCode == 200) {
        var parsed = json.decode(response.body);
        return Profile.fromJson(parsed);
      } else {
        throw Exception('Failed to load profile: ${response.statusCode}');
      }
    } on SocketException catch (e) {
      throw Exception('Connection Error: $e');
    } on TimeoutException catch (e) {
      throw Exception('Timeout Error: $e');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<List<Profile>> fetchProfiles() async {
    Uri uri = Uri.parse('$serviceEndpoint/profiles');
    var profileList = <Profile>[];
    try {
      var response = await client.get(uri);

      if (response.statusCode == 200) {
        var parsed = json.decode(response.body) as List<dynamic>;
        for (var option in parsed) {
          profileList.add(Profile.fromJson(option));
        }
        return profileList;
      } else {
        throw (response.body);
      }
    } on SocketException catch (e) {
      throw Exception('Connection Error: $e');
    } on TimeoutException catch (e) {
      throw Exception('Timeout Error: $e');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }
}
