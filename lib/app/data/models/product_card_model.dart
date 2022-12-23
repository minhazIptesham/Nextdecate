class ProductCardModel {
  String? id;
  String? name;
  String? catId;
  String? price;
  String? model;
  String? imageThumb;
  String? productDetails;
  String? description;
  List<String>? variants;
  double? onsale;
  double? bestSale;
  dynamic onsalePrice;
  String? imageLargeDetails;
  List<String>? taxDetails;
  int? rating;
  int? stock;

  ProductCardModel(
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
        this.bestSale,
        this.onsalePrice,
        this.imageLargeDetails,
        this.taxDetails,
        this.rating,
        this.stock});

  ProductCardModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    catId = json['cat_id'];
    price = json['price'];
    model = json['model'];
    imageThumb = json['image_thumb'];
    productDetails = '';// json['product_details'];
    description = ''; //json['description'];
    variants = json['variants'].cast<String>();
    onsale: json["onsale"] ?? 0.0;
    bestSale: json["best_sale"] ?? 0.0;
    onsalePrice = json['onsale_price'];
    imageLargeDetails = json['image_large_details'];
    taxDetails = json['tax_details'].cast<String>();
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
    data['product_details'] = '';//this.productDetails;
    data['description'] = this.description;
    data['variants'] = this.variants;
    data['onsale'] = this.onsale;
    data['best_sale'] = this.bestSale;
    data['onsale_price'] = this.onsalePrice;
    data['image_large_details'] = this.imageLargeDetails;
    data['tax_details'] = this.taxDetails;
    data['rating'] = this.rating;
    data['stock'] = this.stock;
    return data;
  }
}