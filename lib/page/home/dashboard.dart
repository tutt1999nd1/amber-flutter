import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../authentication/constants/constants.dart';
import '../authentication/signin.dart';
import 'account_page.dart';
import 'bussiness_page.dart';
import 'home_page.dart';
import 'package:showcaseview/showcaseview.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  static openTheDrawer() {
    print("tutt20");
    _scaffoldKey.currentState?.openDrawer();
  }

  final storage = new FlutterSecureStorage();
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    // List<Widget> _widgetOptions = <Widget>[
  //   HomePage(openDrawer: openTheDrawer,changeTabWallet : openTheDrawer), // BusinessPage(),
  //   AccountPage(),
  // ];
    static changeTabWallet(){

      // _onItemTapped(1)
    }
    void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: null,
      // appBar: AppBar(
      //   leading: Builder(
      //     builder: (context) => IconButton(
      //       icon: Icon(
      //         Icons.account_circle_outlined,
      //         color: Colors.amber[800],
      //       ),
      //       onPressed: () => Scaffold.of(context).openDrawer(),
      //     ),
      //   ),
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      //   // title: Text(
      //   //   "Track your Shipment",
      //   // ),
      // ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.black),
              child: Icon(
                Icons.person_sharp,
                color: kPrimaryColor,
                size: 150,
              ),
            ),
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
              onTap: () async {
                await storage.delete(key: "token");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignInScreen()));
              },
            )
          ],
        ),
      ),
      body: Center(
        child: _selectedIndex==0?HomePage(openDrawer: openTheDrawer,changeTabWallet : _onItemTapped):AccountPage(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.assessment, size: 30),
            label: '',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.business,size: 30),
          //   label: '',
          // ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wallet_outlined,
              size: 30,
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
