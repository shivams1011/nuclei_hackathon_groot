import 'package:json_annotation/json_annotation.dart';
part 'payment_response.g.dart';
@JsonSerializable()
class PaymentResponse {
  @JsonKey(name: 'Status')
  final Status status;
  @JsonKey(name: 'amount')
  final String amount;
  @JsonKey(name: 'remaining_amount')
  final String remainingAmount;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'order_id')
  final String orderId;
  @JsonKey(name: 'upi_id')
  final String upiId;
  @JsonKey(name: 'timestamp')
  final String timestamp;
  PaymentResponse({
    this.status,
    this.amount,
    this.remainingAmount,
    this.message,
    this.orderId,
    this.upiId,
    this.timestamp
  });
  factory PaymentResponse.fromJson(Map<String, dynamic> json) => _$PaymentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentResponseToJson(this);
}
@JsonSerializable()
class Status {
  @JsonKey(name: 'message')
  String message;
  @JsonKey(name: 'code')
  int code;
  Status({
    this.message,
    this.code
});
        factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
        Map<String, dynamic> toJson() => _$StatusToJson(this);
}