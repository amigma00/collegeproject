import 'package:collegeproject/View/Drawer%20Pages/profile.dart';
import 'package:collegeproject/utilities/auth.dart';
import 'package:collegeproject/utilities/list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:collegeproject/View/Drawer Pages/profile.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class DD extends StatefulWidget {
  const DD({Key? key}) : super(key: key);

  @override
  _DDState createState() => _DDState();
}

class _DDState extends State<DD> {
  final user = FirebaseAuth.instance.currentUser!;
  bool state = false;
  bool darkThemeEnabled = true;
  String dropdownvalue = "Hospitals";

  // var items = [
  //   'Hospitals',
  //   'Shops',
  // ];

  @override
  Widget build(BuildContext context) {
    var W = context.safePercentWidth;
    var H = context.safePercentHeight;
    // ignore: non_constant_identifier_names

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.red,
        title: Text("Catalog"),
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(
                          backgroundImage: NetworkImage(user.photoURL!)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      user.displayName!,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    Text(
                      user.email!,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              //onTap: () => widget.onTap(context, 0),
            ),
            ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                }),
            ListTile(
              leading: Icon(Icons.dark_mode),
              title: Text('Dark Mode'),
              // onTap: () => onTap(context, 2),
              trailing: Switch(
                value: darkThemeEnabled,
                onChanged: (changedTheme) {
                  setState(() {
                    darkThemeEnabled = changedTheme;
                  });
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              //onTap: () => widget.onTap(context, 2),
            ),
            Divider(
              height: 1,
            ),
            ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Logout'),
                onTap: () {
                  final provider =
                      Provider.of<Authorization>(context, listen: false);
                  provider.logout();
                }),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(H * 2),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: dropdownvalue,
              isExpanded: true,
              items: <String>['Hospitals', 'Shops']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, textAlign: TextAlign.center),
                );
              }).toList(),
              //hint: "Please Choose an Option".text.bold.make(),
              onChanged: (String? value) {
                setState(() {
                  dropdownvalue = value!;
                });
              },
            ),
            dropdownvalue == "Hospitals"
                ? Expanded(
                    child: ListView.builder(
                        itemCount: ok.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Card(
                              elevation: 5,
                              //color: Colors.grey,
                              //margin: EdgeInsets.all(10),
                              child: Container(
                                padding: EdgeInsets.all(W * 2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            "ABC Hospital".text.xl2.bold.make(),
                                            Row(
                                              children: [
                                                "Available Beds : ".text.make(),
                                                "34".text.green400.make(),
                                              ],
                                            ),
                                            HeightBox(20),
                                            Row(
                                              children: [
                                                IconButton(
                                                    onPressed: () {},
                                                    icon:
                                                        Icon(Icons.directions)),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(Icons.phone)),
                                              ],
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                "Status : ".text.make(),
                                                if (state == true)
                                                  "On".text.green400.bold.make()
                                                else
                                                  "Off".text.red400.bold.make(),
                                              ],
                                            ),
                                            HeightBox(10),
                                            ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              child: Image.asset(
                                                "assets/logos/download.jfif",
                                                scale: 2,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  )
            //hospital
                : Expanded(
                    child: ListView.builder(
                        itemCount: ok.length,
                        itemBuilder: (context, index) {
                          return Container(
                            child: Card(
                              elevation: 5,
                              //color: Colors.grey,
                              //margin: EdgeInsets.all(10),
                              child: Container(
                                padding: EdgeInsets.all(W * 2),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            "Grocery Shop".text.xl2.bold.make(),
                                            // Row(
                                            //   children: [
                                            //     "Available Beds : ".text.make(),
                                            //     "34".text.green400.make(),
                                            //   ],
                                            // ),
                                            HeightBox(20),
                                            Row(
                                              children: [
                                                IconButton(
                                                    onPressed: () {},
                                                    icon:
                                                        Icon(Icons.directions)),
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(Icons.phone)),
                                              ],
                                            )
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                "Status : ".text.make(),
                                                if (state == true)
                                                  "On".text.green400.bold.make()
                                                else
                                                  "Off".text.red400.bold.make(),
                                              ],
                                            ),
                                            HeightBox(10),
                                            ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10)),
                                              child: Image.asset(
                                                "assets/logos/grocery.jpg",
                                                scale: 2,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  )
            //shop
          ],
        ),
      ),
    );
  }
}
