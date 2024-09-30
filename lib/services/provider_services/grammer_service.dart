import 'package:flutter/cupertino.dart';
import 'package:topik_sir/models/api_response_models/grammar_model.dart';

import '../api_services/api_provider.dart';

class GrammarService extends ChangeNotifier{
  final api = ApiProvider();
  int page = 0;
  int limit = 20;
  String lang = "en";

  Future<List<GrammarData>> fetchGrammarData() async {
    try {
      List<GrammarData> grammarDataList = [];
      var response = await api.getGrammar( page, limit);
      GrammarModel grammarResponse = GrammarModel.fromJson(response);
      if (grammarResponse.success == true) {
        for (var element in grammarResponse.data) {
          grammarDataList.add(element);
        }
        return grammarDataList;
      } else {
        return grammarDataList;
      }
    } catch (e) {
      rethrow;
      //return e.toString();
    }
  }
}