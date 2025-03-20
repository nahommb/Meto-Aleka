import 'package:flutter/material.dart';

class dataProvider with ChangeNotifier {
  List<Map> _data =[];

  List<Map> get data {
    return _data ;
  }

  void addData(Map data){
    _data.add(data);

    print(data);
    notifyListeners();
  }

}