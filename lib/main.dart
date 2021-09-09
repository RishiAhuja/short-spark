import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:linkshortner/views/home.dart';
import 'package:sizer/sizer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            title: 'Link',
            theme: ThemeData(
              primarySwatch: Colors.purple,
            ),
            home: Home(),
          );
        }
    );
  }
}
