import 'package:flutter/cupertino.dart';
import 'package:topik_sir/methods/shared_preference_methods/shared_preference_value.dart';

class DashBoardService extends ChangeNotifier{
late String name;
  Future<String> getUserName()async{
     return await SharedPreferenceValue().getValue(1, 'token');


  }

}