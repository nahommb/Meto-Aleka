import 'package:flutter/material.dart';
class dataList extends StatelessWidget {
  const dataList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) =>
          ListTile(
            title: Text('Nahom Lee'),
            subtitle: Text('Software'),
            trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
          ),
      ),
    );
  }
}
