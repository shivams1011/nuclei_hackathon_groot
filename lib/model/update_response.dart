import 'package:json_annotation/json_annotation.dart';
part 'update_response.g.dart';
@JsonSerializable()
class UpdateResponse {
  @JsonKey(name: 'Status')
  final Status status;
  UpdateResponse({
    this.status
  });
  factory UpdateResponse.fromJson(Map<String, dynamic> json) => _$UpdateResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateResponseToJson(this);
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