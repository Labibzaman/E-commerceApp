import 'brand_model.dart';

class BrandListModel {
  String? msg;
  List<Brand>? BrandListData;

  BrandListModel({this.msg, this.BrandListData});

  BrandListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      BrandListData = <Brand>[];
      json['data'].forEach((v) {
        BrandListData!.add(Brand.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.BrandListData != null) {
      data['data'] = this.BrandListData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

