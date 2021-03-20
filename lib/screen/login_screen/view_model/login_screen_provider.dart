import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nuclei_hackathon_groot/model/login_request.dart';

class LoginScreenProvider with ChangeNotifier {
  dynamic loginResposne;

  bool loading = false;

  getPostData(context, customerId, password) async {
    loading = true;
    loginResposne = await getUserLogin(context, customerId, password);
    loading = false;

    notifyListeners();
  }

  Future<dynamic> getUserLogin(context, custerId, password) async {
    LoginRequest request = LoginRequest(custId: custerId, password: password);

    print(request.toJson());

    dynamic result;
    try {
      print('dscsdcsdcsdc');
      final response = await http.post(
          "http://federal-creditcard.gonuclei.com/api/groot/login/fetchDetails",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
            body: jsonEncode(request.toJson())
          );
      print('acadscsdcsdcsdcsdcsdc $response');

      print(response.body);

      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        print(item);
        // result = PostModel.fromJson(item);
      } else {}
    } catch (e) {
      print(e);
    }
    return result;
  }
}
