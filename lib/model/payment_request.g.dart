// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentRequest _$PaymentRequestFromJson(Map<String, dynamic> json) {
  return PaymentRequest(
    customerId: json['customerId'] as String,
    userType: json['userType'] as String,
    pin: json['pin'] as String,
    amount: json['amount'] as String,
    upiId: json['upiId'] as String,
  );
}

Map<String, dynamic> _$PaymentRequestToJson(PaymentRequest instance) =>
    <String, dynamic>{
      'customerId': instance.customerId,
      'userType': instance.userType,
      'pin': instance.pin,
      'amount': instance.amount,
      'upiId': instance.upiId,
    };
