import 'dart:html';

import 'package:example/CustomWidget/navbar.dart';
import 'package:example/page/home/account_page.dart';
import 'package:example/page/home/bussiness_page.dart';
import 'package:example/page/home/dashboard.dart';
import 'package:example/page/home/home_page.dart';
import 'package:example/page/intro/intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String token = '';

  @override
  void initState() {
// Create storage
//     checkToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Center(
      //   child: _widgetOptions.elementAt(_selectedIndex),
      // ),
      // body: SignInScreen(),
      // body: SignInScreen(),
      // body: DashBoard(),
      // body: DashBoard(),
      body: Intro(),
    );
  }


}
