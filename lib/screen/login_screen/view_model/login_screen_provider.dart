import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nuclei_hackathon_groot/model/login_request.dart';
import 'package:nuclei_hackathon_groot/model/login_response.dart';

class LoginScreenProvider with ChangeNotifier {
  LoginResponse loginResposne;

  bool loading = false;
  bool loginSuccess = false;

  getPostData(context, customerId, password) async {
    loading = true;
   await getUserLogin(context, customerId, password);
    loading = false;
    notifyListeners();
  }

  updateLoader() {
    loading = true;
    notifyListeners();
  }

  Future<LoginResponse> getUserLogin(context, custerId, password) async {
    LoginRequest request = LoginRequest(custId: custerId, password: password);

    print(request.toJson());

    LoginResponse result;
    try {
      print('dscsdcsdcsdc');
      final response = await http.post(
          "http://federal-creditcard.gonuclei.com/api/groot/login/fetchDetails",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(request.toJson()));

      if (response.statusCode == 200) {
        final LoginResponse item = LoginResponse.fromJson(jsonDecode(response.body));

        print(item.account.status);
        loginSuccess = true;

        loginResposne = item;
      } else {}
    } catch (e) {
      print(e);
    }
    return result;
  }
}
