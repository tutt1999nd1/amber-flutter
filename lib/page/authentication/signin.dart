// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../home/dashboard.dart';
import 'constants/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController password = new TextEditingController();
  TextEditingController email = new TextEditingController();
  final storage = new FlutterSecureStorage();
  Future<bool> signIn() async {
    print(email.text);
    print(password.text);
    if(email.text=='admin' && password.text =='123456'){
      await storage.write(key: "token", value: "abc");
      return Future<bool>.value(true);
    }
    else {
      return Future<bool>.value(false);
    }

  }

  @override
  void initState() {

    Future.delayed(Duration.zero,() async {
      var check = await checkToken();
      if(check == true){
        Navigator.push(
            context,
            MaterialPageRoute(builder: ((context) => DashBoard())));
      }

      //here is the async code, you can execute any async code here
    });
  }

  Future<bool> checkToken() async {
    final storage = new FlutterSecureStorage();
// Read value
    String? value = await storage.read(key: 'token');
    if (value == 'abc') {
      return true;
    } else
      return false;

    print(value);
    // setState(() {
    //   token = value!;
    // });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpeg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                child: Image.asset('assets/logo.png', width: 300),
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
                          child: Text('Username',
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
                              controller: email,
                              decoration: InputDecoration(
                                  prefixIcon:
                                  Icon(Icons.account_box, color: kPrimaryColor),
                                  hintText: 'Enter the username',
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
                              controller: password,
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
                      onPressed: () async {
                        // Respond to button press
                        var check = await signIn();
                        if(check == true){
                          EasyLoading.show(

                          );
                          // EasyLoading.dismiss();
                          Future.delayed(const Duration(milliseconds: 1000), () {

// Here you can write your code
                            EasyLoading.dismiss();
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: ((context) => DashBoard())));
                            setState(() {
                              // Here you can write your code for open new view
                            });

                          });

                        }
                        else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("User account or password incorrect"),
                          ));
                        }
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
