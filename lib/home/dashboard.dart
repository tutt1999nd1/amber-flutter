import 'package:flutter/material.dart';

import '../authentication/constants/constants.dart';
import '../authentication/signin.dart';
import 'account_page.dart';
import 'bussiness_page.dart';
import 'home_page.dart';
import 'package:showcaseview/showcaseview.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    BusinessPage(),
    AccountPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard',),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        shadowColor: Colors.white.withOpacity(.5),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.black
              ),
              child: Icon(Icons.person_sharp,
                color: kPrimaryColor,
                size: 150,
              ),),
            // ListTile(
            //   title: Text('Profile'),
            //   onTap: (){
            //     // Navigator.push(
            //     //   context,
            //     //   MaterialPageRoute(builder: (context) => ProfileScreen()),
            //     // );
            //   },
            // ),
            ListTile(
              title: Text('Log Out'),
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              },
            )
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Me',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );

  }
}
