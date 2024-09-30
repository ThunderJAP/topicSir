import 'package:flutter/cupertino.dart';

import '../../models/api_response_models/video_model.dart';
import '../api_services/api_provider.dart';

class VideoService extends ChangeNotifier{

  final api = ApiProvider();

  Future<List<VideoData>> fetchVideos() async {
    try {
      List<VideoData> dictionaryModel = [];
      var response = await api.getVideos();
      VideoModel videoResponse = VideoModel.fromJson(response);
      if (videoResponse.success == true) {
        for (var element in videoResponse.data) {
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
}