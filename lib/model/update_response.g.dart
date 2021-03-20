// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateResponse _$UpdateResponseFromJson(Map<String, dynamic> json) {
  return UpdateResponse(
    status: json['Status'] == null
        ? null
        : Status.fromJson(json['Status'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UpdateResponseToJson(UpdateResponse instance) =>
    <String, dynamic>{
      'Status': instance.status,
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
