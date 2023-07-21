import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/serviceDemo/serviceView.dart';
import 'package:flutter_full_learn/tabBar_widget.dart';
import 'package:flutter_full_learn/text_widget.dart';

import 'container_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
                      return MaterialApp(
                        title: 'Flutter Demo',
                        theme: ThemeData(
        primarySwatch: Colors.blue,
      ).copyWith(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          systemOverlayStyle: SystemUiOverlayStyle.light
        ),
        
      ),
      home: const ServiceView(),
    );
  }
}
