class Chat {
  String model;
  String prompt;
  double temperature;
  int max_tokens;
  int top_p;
  double frequency_penalty;
  double presence_penalty;
  List<String> stop = [];

  Chat({
    this.model,
    this.prompt,
    this.temperature,
    this.max_tokens,
    this.top_p,
    this.frequency_penalty,
    this.presence_penalty,
    this.stop,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['model'] = model;
    data['prompt'] = prompt;
    data['temperature'] = temperature;
    data['max_tokens'] = max_tokens;
    data['top_p'] = top_p;
    data['frequency_penalty'] = frequency_penalty;
    data['presence_penalty'] = presence_penalty;
    data['stop'] = stop;
    return data;
  }
}
