import 'package:collegeproject/View/Drawer%20Pages/profile.dart';
import 'package:flutter/material.dart';
import 'package:collegeproject/View/Drawer Pages/profile.dart';

class DD extends StatefulWidget {
  const DD({Key? key}) : super(key: key);

  @override
  _DDState createState() => _DDState();
}

class _DDState extends State<DD> {
  bool darkThemeEnabled = true;
  String dropdownvalue = 'Hospitals';
  var items = [
    'Hospitals',
    'Restaurants',
    'Pharmaceuticals',
    'Customer Service Centres'
  ];

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final imageUrl = "";

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.red,
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButton(
                isExpanded: true,
                items: items.map((itemsname) {
                  return DropdownMenuItem(
                    value: itemsname,
                    child: Text(itemsname, textAlign: TextAlign.center),
                  );
                }).toList(),
                onChanged: (newValue) {},
                value: dropdownvalue,
              )
            ],
          ),
        ),
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
                    backgroundImage: AssetImage('images/user_5.png')),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Ankita Umredkar',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                'aaumredkar@gmail.com',
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
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile())
          );
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
          //onTap: () => widget.onTap(context, 0),
        ),
        ],
      ),
    ),);
  }
}