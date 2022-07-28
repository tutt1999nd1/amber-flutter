import 'package:flutter/material.dart';
class BusinessPage extends StatefulWidget {
  const BusinessPage({Key? key}) : super(key: key);

  @override
  State<BusinessPage> createState() => _BusinessPage();
}

class _BusinessPage extends State<BusinessPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Bussiness'),
      ),
    );
  }
}


