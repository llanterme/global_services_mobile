class BaseResponse {
  String responseMessage = "";
  int responseCode = 0;

  BaseResponse({required this.responseMessage, required this.responseCode});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    responseMessage = json['responseMessage'];
    responseCode = json['responseCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['responseMessage'] = responseMessage;
    data['responseCode'] = responseCode;

    return data;
  }
}
