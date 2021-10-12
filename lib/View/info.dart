import 'package:flutter/material.dart';

import 'dd.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                  hintText: "Your Name",
                  labelText: "Name",
                  labelStyle:
                      TextStyle(fontSize: 24, color: Colors.black), //TextSytyle
                  border: OutlineInputBorder()), //InputDecoration
            ), //TextField
            SizedBox(
              height: 16,
            ), //SizedBox
            TextField(
              decoration: InputDecoration(
                  hintText: "Location",
                  labelText: "City",
                  labelStyle:
                      TextStyle(fontSize: 24, color: Colors.black), //TextSytyle
                  border: OutlineInputBorder()), //InputDecoration
            ),
            SizedBox(
              height: 16,
            ),
            TextField(
              decoration: InputDecoration(
                  hintText: "Location1",
                  labelText: "Pin Code",
                  labelStyle:
                  TextStyle(fontSize: 24, color: Colors.black), //TextSytyle
                  border: OutlineInputBorder()), //InputDecoration
            ),
            SizedBox(
              height: 16,
            ),
            MaterialButton(
                color: Colors.red,
                child: Text("NEXT"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DD()),
                  );
                }) //TextField
          ],
        ), //Column
      );
  }
}
