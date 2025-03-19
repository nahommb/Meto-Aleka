import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class listOfEvents extends StatelessWidget {

  String formattedDate = DateFormat('d MMM yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child:Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.only(left: 10),
          child: ListView.builder(itemBuilder: (context,index)=>
              Dismissible(
                key: Key('i8908098'),
                child: ListTile(
                  title: Text('Migb'),
                  subtitle: Text(formattedDate),
                  trailing: Text('65'),
                  onLongPress: (){
                    print('test press');
                  },
                ),
              ),
            itemCount: 10,
          ),
        )
    );
  }
}
