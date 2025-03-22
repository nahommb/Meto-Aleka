import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:meto_aleka/data/data_provider.dart';
import 'package:provider/provider.dart';

class listOfEvents extends StatefulWidget {

  final id ;
  listOfEvents(this.id);

  @override
  State<listOfEvents> createState() => _listOfEventsState();
}

class _listOfEventsState extends State<listOfEvents> {
  String formattedDate = DateFormat('d MMM yyyy').format(DateTime.now());

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final data_list = Provider.of<dataProvider>(context, listen: false);
      data_list.getDebutData(widget.id);
    });
  }


  Widget build(BuildContext context) {

    final data_provider = Provider.of<dataProvider>(context);

    return Expanded(
        child:Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.only(left: 10),

          child: ListView.builder(itemBuilder: (context,index)=>
              Dismissible(
                background: Container(padding: EdgeInsets.only(right: 20), color: Colors.red,child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.delete,),
                  ],
                ),),
                onDismissed: (direction) {
                  data_provider.deleteDebut(data_provider.debutData[index]['user_id'], data_provider.debutData[index]['id']);
                  // data_provider.data.removeWhere((element) => element['id']==data_provider.debutData[index]['user_id'],);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        backgroundColor: Colors.transparent,
                        showCloseIcon: true,
                        closeIconColor: Colors.white,
                        // behavior: SnackBarBehavior.floating,
                        duration: Duration(seconds: 2000),
                        content: Text('Debut Deleted Successfully',style: TextStyle(color: Colors.white),),
                    ),
                  );

                },
                key: Key(data_provider.debutData[index]['id'].toString()),
                child: ListTile(
                  title: Text('${data_provider.debutData[index]['reason']}'),
                  subtitle: Text(formattedDate),
                  trailing: Text('${data_provider.debutData[index]['amount_of_debut']}'),
                  onLongPress: (){
                    print('test press');
                  },
                ),
              ),
            itemCount: data_provider.debutData.length,
          ),
        )
    );
  }
}
