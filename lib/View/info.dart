import 'package:collegeproject/utilities/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dd.dart';


class Info extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                }),
            Text(
              'Logged In',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 8),
            // CircleAvatar(
            //   maxRadius: 25,
            //   backgroundImage: NetworkImage(user.photoURL!),
            // ),
            // SizedBox(height: 8),
            // Text(
            //   'Name: ' + user.displayName!),
            //
            // SizedBox(height: 8),
            // Text(
            //   'Email: ' + user.email),

            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                final provider =
                Provider.of<Authorization>(context, listen: false);
                provider.logout();
              },
              child: Text('Logout'),
            )
          ],
        ), //Column
      ),
    );
  }
}
