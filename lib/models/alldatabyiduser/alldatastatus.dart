import 'package:equatable/equatable.dart';

import 'data.dart';

class AllDataStatus extends Equatable {
  final bool? status;
  final List<DataByIdUser>? data;

  const AllDataStatus({this.status, this.data});

  factory AllDataStatus.fromJson(Map<String, dynamic> json) {
    return AllDataStatus(
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataByIdUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data?.map((e) => e.toJson()).toList(),
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, data];
}
