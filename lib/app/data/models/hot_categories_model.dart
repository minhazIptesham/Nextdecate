
class HotCategoriesModel {
  String? orderCount;
  String? categoryId;
  String? categoryName;
  String? catImage;

  HotCategoriesModel(
      {this.orderCount, this.categoryId, this.categoryName, this.catImage});

  HotCategoriesModel.fromJson(Map<String, dynamic> json) {
    orderCount = json['order_count'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    catImage = json['cat_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_count'] = this.orderCount;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['cat_image'] = this.catImage;
    return data;
  }
}



