import 'banner_list_item.dart';

class BannerList {
  String? msg;
  List<Banner_list_item>? data;

  BannerList({this.msg, this.data});

  BannerList.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Banner_list_item>[];
      json['data'].forEach((v) {
        data!.add(Banner_list_item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

