import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nuclei_hackathon_groot/model/payment_request.dart';
import 'package:nuclei_hackathon_groot/model/payment_response.dart';

class UpiScreenProvider with ChangeNotifier {
  PaymentResponse paymentResponse;

  bool loading = false;
  bool success;

  getPostData(context, upiId, amount, customerId, userType, pin) async {
    loading = true;
    await initiatePay(context, customerId, userType, pin, amount, upiId);
    loading = false;

    notifyListeners();
  }

  Future<PaymentResponse> initiatePay(
      context, customerId, userType, pin, amount, upiId) async {
    PaymentRequest request = PaymentRequest(
        customerId: customerId.toString(),
        userType: userType,
        pin: pin,
        amount: amount,
        upiId: upiId);

    print(request.toJson());

    dynamic result;
    try {
      final response = await http.post(
          "http://federal-creditcard.gonuclei.com/api/groot/payment/initiate",
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode(request.toJson()));
      print('acadscsdcsdcsdcsdcsdc $response');

      print(response.body);

      if (response.statusCode == 200) {
        final PaymentResponse item =
            PaymentResponse.fromJson(jsonDecode(response.body));
        print(item);
        paymentResponse = item;
        success = true;
        // result = PostModel.fromJson(item);
      } else {}
    } catch (e) {
      print(e);
    }
    return result;
  }

  updateLoader() {
    loading = true;
    notifyListeners();
  }
}
