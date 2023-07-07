import 'package:interview/src/models/userlist_model.dart';

class UserDetailModel {
  Data? data;
  Support? support;

  UserDetailModel({this.data, this.support});

  UserDetailModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    support =
        json['support'] != null ? Support.fromJson(json['support']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (support != null) {
      data['support'] = support!.toJson();
    }
    return data;
  }
}
