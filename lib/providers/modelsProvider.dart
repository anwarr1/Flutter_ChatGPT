import 'package:Flutter_GPT/model/Model.dart';
import 'package:Flutter_GPT/services/api_services.dart';
import 'package:riverpod/riverpod.dart';

class Statemodels extends StateNotifier<String> {
  Statemodels() : super("");
  String currentModel = "ada";

  void setCurrentModel(String value) {
    currentModel = value;
  }

  List<Model> models = [];
  Future<List<Model>> getModels() async {
    models = await ApiService.getModels();
    return models;
  }

  List<Model> get firstModel {
    return models;
  }
}

final currentModele =
    StateNotifierProvider<Statemodels, String>((ref) => Statemodels());
