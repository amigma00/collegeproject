import 'package:flutter/material.dart';

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
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text("TITLE"),
              accountEmail: Text("BODY"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
            new ListTile(
              leading: Icon(
                Icons.person,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.2,
              ),
            ),
            new ListTile(
              leading: Icon(
                Icons.favorite,
              ),
              title: Text(
                "Dark Mode",
                textScaleFactor: 1.2,
                style: TextStyle(),
              ),
              trailing: Switch(
                value: darkThemeEnabled,
                onChanged: (changedTheme) {
                  setState(() {
                    darkThemeEnabled = changedTheme;
                  });
                },
              ),
            ),
            new ListTile(
              leading: Icon(
                Icons.settings,
              ),
              title: Text(
                "Setting ",
                textScaleFactor: 1.2,
                style: TextStyle(),
              ),
            ),
            // new Divider(),
            // new ListTile(
            //   leading: Icon(Icons.close),
            //   title: Text(
            //     "Close",
            //   ),
            //   onTap: () => Navigator.of(context).pop(),
            // ),
          ],
        ),
      ),
    );
  }
}