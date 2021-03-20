import 'package:json_annotation/json_annotation.dart';
part 'update_request.g.dart';
@JsonSerializable()
class UpdateRequest {
  @JsonKey(name: 'accountNumber')
  final String accountNumber;
  @JsonKey(name: 'limitPerDay')
  final String limitPerDay;
  @JsonKey(name: 'status')
  final String status;
  UpdateRequest({
    this.accountNumber,
    this.limitPerDay,
    this.status
  });
  factory UpdateRequest.fromJson(Map<String, dynamic> json) => _$UpdateRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateRequestToJson(this);
}
