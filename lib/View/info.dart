import 'package:collegeproject/utilities/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'MainPage.dart';


class Info extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             //TextField
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
                child: Text("Save"),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                }),
            Text(
              'Logged In',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),

          ],
        ),
      ),
    );
  }
}
