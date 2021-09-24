import 'package:collegeproject/View/info.dart';
import 'package:collegeproject/View/login_screen.dart';
import 'package:collegeproject/utilities/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  bool darkThemeEnabled = false;

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => Authorization(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: darkThemeEnabled ? ThemeData.dark() : ThemeData.light(),
        home: LoginScreen(),
      ));

// ignore: non_constant_identifier_names

}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return Center(
                  child: CircularProgressIndicator(),
                );
              else if (snapshot.hasData)
                return Info();
              else if (snapshot.hasError)
                return Center(
                  child: Text('Something Went Wrong'),
                );
              else
                return LoginScreen();
            }));
  }
}
