import 'dart:convert';

import 'package:equatable/equatable.dart';

class GetDataByIdUser extends Equatable {
  final String? id;
  final String? appName;
  final String? username;
  final String? email;

  const GetDataByIdUser({this.id, this.appName, this.username, this.email});

  factory GetDataByIdUser.fromJson(Map<String, dynamic> data) {
    return GetDataByIdUser(
      id: data['id'] as String?,
      appName: data['app_name'] as String?,
      username: data['username'] as String?,
      email: data['email'] as String?,
    );
  }

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
