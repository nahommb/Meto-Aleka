import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meto_aleka/data/data_provider.dart';
import 'package:meto_aleka/presentation/widgets/data_list.dart';
import 'package:provider/provider.dart';



class homeScreen extends StatelessWidget {

  static final route_name = 'home_screen';

  String formattedDate = DateFormat('d MMM yyyy').format(DateTime.now());


  void showPopupForm(BuildContext context,Function onSubmit) {
    TextEditingController nameController = TextEditingController();
    TextEditingController departmentController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Fill the Form"),

          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Name"),
              ),
              SizedBox(height: 10),
              TextField(
                controller: departmentController,
                decoration: InputDecoration(labelText: "Department"),
                keyboardType: TextInputType.emailAddress,
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

                String name = nameController.text;
                String department = departmentController.text;
               // print("Name: $name, Department: $department");
                onSubmit(name,department);
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
    double screenHeight = MediaQuery.of(context).size.height;
    var data_Provider = Provider.of<dataProvider>(context);

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

                TextButton(onPressed: (){showPopupForm(context,(String name,String department){
                  data_Provider.addData({
                    'name':name,
                    'department':department
                  });
                });}, child: Row(
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
