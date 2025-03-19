import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meto_aleka/presentation/widgets/data_list.dart';
class homeScreen extends StatelessWidget {

  static final route_name = 'home_screen';

  String formattedDate = DateFormat('d MMM yyyy').format(DateTime.now());


  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      // appBar: AppBar(title: Text('leee'),backgroundColor: Colors.greenAccent,),
      body: SafeArea(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: screenHeight*0.07,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [

                TextButton(onPressed: (){}, child: Row(
                  children: [
                    Icon(Icons.create_outlined),
                    SizedBox(width: 5,),
                    Text('Create'),
                  ],
                )),
              ],
            ),
            Container(
             height: screenHeight*0.2,
              width: double.infinity,
              decoration: BoxDecoration(
                // color: Colors.indigo,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25))
              ),
              padding: EdgeInsets.only(top: 40,left: 20),
                child: Text(formattedDate,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)
            ),
            dataList(),
          ],
        ),
      ),
    );
  }
}
