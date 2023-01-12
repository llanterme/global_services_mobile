import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

import '../../core/enums/viewstate.dart';
import '../../core/viewmodels/chat_view_model.dart';
import 'base_view.dart';

class ChatView extends StatelessWidget {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<ChatViewModel>(
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: true,
                centerTitle: true,
                title: const Text(
                  "Chat",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15.0,
                      color: Colors.white),
                )),
            body: SingleChildScrollView(
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                  const SizedBox(height: 20),
                  model.state == ViewState.Busy
                      ? const CircularProgressIndicator()
                      : Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 15.0),
                                //  height: 50.0,
                                alignment: Alignment.centerLeft,
                                child: TextFormField(
                                    keyboardType: TextInputType.text,
                                    obscureText: false,
                                    decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'question',
                                        prefixIcon:
                                            Icon(Icons.question_answer)),
                                    controller: questionController),
                              ),
                              ButtonTheme(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  minWidth: 300.0,
                                  height: 50,
                                  child: ElevatedButton(
                                      child: const Text(
                                        'Ask Open AI',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      onPressed: () async {
                                        var chatResponse =
                                            await model.askQuestion(
                                                questionController.text);
                                        if (chatResponse != null) {
                                          answerController.text =
                                              chatResponse.choices[0].text;
                                        } else {
                                          QuickAlert.show(
                                            context: context,
                                            type: QuickAlertType.error,
                                            title: 'Oops...',
                                            text: model.errorMessage,
                                          );
                                        }
                                      })),
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 15.0),
                                  alignment: Alignment.centerLeft,
                                  child: TextField(
                                      controller: answerController,
                                      maxLines: 20,
                                      decoration: InputDecoration(
                                          border: const OutlineInputBorder()))),
                            ],
                          ),
                        )
                ])))));
  }
}
