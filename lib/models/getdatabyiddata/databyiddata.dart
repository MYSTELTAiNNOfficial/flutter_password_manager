import 'package:equatable/equatable.dart';

import 'detaildata.dart';

class DetailDataStatus extends Equatable {
  final bool? status;
  final List<DataByIdData>? data;

  const DetailDataStatus({this.status, this.data});

  factory DetailDataStatus.fromJson(Map<String, dynamic> json) {
    return DetailDataStatus(
      status: json['status'] as bool?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => DataByIdData.fromJson(e as Map<String, dynamic>))
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
