class User {
  int userId;
  String emailAddress;
  String name;
  String mobileNumber;
  String imageUrl;

  User(
      {this.userId,
      this.emailAddress,
      this.name,
      this.mobileNumber,
      this.imageUrl});

  User.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    emailAddress = json['emailAddress'];
    name = json['name'];
    mobileNumber = json['mobileNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['emailAddress'] = emailAddress;
    data['name'] = name;
    data['mobileNumber'] = mobileNumber;
    return data;
  }
}
