import 'package:equatable/equatable.dart';

class AddData extends Equatable {
  final bool? status;
  final String? message;

  const AddData({this.status, this.message});

  factory AddData.fromJson(Map<String, dynamic> json) => AddData(
        status: json['status'] as bool?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, message];
}
