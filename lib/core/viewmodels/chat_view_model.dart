import 'dart:convert';

import '../../locator.dart';
import '../enums/viewstate.dart';
import '../models/chat.dart';
import '../models/chat_error.dart';
import '../models/chat_response.dart';
import '../network/api.dart';
import 'base_view_model.dart';

class ChatViewModel extends BaseViewModel {
  String errorMessage;
  final Api _api = locator<Api>();

  Future<ChatResponse> askQuestion(String question) async {
    List<String> stop = [];
    stop.add("Human:");
    stop.add("AI:");

    Chat chat = Chat();

    chat.model = "text-davinci-003";
    chat.prompt = question;
    chat.temperature = 0.9;
    chat.max_tokens = 2048;
    chat.top_p = 1;
    chat.frequency_penalty = 0.0;
    chat.presence_penalty = 0.6;
    chat.stop = stop;

    String jsonUser = jsonEncode(chat);
    print(jsonUser);

    try {
      setState(ViewState.Busy);
      ChatResponse response = await _api.getOpenApiAnswer(chat);
      print(response.choices[0].text);
      setState(ViewState.Idle);
      return response;
    } catch (e) {
      print(e);
      var error = ChatError.fromJson(json.decode(e));
      errorMessage = error.error.message;
      setState(ViewState.Idle);
      return null;
    }
  }
}
