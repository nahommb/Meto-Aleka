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
                onDismissed: (direction) {
                  print('ducky');
                  data_provider.deleteDebut(data_provider.debutData[index]['user_id'], data_provider.debutData[index]['id']);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Debut Deleted')),
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
            // reverse: true,
            // shrinkWrap: true,
          ),
        )
    );
  }
}
