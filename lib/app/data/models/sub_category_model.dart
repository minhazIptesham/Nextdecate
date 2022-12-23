class SubCategoryModel {
  String? categoryId;
  String? parentCategoryId;
  String? categoryName;
  String? topMenu;
  String? menuPos;
  String? catImage;
  String? catFavicon;
  String? catType;
  String? status;

  SubCategoryModel(
      {this.categoryId,
        this.parentCategoryId,
        this.categoryName,
        this.topMenu,
        this.menuPos,
        this.catImage,
        this.catFavicon,
        this.catType,
        this.status});

  SubCategoryModel.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    parentCategoryId = json['parent_category_id'];
    categoryName = json['category_name'];
    topMenu = json['top_menu'];
    menuPos = json['menu_pos'];
    catImage = json['cat_image'];
    catFavicon = json['cat_favicon'];
    catType = json['cat_type'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this.categoryId;
    data['parent_category_id'] = this.parentCategoryId;
    data['category_name'] = this.categoryName;
    data['top_menu'] = this.topMenu;
    data['menu_pos'] = this.menuPos;
    data['cat_image'] = this.catImage;
    data['cat_favicon'] = this.catFavicon;
    data['cat_type'] = this.catType;
    data['status'] = this.status;
    return data;
  }
}