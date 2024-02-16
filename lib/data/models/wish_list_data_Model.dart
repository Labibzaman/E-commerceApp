import 'package:crafty_bay/data/models/productItem_model.dart';
import 'package:crafty_bay/data/models/wish_list_product_item.dart';

class wishListDataModel {
  int? id;
  int? productId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  ProductList_item? product;

  wishListDataModel(
      {this.id,
        this.productId,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.product});

  wishListDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    product =
    json['product'] != null ? new ProductList_item.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}