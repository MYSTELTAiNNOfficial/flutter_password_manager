part of 'models.dart';

class DataByIdData extends Equatable {
  final String? id;
  final String? idUser;
  final String? appName;
  final String? username;
  final dynamic email;
  final String? password;
  final String? description;
  final String? createdAt;
  final String? updatedAt;

  const DataByIdData({
    this.id,
    this.idUser,
    this.appName,
    this.username,
    this.email,
    this.password,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory DataByIdData.fromJson(Map<String, dynamic> json) => DataByIdData(
        id: json['id'] as String?,
        idUser: json['id_user'] as String?,
        appName: json['app_name'] as String?,
        username: json['username'] as String?,
        email: json['email'] as dynamic,
        password: json['password'] as String?,
        description: json['description'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'id_user': idUser,
        'app_name': appName,
        'username': username,
        'email': email,
        'password': password,
        'description': description,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      idUser,
      appName,
      username,
      email,
      password,
      description,
      createdAt,
      updatedAt,
    ];
  }
}
