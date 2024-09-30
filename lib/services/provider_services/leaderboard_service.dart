import 'package:flutter/cupertino.dart';
import 'package:topik_sir/models/api_response_models/leader_board_model.dart';

import '../api_services/api_provider.dart';

class LeaderBoardService extends ChangeNotifier{
  final api = ApiProvider();

  Future<List<LeaderBoardData>> fetchLeaderBoard() async {
    try {
      List<LeaderBoardData> leaderBoardDataList = [];
      var response = await api.getLeaderBoard();
      LeaderBoardModel leaderBoardResponse = LeaderBoardModel.fromJson(response);
      if (leaderBoardResponse.success == true) {
        for (var element in leaderBoardResponse.data) {
          leaderBoardDataList.add(element);
        }
        return leaderBoardDataList;
      } else {
        return leaderBoardDataList;
      }
    } catch (e) {
      rethrow;
      //return e.toString();
    }
  }
}