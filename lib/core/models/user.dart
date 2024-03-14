import 'package:global_services_mobile/core/enums/social_enum.dart';

class User {
  int? userId;
  String? emailAddress;
  String? name;
  String? imageUrl;
  dynamic socialNetwork;

  User(
      {this.userId,
      this.socialNetwork,
      this.emailAddress,
      this.name,
      this.imageUrl});

  User.fromJson(dynamic json) {
    emailAddress = json['emailAddress'];
    socialNetwork = json['socialNetwork'];
    emailAddress = json['emailAddress'];
    imageUrl = json['imageUrl'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['emailAddress'] = emailAddress!;
    data['name'] = name!;
    data['socialNetwork'] = socialNetwork;
    data['imageUrl'] = imageUrl!;

    return data;
  }
}
