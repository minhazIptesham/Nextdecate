class WishListModel {
  String? wishlistId;
  String? productId;
  String? userId;
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
  dynamic rating;

  WishListModel(
      {this.wishlistId,
        this.productId,
        this.userId,
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
        this.rating});

  WishListModel.fromJson(Map<String, dynamic> json) {
    wishlistId = json['wishlist_id'];
    productId = json['product_id'];
    userId = json['user_id'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wishlist_id'] = this.wishlistId;
    data['product_id'] = this.productId;
    data['user_id'] = this.userId;
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
    return data;
  }
}