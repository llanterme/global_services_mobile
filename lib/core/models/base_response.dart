class BaseResponse {
  String responseMessage;
  int responseCode;

  BaseResponse({this.responseMessage, this.responseCode});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    responseMessage = json['responseMessage'];
    responseCode = json['responseCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['responseMessage'] = responseMessage;
    data['responseCode'] = responseCode;

    return data;
  }
}
