import 'package:equatable/equatable.dart';

class DataByIdUser extends Equatable {
  final String? id;
  final String? appName;
  final dynamic username;
  final String? email;

  const DataByIdUser({this.id, this.appName, this.username, this.email});

  factory DataByIdUser.fromJson(Map<String, dynamic> json) => DataByIdUser(
        id: json['id'] as String?,
        appName: json['app_name'] as String?,
        username: json['username'] as dynamic,
        email: json['email'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'app_name': appName,
        'username': username,
        'email': email,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, appName, username, email];
}
