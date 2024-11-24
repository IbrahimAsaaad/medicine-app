import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
   String text;
   IconData icon;
     InfoCard({super.key,
      required this.icon,
      required this.text
    });
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      child: Card(
        color: Colors.white70,
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
        child: ListTile(
          leading: Icon(
            icon,
            color: Colors.blue.shade300,
          ),
          title: Text(
            text,
            style:  TextStyle(
              color: Colors.blue.shade300,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
