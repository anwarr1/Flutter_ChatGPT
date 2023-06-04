import 'dart:convert';
import 'dart:developer';

import 'package:Flutter_GPT/consts/api_const.dart';
import 'package:Flutter_GPT/model/Chat.dart';
import 'package:Flutter_GPT/model/Model.dart';
import "package:http/http.dart" as http;

class ApiService {
  static Future<List<Model>> getModels() async {
    var url = "$BASE_URL/models";
    var response = await http
        .get(Uri.parse(url), headers: {"Authorization": "Bearer $key"});
    var data = jsonDecode(response.body) as Map<String, dynamic>;
    List<Model> models = [];

    for (var element in data['data']) {
      Model model = Model.fromJson(element);
      models.add(model);
    }

    return models;
  }

  static Future<List<Chat>> chat() async {
    var url = "$BASE_URL/completions";
    var response = await http.post(Uri.parse(url),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $key",
        },
        body: jsonEncode({
          "model": "ada",
          "prompt": "Flutter",
          "max_tokens": 7,
          "stop": "\n"
        }));
    Map<String, dynamic> data = jsonDecode(response.body);
    print(data);
    List<Chat> chats = [];
  
    // *******************first Method /////
    // for (var element in data['choices']) {
    //   Chat chatModel = Chat.fromJson(element);
    //   chats.add(chatModel);
    // *******************Second  Method************ /////
    chats = List.generate(data['choices'].length,
        (index) => Chat(message: data['choices'][index]['text'], chatIndex: 1));

    return chats;
  }
}
