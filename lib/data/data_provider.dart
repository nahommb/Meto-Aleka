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

  late int total_debute = 0;

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

    _data = List.from(users.reversed);
    //print(data);
    notifyListeners();
  }

  Future<void> getDebutData(int userId) async{
    var userDebut = await _dbHelper.getUsersDebut(userId);

    _debutData = List.from(userDebut.reversed);

     var totalDeboute = 0  ;
   // print(userDebut[1]['amount_of_debut']+totalDeboute);
    for(int i=0;i<userDebut.length;i++){
     totalDeboute = totalDeboute + int.parse(userDebut[i]['amount_of_debut'].toString());

    }

    total_debute = totalDeboute;
    // print(totalDeboute);
    //  print(_debutData);

    notifyListeners();
  }

  Future<void>deleteUsers(int userId) async{
    await _dbHelper.deleteUser(5);
    getData();
    notifyListeners();
  }

  Future<void>deleteDebut(int userId,int debutId) async{
  print(userId);
    await _dbHelper.deleteDebut(debutId);
    getDebutData(userId);
    notifyListeners();
  }
}
