part of 'models.dart';

class UserProfile extends Equatable {
  final String? email;
  final String? key;

  const UserProfile({this.email, this.key});

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
        email: json['email'] as String?,
        key: json['key'] as String?,
      );

  Map<String, dynamic> toJson() => {'email': email, 'key': key};

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [email, key];
}
