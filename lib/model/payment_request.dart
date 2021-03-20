import 'package:json_annotation/json_annotation.dart';
part 'payment_request.g.dart';
@JsonSerializable()
class PaymentRequest {
  @JsonKey(name: 'customerId')
  final String customerId;
  @JsonKey(name: 'userType')
  final String userType;
  @JsonKey(name: 'pin')
  final String pin;
  @JsonKey(name: 'amount')
  final String amount;
  @JsonKey(name: 'upiId')
  final String upiId;
  PaymentRequest({
    this.customerId,
    this.userType,
    this.pin,
    this.amount,
    this.upiId
  });
  factory PaymentRequest.fromJson(Map<String, dynamic> json) => _$PaymentRequestFromJson(json);
  Map<String, dynamic> toJson() => _$PaymentRequestToJson(this);
}