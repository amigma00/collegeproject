import 'package:collegeproject/View/Drawer.dart';
import 'package:collegeproject/View/dropdown/hospital.dart';
import 'package:collegeproject/View/dropdown/shop.dart';
import 'package:collegeproject/View/dropdown/welcome.dart';
import 'package:collegeproject/utilities/list.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool state = false;
  String dropdownvalue = "Please Select an Option";

  @override
  Widget build(BuildContext context) {
    var W = context.safePercentWidth;
    var H = context.safePercentHeight;

    return Scaffold(
      appBar: AppBar(
        title: "Home".text.make(),
      ),
      drawer: Draw(),
      body: Container(
        padding: EdgeInsets.all(H * 2),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButton<String>(
              value: dropdownvalue,
              isExpanded: true,
              items: <String>['Please Select an Option', 'Hospitals', 'Shops']
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
            if (dropdownvalue == "Shops")
              Shop()
            else if (dropdownvalue == "Hospitals")
              Hospital()
            else
              Welcome()
            //shop
          ],
        ),
      ),
    );
  }
}
