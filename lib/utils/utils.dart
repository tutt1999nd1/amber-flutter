import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Utils {
  static Future<bool> checkToken() async {
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
}
