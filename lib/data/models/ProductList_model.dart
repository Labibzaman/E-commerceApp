import 'package:crafty_bay/data/models/CategoryList_item.dart';
import 'package:crafty_bay/data/models/productItem_model.dart';

class Popularist_Model {
  String? msg;
  List<ProductList_item>? data;

  Popularist_Model({this.msg, this.data});

  Popularist_Model.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      data = <ProductList_item>[];
      json['data'].forEach((v) {
        data!.add(new ProductList_item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



