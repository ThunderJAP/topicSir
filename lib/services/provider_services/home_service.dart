import 'package:flutter/cupertino.dart';

class HomeService extends ChangeNotifier{
  int pageIndex=0;

 void setPageIndex(int index){
   pageIndex =index;
   notifyListeners();
 }
}