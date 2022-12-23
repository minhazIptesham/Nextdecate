class SearchModel {
  String? id;
  String? name;
  String? catId;
  String? price;
  String? model;
  String? imageThumb;
  String? productDetails;
  String? description;
  String? variants;
  String? onsale;
  String? onsalePrice;
  String? imageLargeDetails;
  int? rating;
  int? stock;

  SearchModel(
      {this.id,
        this.name,
        this.catId,
        this.price,
        this.model,
        this.imageThumb,
        this.productDetails,
        this.description,
        this.variants,
        this.onsale,
        this.onsalePrice,
        this.imageLargeDetails,
        this.rating,
        this.stock});

  SearchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    catId = json['cat_id'];
    price = json['price'];
    model = json['model'];
    imageThumb = json['image_thumb'];
    productDetails = json['product_details'];
    description = json['description'];
    variants = json['variants'];
    onsale = json['onsale'];
    onsalePrice = json['onsale_price'];
    imageLargeDetails = json['image_large_details'];
    rating = json['rating'];
    stock = json['stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['cat_id'] = this.catId;
    data['price'] = this.price;
    data['model'] = this.model;
    data['image_thumb'] = this.imageThumb;
    data['product_details'] = this.productDetails;
    data['description'] = this.description;
    data['variants'] = this.variants;
    data['onsale'] = this.onsale;
    data['onsale_price'] = this.onsalePrice;
    data['image_large_details'] = this.imageLargeDetails;
    data['rating'] = this.rating;
    data['stock'] = this.stock;
    return data;
  }
}