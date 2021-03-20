import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nuclei_hackathon_groot/model/payment_request.dart';

class UpiScreenProvider with ChangeNotifier {
  dynamic paymentResponse;

  bool loading = false;

  getPostData(context, customerId, password) async {
    loading = true;
    paymentResponse = await initiatePay(context, customerId, userType, pin, amount, upiId);
    loading = false;

    notifyListeners();
  }

  Future<dynamic> initiatePay(context, customerId, userType, pin, amount, upiId) async {
    PaymentRequest request = PaymentRequest(customerId: customerId,userType: userType,pin: pin,amount: amount,upiId: upiId);

    print(request.toJson());

    dynamic result;
    try {
      print('dscsdcsdcsdc');
      final response = await http.post(
          "http://federal-creditcard.gonuclei.com/api/groot/payment/initiate",
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
