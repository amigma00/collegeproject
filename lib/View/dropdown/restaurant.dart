import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Restaurant extends StatelessWidget {
  const Restaurant({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var W = context.safePercentWidth;
    var H = context.safePercentHeight;
    return Expanded(
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            var state = true;
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("NAME").text.xl2.bold.make(),
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
                                      icon: Icon(Icons.directions)),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                child: Image.asset(
                                  "assets/logos/grocery.jpg",
                                  scale: 2,
                                  height: H * 20,
                                  width: W * 20,
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
    );
  }
}