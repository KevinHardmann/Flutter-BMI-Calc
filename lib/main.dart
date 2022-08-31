import 'package:bmi_calc/theme.dart';
import 'package:flutter/material.dart';

import 'Presentation/widgets/BMIPage.dart';

//Hier verstehe ich eigentlich alles
//Arbeite dich mit STRG+Click immer durch die Widgets in dem fall dann BMIPage() dann kannst du meine Kommentare verfolgen :D
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const BMIPage(),
    );
  }
}

