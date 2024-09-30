import 'package:flutter/cupertino.dart';
import 'package:topik_sir/models/api_response_models/dictionary_api_model.dart';

import '../../models/api_response_models/base_api_model.dart';
import '../api_services/api_provider.dart';

class DictionaryService extends ChangeNotifier {
  final api = ApiProvider();
  bool isSearch = false;
  String query = "";
  int page = 0;
  int limit = 20;
  String lang = "en";

  Future<List<DictionaryData>> searchDictionaryWord() async {
    try {
      List<DictionaryData> dictionaryModel = [];
      var response = await api.getDictionaryResult(query, lang, page, limit);
      DictionaryModel dictionaryResponse = DictionaryModel.fromJson(response);
      if (dictionaryResponse.success == true) {
        for (var element in dictionaryResponse.data) {
          dictionaryModel.add(element);
        }
        return dictionaryModel;
      } else {
        return dictionaryModel;
      }
    } catch (e) {
      rethrow;
      //return e.toString();
    }
  }

  void setSearch(bool val) {
    isSearch = val;
    notifyListeners();
  }

  void setQuery(String val) {
    query = val;
  }
}
