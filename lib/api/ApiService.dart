import 'dart:convert';
import 'dart:developer';

import 'package:example/model/model.dart';
import 'package:http/http.dart' as http;

import '../utils/constants.dart';


class ApiService {
  Future<Coin?> getCoin(String id) async {
    try {
      log("api");
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.price+id);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Coin _model = Coin.fromJson(json.decode(response.body));
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}