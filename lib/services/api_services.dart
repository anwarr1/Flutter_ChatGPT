import 'dart:convert';

import 'package:Flutter_GPT/consts/api_const.dart';
import 'package:Flutter_GPT/model/Model.dart';
import "package:http/http.dart" as http;

class ApiService {
  static Future<List<Model>> getModels() async {
    var url = "${BASE_URL}";
    var response = await http.get(Uri.parse(url), headers: {
      "Authorization":
          "Bearer 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"
    });
    var data = jsonDecode(response.body) as Map<String, dynamic>;
    List<Model> models = [];

    for (var element in data['data']) {
      Model model = Model.fromJson(element);
      models.add(model);
    }
    for (var element in models) {
      print(element.id);
    }
    return models;
  }
}
