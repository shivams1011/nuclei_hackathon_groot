import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';
@JsonSerializable(explicitToJson: true, createToJson: true)
class LoginResponse {
  @JsonKey(name: 'Status')
  final Status status;
  @JsonKey(name: 'Account')
  final Account account;
  @JsonKey(name: 'user')
  final User user;
  LoginResponse({
    this.status,
    this.account,
    this.user
  });
  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
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
@JsonSerializable()
class Account {
  @JsonKey(name: 'accountNumber')
  String accountNumber;
  @JsonKey(name: 'totalBalance')
  String totalBalance;
  @JsonKey(name: 'limitPerDay')
  String limitPerDay;
  @JsonKey(name: 'status')
  String status;
  @JsonKey(name: 'remainingLimit')
  String remainingLimit;
  @JsonKey(name: 'pin')
  String pin;
  Account({
    this.accountNumber,
    this.totalBalance,
    this.limitPerDay,
    this.status,
    this.remainingLimit,
    this.pin
});
        factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);
        Map<String, dynamic> toJson() => _$AccountToJson(this);
        }
@JsonSerializable(explicitToJson: true)
class User {
  @JsonKey(name: 'custId')
  int custId;
  @JsonKey(name: 'firstname')
  String firstname;
  @JsonKey(name: 'lastname')
  String lastname;
  @JsonKey(name: 'password')
  String password;
  @JsonKey(name: 'acctNumber')
  String acctNumber;
  @JsonKey(name: 'userType')
  String userType;
  User({
    this.custId,
    this.firstname,
    this.lastname,
    this.password,
    this.acctNumber,
    this.userType
});
        factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
        Map<String, dynamic> toJson() => _$UserToJson(this);
}