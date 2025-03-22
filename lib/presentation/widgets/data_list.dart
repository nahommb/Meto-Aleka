import 'package:flutter/material.dart';
import 'package:meto_aleka/data/data_provider.dart';
import 'package:meto_aleka/presentation/screens/detail.dart';
import 'package:provider/provider.dart';
class dataList extends StatefulWidget {
  const dataList({super.key});

  @override
  State<dataList> createState() => _dataListState();
}

class _dataListState extends State<dataList> {

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final data_list = Provider.of<dataProvider>(context, listen: false);
      data_list.getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final data_list = Provider.of<dataProvider>(context);

    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 0,left: 10,right: 10),
        height: screenHeight*0.6,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF601FF1), Colors.black], // Gradient colors
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),

        child: ListView.builder(
          itemCount: data_list.data.length,
          itemBuilder: (context, index) =>

            Container(

              decoration: BoxDecoration(
                  color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              margin: EdgeInsets.only(top: 10),
              child: ListTile(

                title: Text('${data_list.data[index]['name']}'),
                subtitle: Text('${data_list.data[index]['department']}'),
                trailing: IconButton(onPressed: (){
                  print('leeee');

                  data_list.deleteUsers(data_list.data[index]['id']);
                }, icon: Icon(Icons.delete)),
                onTap: (){
                  Navigator.pushNamed(context, detailScreen.route_name, arguments: {
                    'id': data_list.data[index]['id'],
                    'name':data_list.data[index]['name']
                  });
                },
              ),
            ),
        ),
      ),
    );
  }
}
