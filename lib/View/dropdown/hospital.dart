import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Hospital extends StatefulWidget {
  const Hospital({Key? key}) : super(key: key);

  @override
  _HospitalState createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> {
  @override
  Widget build(BuildContext context) {
    var W = context.safePercentWidth;
    var H = context.safePercentHeight;
    return SafeArea(
      child: Container(
        child: Card(
          margin: EdgeInsets.all(10),
          child: Container(
            padding: EdgeInsets.all(W * 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "ABC Hospital".text.xl2.bold.make(),
                    ClipRRect(
                      child: Image.asset(
                        "assets/logos/download.jfif",
                        scale: 2,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
