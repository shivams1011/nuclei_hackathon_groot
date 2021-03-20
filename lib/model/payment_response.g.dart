// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentResponse _$PaymentResponseFromJson(Map<String, dynamic> json) {
  return PaymentResponse(
    status: json['Status'] == null
        ? null
        : Status.fromJson(json['Status'] as Map<String, dynamic>),
    amount: json['amount'] as String,
    remainingAmount: json['remaining_amount'] as String,
    message: json['message'] as String,
    orderId: json['order_id'] as String,
    upiId: json['upi_id'] as String,
    timestamp: json['timestamp'] as String,
  );
}

Map<String, dynamic> _$PaymentResponseToJson(PaymentResponse instance) =>
    <String, dynamic>{
      'Status': instance.status,
      'amount': instance.amount,
      'remaining_amount': instance.remainingAmount,
      'message': instance.message,
      'order_id': instance.orderId,
      'upi_id': instance.upiId,
      'timestamp': instance.timestamp,
    };

Status _$StatusFromJson(Map<String, dynamic> json) {
  return Status(
    message: json['message'] as String,
    code: json['code'] as int,
  );
}

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
    };
