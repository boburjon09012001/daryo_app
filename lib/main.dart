import 'package:daryo_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_viewmodel.dart';

void main(){
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (_) => MainViewModel(),
      )
    ], child:  MyApp()),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
