import 'package:flutter/material.dart';


class detailScreen extends StatelessWidget {
  static final route_name = 'detail_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios_outlined)),
            Center(
              child: Text('leee'),
            ),
          ],
        ),
      ),
    );
  }
}
