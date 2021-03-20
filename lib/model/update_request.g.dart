// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateRequest _$UpdateRequestFromJson(Map<String, dynamic> json) {
  return UpdateRequest(
    accountNumber: json['accountNumber'] as String,
    limitPerDay: json['limitPerDay'] as String,
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$UpdateRequestToJson(UpdateRequest instance) =>
    <String, dynamic>{
      'accountNumber': instance.accountNumber,
      'limitPerDay': instance.limitPerDay,
      'status': instance.status,
    };
