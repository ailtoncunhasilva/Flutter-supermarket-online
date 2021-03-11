//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supermercado_ac/models/store_manager.dart';
import 'package:supermercado_ac/models/user_manager.dart';
import 'package:supermercado_ac/screens/splash_screen.dart';

void main() {
  runApp(MyApp());

  //Firestore.instance.collection('teste').add({'testt': 'teste'});
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
        ChangeNotifierProvider(
          create: (_) => StoreManager(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.purple[800],
          visualDensity: VisualDensity.adaptivePlatformDensity,
          cursorColor: Colors.purple[800],
          appBarTheme: AppBarTheme(
            elevation: 0,
          ),
          scaffoldBackgroundColor: Colors.purple[800],
        ),
        home: SplashScreen(),
      ),
    );
  }
}
