// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:example/authentication/signup.dart';
import 'package:example/home/home_page.dart';
import 'package:flutter/material.dart';
import '../home/dashboard.dart';
import 'constants/constants.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("../../assets/background.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Image.asset('../../assets/logo.png', width: 300),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Email',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: kPrimaryColor)),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  prefixIcon:
                                  Icon(Icons.account_box, color: kPrimaryColor),
                                  hintText: 'Enter the email',
                                  fillColor: kPrimaryColor,
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    const BorderSide(color: kPrimaryColor),
                                  ),
                        enabledBorder: OutlineInputBorder(
                    borderSide:
                    const BorderSide(color: kPrimaryColor),
            )
                              ),

                              style: TextStyle(color: kPrimaryColor),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Password',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: kPrimaryColor)),
                        )),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  prefixIcon:
                                  Icon(Icons.lock, color: kPrimaryColor),
                                  hintText: 'Enter the password',
                                  fillColor: kPrimaryColor,
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                    const BorderSide(color: kPrimaryColor),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide:
                                    const BorderSide(color: kPrimaryColor),
                                  )),
                              style: TextStyle(color: kPrimaryColor),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(padding: const EdgeInsets.only(bottom: 5), child:
                    ElevatedButton(
                      onPressed: () {
                        // Respond to button press
                      },
                      child: Text('Login'),
                      // style: ButtonStyle(
                      //   backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                      //
                      // ),
                      style: ElevatedButton.styleFrom(
                        primary: kPrimaryColor,
                        // backgroundColor: MaterialStateProperty.all(kPrimaryColor),
                        minimumSize: const Size.fromHeight(50), // NEW
                      ),
                    ),)
                  ],
                ),
              ),
            )
          ],
        ), /* add child content here */
      ),
      // body:
    );
  }
}
