import 'package:crafty_bay/data/models/product_details_data.dart';

class ProductDetails_Model {
  String? msg;
  List<ProductDetailsData>? ProductDetailsdataList;

  ProductDetails_Model({this.msg, this.ProductDetailsdataList});

  ProductDetails_Model.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      ProductDetailsdataList = <ProductDetailsData>[];
      json['data'].forEach((v) {
        ProductDetailsdataList!.add(ProductDetailsData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (ProductDetailsdataList != null) {
      data['data'] = ProductDetailsdataList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



