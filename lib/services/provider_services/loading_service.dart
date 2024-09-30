import 'package:flutter/widgets.dart';

class LoadingService extends ChangeNotifier{
  bool isLoading=false;

  void setLoading(bool value){
    isLoading=value;
    notifyListeners();
  }
}