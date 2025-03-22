import 'package:flutter/material.dart';
import 'package:meto_aleka/data/data_provider.dart';
import 'package:meto_aleka/presentation/widgets/list_of_events.dart';
import 'package:provider/provider.dart';

class detailScreen extends StatelessWidget {
  static final route_name = 'detail_screen';



  void showPopupForm(BuildContext context,Function onSubmit) {
    TextEditingController reasonController = TextEditingController();
    TextEditingController amountController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Fill the Form"),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: reasonController,
                decoration: InputDecoration(labelText: "Reason"),
              ),
              SizedBox(height: 10),
              TextField(
                controller: amountController,
                decoration: InputDecoration(labelText: "Amount"),
                keyboardType: TextInputType.number,
              ),

            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // Close popup
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {

                String reason = reasonController.text;
                int amount = int.parse(amountController.text);
                // print("Name: $name, Department: $department");
                onSubmit(reason,amount,'12/07/25');
                Navigator.pop(context); // Close after submission
              },
              child: Text("Submit"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic>? args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    print(args);

    var data_provider = Provider.of<dataProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(height: 10,),
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back_ios_outlined,size: 18,)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: (){
                  showPopupForm(context, (String reason,int amount,String date){
                    data_provider.addDebutData({
                      'user_id':args?['id'],
                      'reason':reason,
                      'amount_of_debut':amount,
                      'date':date
                    });
                  });
                }, child: Row(
                  children: [
                    Icon(Icons.create_outlined),
                    SizedBox(width: 5,),
                    Text('Create'),
                  ],
                )),
              ],
            ),
            Container(
              width: double.infinity,
              height: 150,
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(
                  colors: [Color(0xFF601FF1), Colors.lightBlue], // Gradient colors
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text('${args?['name']}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60.0),
                    child: Text('${data_provider.total_debute} Birr',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  )
                ],
              ),
            ),
            listOfEvents(args?['id'])
          ],
        ),
      ),
    );
  }
}
