import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nuclei_hackathon_groot/model/update_request.dart';

class HomeScreenProvider with ChangeNotifier {
  dynamic updateResponse;

  bool loading = false;

  getPostData(context, customerId, password) async {
    loading = true;
    updateResponse = await updateLimit(context, accountNumber, limitPerDay, status);
    loading = false;

    notifyListeners();
  }

  Future<dynamic> updateLimit(context, accountNumber, limitPerDay, status) async {
    UpdateRequest request = UpdateRequest(accountNumber: accountNumber, limitPerDay: limitPerDay, status: status);

    print(request.toJson());

    dynamic result;
    try {
      print('dscsdcsdcsdc');
      final response = await http.post(
          "http://federal-creditcard.gonuclei.com/api/groot/login/updateLimits",
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
