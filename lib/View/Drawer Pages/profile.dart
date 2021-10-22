// ignore_for_file: import_of_legacy_library_into_null_safe, unused_field

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// import 'package:image_picker/image_picker.dart';
// import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final user = FirebaseAuth.instance.currentUser!;
  late File _image;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: ListView(
          children: <Widget>[
            imageProfile(),
            SizedBox(
              height: 20,
            ),
            nameTextField(),
            SizedBox(
              height: 20,
            ),
            professionTextField(),
            SizedBox(
              height: 20,
            ),
            dobTextField(),
            SizedBox(
              height: 20,
            ),
            pincodeTextField(),
            SizedBox(
              height: 20,
            ),
            aboutcodeTextField()
          ],
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
              radius: 80.0,
              // ignore: unnecessary_null_comparison
              backgroundImage: NetworkImage(user.photoURL!)

              // ignore: unnecessary_null_comparison
              // backgroundImage: _image == null
              //     ? AssetImage('images/user_5.png')
              //     : Image.file(_image) as ImageProvider,
              ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet()),
                );
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.blue,
                size: 20.0,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          Text(
            'Choose Profile photo',
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {
                  // _imgFromCamera();
                },
                label: Text('camera'),
              ),
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  // _imgFromGallery();
                },
                label: Text('Gallery'),
              ),
            ],
          )
        ],
      ),
    );
  }

  // _imgFromCamera() async {
  //   File img = await ImagePicker.pickImage(
  //     source: ImageSource.camera,
  //   );

  //   setState(() {
  //     _image = img;
  //   });
  // }

  // _imgFromGallery() async {
  //   File img = await ImagePicker.pickImage(
  //     source: ImageSource.gallery,
  //   );

  //   setState(() {
  //     _image = img;
  //   });
  // }

  Widget nameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueAccent,
            width: 2,
          ),
        ),
        prefixIcon: Icon(
          Icons.person,
          color: Colors.blue,
        ),
        labelText: 'Name',
        helperText: "Name can't be empty",
        hintText: 'Type Your Name',
      ),
    );
  }

  Widget professionTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueAccent,
            width: 2,
          ),
        ),
        prefixIcon: Icon(
          Icons.perm_identity_outlined,
          color: Colors.blue,
        ),
        labelText: 'Profession',
        helperText: "Profession can't be empty",
        hintText: 'Your Profession',
      ),
    );
  }

  Widget dobTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueAccent,
            width: 2,
          ),
        ),
        prefixIcon: Icon(
          Icons.cake,
          color: Colors.blue,
        ),
        labelText: 'Date of Birth',
        helperText: "Provied DOB on dd/mm/yyyy",
        hintText: '07/09/2001',
      ),
    );
  }

  Widget pincodeTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueAccent,
            width: 2,
          ),
        ),
        prefixIcon: Icon(
          Icons.pin,
          color: Colors.blue,
        ),
        labelText: 'Pin Code',
        helperText: "Pincode",
        hintText: '440035',
      ),
    );
  }

  Widget aboutcodeTextField() {
    return TextFormField(
      maxLines: 4,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueAccent,
            width: 2,
          ),
        ),
        // prefixIcon: Icon(
        //   Icons.person,
        //   color: Colors.blueGrey[600],
        // ),
        labelText: 'About',
        helperText: "Write about yourself",
        hintText: 'Full stack developer',
      ),
    );
  }
}



// import 'package:flutter/material.dart';

// class Profile extends StatelessWidget {
//   const Profile({ Key? key }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Center(
//         child: Text('Profile',
//         style: TextStyle(
//           fontSize: 25,
//           fontWeight: FontWeight.w600
//         ),
//         ),
//       ),
      
//     );
//   }
// }