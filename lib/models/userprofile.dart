part of 'models.dart';

class UserProfile extends Equatable {
  final int? id;
  final String? email;
  final String? key;
  final String? createdAt;

  const UserProfile({this.id, this.email, this.key, this.createdAt});

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        id: json['id'] as int?,
        email: json['email'] as String?,
        key: json['key'] as String?,
        createdAt: json['created_at'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'key': key,
        'created_at': createdAt,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, email, key, createdAt];
}
