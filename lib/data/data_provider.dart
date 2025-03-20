import 'package:flutter/material.dart';
import 'package:meto_aleka/data/database_helper.dart';

class dataProvider with ChangeNotifier {
  List<Map> _data =[];
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map> get data {
    return _data ;
  }

  List<Map> _debutData = [];

  List<Map> get debutData {
    return _debutData ;
  }

  Future<void> addData(Map newData)async {
    //_data.add(newData);
    final name = newData['name'];
    final dept = newData['department'];
   await _dbHelper.insertUser(name, dept);
    print(newData['name']);
    getData();
    notifyListeners();
  }
  Future<void> addDebutData(Map newDebut) async{

    await _dbHelper.insertDebut(newDebut['user_id'], newDebut['reason'], newDebut['amount_of_debut'], newDebut['date']);
     getDebutData(newDebut['user_id']);
    notifyListeners();
  }
  Future<void> getData()async {
    var users = await _dbHelper.getUsers();
    print(users);
    _data = users;
    //print(data);
    notifyListeners();
  }

  Future<void> getDebutData(int userId) async{
    var userDebut = await _dbHelper.getUsersDebut(userId);

    _debutData = userDebut;
     print(_debutData);

    notifyListeners();
  }
}
