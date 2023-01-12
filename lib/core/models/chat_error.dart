class ChatError {
  Error error;

  ChatError({this.error});

  ChatError.fromJson(Map<String, dynamic> json) {
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.error != null) {
      data['error'] = this.error.toJson();
    }
    return data;
  }
}

class Error {
  String message;
  String type;
  Null param;
  Null code;

  Error({this.message, this.type, this.param, this.code});

  Error.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    type = json['type'];
    param = json['param'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['type'] = this.type;
    data['param'] = this.param;
    data['code'] = this.code;
    return data;
  }
}
