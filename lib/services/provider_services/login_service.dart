import 'package:flutter/foundation.dart';
import 'package:topik_sir/methods/shared_preference_methods/shared_preference_value.dart';
import 'package:topik_sir/models/api_response_models/base_api_model.dart';
import 'package:topik_sir/models/api_response_models/user_model.dart';
import 'package:topik_sir/services/api_services/api_provider.dart';

class LoginService extends ChangeNotifier {
  final api = ApiProvider();
  Future<bool> userLogin(String email, String password) async {
    try {
      var response = await api.userLogin(email, password);
      UserModel userResponse=UserModel.fromJson(response);
      if (userResponse.success == true) {
        SharedPreferenceValue().setValue(1, 'token', userResponse.data!.accessToken);
        return true;
        //SharedPreferenceValue().setValue(5, 'name', userModel.name);
      }
      else{
        return false;
      }


    } catch (e) {
      rethrow;
      //return e.toString();
    }
  }
}
