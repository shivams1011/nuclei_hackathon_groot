// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
    status: json['Status'] == null
        ? null
        : Status.fromJson(json['Status'] as Map<String, dynamic>),
    account: json['Account'] == null
        ? null
        : Account.fromJson(json['Account'] as Map<String, dynamic>),
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'Status': instance.status?.toJson(),
      'Account': instance.account?.toJson(),
      'user': instance.user?.toJson(),
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

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    accountNumber: json['accountNumber'] as String,
    totalBalance: json['totalBalance'] as String,
    limitPerDay: json['limitPerDay'] as String,
    status: json['status'] as String,
    remainingLimit: json['remainingLimit'] as String,
    pin: json['pin'] as String,
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'accountNumber': instance.accountNumber,
      'totalBalance': instance.totalBalance,
      'limitPerDay': instance.limitPerDay,
      'status': instance.status,
      'remainingLimit': instance.remainingLimit,
      'pin': instance.pin,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    custId: json['custId'] as int,
    firstname: json['firstname'] as String,
    lastname: json['lastname'] as String,
    password: json['password'] as String,
    acctNumber: json['acctNumber'] as String,
    userType: json['userType'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'custId': instance.custId,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
      'password': instance.password,
      'acctNumber': instance.acctNumber,
      'userType': instance.userType,
    };
