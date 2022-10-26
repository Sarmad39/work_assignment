import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './provider/products_provider.dart';
import 'screens/my_plans_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Products(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: const  Color.fromRGBO(17, 17, 17,1),
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color.fromRGBO(38, 43, 55, 1)),
          fontFamily: 'IBMPlexSans',
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 76, 223, 108),
                ),
                bodyText2: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                subtitle1: const TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ), 
        ),
        home: const MyPlanScreen(),
      ),
    );
  }
}

