import 'package:flutter/material.dart';
import 'package:meto_aleka/presentation/screens/detail.dart';
class dataList extends StatelessWidget {
  const dataList({super.key});




  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top: 30,left: 10),
        height: screenHeight*0.6,
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20),)
        ),
        child: ListView.builder(
          itemCount: 4,
          itemBuilder: (context, index) =>
            ListTile(
              title: Text('Nahom Lee'),
              subtitle: Text('Software'),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
              onTap: (){
                print('clicked');
                Navigator.pushNamed(context, detailScreen.route_name);
              },
            ),
        ),
      ),
    );
  }
}
