part of 'models.dart';

class DataByIdData extends Equatable {
  final String? id;
  final String? appName;
  final String? username;
  final dynamic email;
  final String? password;
  final String? description;

  const DataByIdData({
    this.id,
    this.appName,
    this.username,
    this.email,
    this.password,
    this.description
  });

  factory DataByIdData.fromJson(Map<String, dynamic> json) => DataByIdData(
        id: json['id'] as String?,
        appName: json['app_name'] as String?,
        username: json['username'] as String?,
        email: json['email'] as dynamic,
        password: json['password'] as String?,
        description: json['description'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'app_name': appName,
        'username': username,
        'email': email,
        'password': password,
        'description': description
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      appName,
      username,
      email,
      password,
      description
    ];
  }
}
