import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_clone/resources/auth_methods.dart';
import 'package:zoom_clone/screens/home_screen.dart';
import 'package:zoom_clone/screens/login_screen.dart';

import 'package:zoom_clone/utils/colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zoom App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor
      ),


        home:  StreamBuilder(

        stream: AuthMethods().authChnages,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){


            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.hasData){


            return HomeScreen();
          }else{
            return LoginScreen();

          }

        },
      )
    );
  }
}

