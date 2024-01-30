import 'CategoryList_item.dart';

class CategoryList_Model {
  String? msg;
  List<CategoryList_Item>? CategoryList;

  CategoryList_Model({this.msg, this.CategoryList});

  CategoryList_Model.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      CategoryList = <CategoryList_Item>[];
      json['data'].forEach((v) {
        CategoryList!.add(CategoryList_Item.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    if (CategoryList != null) {
      data['data'] = CategoryList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
