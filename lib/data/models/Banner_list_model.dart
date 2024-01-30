import 'banner_list_item.dart';

class BannerListModel {
  String? msg;
  List<Banner_list_item>? BannerList;

  BannerListModel({this.msg, this.BannerList});

  BannerListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      BannerList = <Banner_list_item>[];
      json['data'].forEach((v) {
        BannerList!.add(Banner_list_item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (this.BannerList != null) {
      data['data'] = this.BannerList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

