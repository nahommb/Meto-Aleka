import 'package:flutter/material.dart';
import 'package:meto_aleka/presentation/screens/detail.dart';
class dataList extends StatelessWidget {
  const dataList({super.key});




  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

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
          itemCount: 14,
          itemBuilder: (context, index) =>
            Container(
              decoration: BoxDecoration(
                  color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              margin: EdgeInsets.only(top: 10),
              child: ListTile(
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
      ),
    );
  }
}
