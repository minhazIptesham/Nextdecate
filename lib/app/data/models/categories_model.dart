class CategoriesModel {
  String? categoryId;
  String? name;
  String? image;
  String? bigImage;
  List<String>? categorieslevelone;

  CategoriesModel(
      {this.categoryId,
        this.name,
        this.image,
        this.bigImage,
        this.categorieslevelone});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    name = json['name'];
    image = json['image'];
    bigImage = json['big_image'];
    categorieslevelone = json['categorieslevelone'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['big_image'] = this.bigImage;
    data['categorieslevelone'] = this.categorieslevelone;
    return data;
  }
}