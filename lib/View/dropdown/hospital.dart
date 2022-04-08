import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collegeproject/utilities/list.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:velocity_x/velocity_x.dart';

class Hospital extends StatefulWidget {
  const Hospital({Key? key}) : super(key: key);

  @override
  _HospitalState createState() => _HospitalState();
}

class _HospitalState extends State<Hospital> {
  //late String status;
  bool state = false;

  @override
  void initState() {
    getData();
  }

  String city = " ";
  String pinCode = " ";

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      city = prefs.getString('city')!;
      pinCode = prefs.getString('pinCode')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    var W = context.safePercentWidth;
    var H = context.safePercentHeight;
    return Expanded(
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Hospital')
              .where(
                'city',
                isEqualTo: city,
              )
              .where('pincode', isEqualTo: pinCode)
              .snapshots(),
          builder: (context, hospSnapshot) {
            if (hospSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              final hospDocs = hospSnapshot.data!.docs;

              return ListView.builder(
                  itemCount: hospDocs.length,
                  itemBuilder: (context, index) {
                    Future<void> openMap(
                        double latitude, double longitude) async {
                      String googleUrl =
                          'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
                      if (await canLaunch(googleUrl)) {
                        await launch(googleUrl);
                      } else {
                        throw 'Could not open the map.';
                      }
                    }

                    Future<void> _makePhoneCall(String url) async {
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    }

                    var k = hospDocs[index]['phoneno'];
                    bool ok = hospDocs[index]['status'];
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(hospDocs[index]['name'])
                                          .text
                                          .xl2
                                          .bold
                                          .make(),
                                      Row(
                                        children: [
                                          "Available Beds : ".text.make(),
                                          Text(hospDocs[index]['beds'])
                                              .text
                                              .green400
                                              .make(),
                                        ],
                                      ),
                                      HeightBox(20),
                                      Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                openMap(
                                                    hospDocs[index]['latitude'],
                                                    hospDocs[index]
                                                        ['longitude']);
                                              },
                                              icon: Icon(Icons.directions)),
                                          IconButton(
                                              onPressed: () {
                                                _makePhoneCall('tel:+91$k');
                                              },
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
                                          if (state == ok)
                                            "Off".text.red400.bold.make()
                                          else
                                            "On".text.green400.bold.make()
                                        ],
                                      ),
                                      HeightBox(10),
                                      hospDocs[index]['piclink']!=null
                                          ?ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        child: Image.network(
                                          hospDocs[index]['piclink'],
                                          scale: 2,
                                          height: H*20,
                                          width: W*20,
                                        ),
                                      ):ClipRRect(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        child: Image.asset(
                                          "assets/logos/download.jfif",
                                          scale: 2,
                                          height: H*20,
                                          width: W*20,
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
                  });
            }
          }),
    );
  }
}
