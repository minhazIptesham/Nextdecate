class MainCategoriesModel {
  String? categoryId;
  String? name;
  String? image;
  String? bigImage;
  bool isSelectActive=false;
  List<Categorieslevelone>? categorieslevelone;

  MainCategoriesModel(
      {this.categoryId,
        this.name,
        this.isSelectActive=false,
        this.image,
        this.bigImage,
        this.categorieslevelone});

  MainCategoriesModel.fromJson(Map<String, dynamic> json) {
    isSelectActive = false;
    categoryId = json['category_id'];
    name = json['name'];
    image = json['image'];
    bigImage = json['big_image'];
    if (json['categorieslevelone'] != null) {
      categorieslevelone = <Categorieslevelone>[];
      json['categorieslevelone'].forEach((v) {
        categorieslevelone!.add(new Categorieslevelone.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['big_image'] = this.bigImage;
    if (this.categorieslevelone != null) {
      data['categorieslevelone'] =
          this.categorieslevelone!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categorieslevelone {
  String? subCategoryId;
  String? name;
  String? image;
  String? bigImage;
  List<Categoriesleveltwo>? categoriesleveltwo;

  Categorieslevelone(
      {this.subCategoryId,
        this.name,
        this.image,
        this.bigImage,
        this.categoriesleveltwo});

  Categorieslevelone.fromJson(Map<String, dynamic> json) {
    subCategoryId = json['sub_category_id'];
    name = json['name'];
    image = json['image'];
    bigImage = json['big_image'];
    if (json['categoriesleveltwo'] != null) {
      categoriesleveltwo = <Categoriesleveltwo>[];
      json['categoriesleveltwo'].forEach((v) {
        categoriesleveltwo!.add(new Categoriesleveltwo.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_category_id'] = this.subCategoryId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['big_image'] = this.bigImage;
    if (this.categoriesleveltwo != null) {
      data['categoriesleveltwo'] =
          this.categoriesleveltwo!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categoriesleveltwo {
  String? childCategoryId;
  String? name;
  String? image;
  String? bigImage;

  Categoriesleveltwo(
      {this.childCategoryId, this.name, this.image, this.bigImage});

  Categoriesleveltwo.fromJson(Map<String, dynamic> json) {
    childCategoryId = json['child_category_id'];
    name = json['name'];
    image = json['image'];
    bigImage = json['big_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['child_category_id'] = this.childCategoryId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['big_image'] = this.bigImage;
    return data;
  }
}