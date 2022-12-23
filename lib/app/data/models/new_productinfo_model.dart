/*class NewProductModel {
  int  cartItemProductId;
  int cartItemProductVariantId;
  int cartItemProductQuantity;
  dynamic cartItemTotalPrice;
  dynamic baseDiscountedPrice;
  dynamic cartItemDiscountPerProduct;


  *//*
           "cartItemProductId": 22161617,
        "cartItemProductVariantId": 1,
        "cartItemProductQuantity": 4,
        "cartItemProductPrice": 250,
        "cartItemTotalPrice": 2000,
        "cartItemDiscountPerProduct": 0
   *//*

  NewProductModel(
      {this.id,
        this.name,
        this.thumbnailImage,
        this.basePrice,
        this.baseDiscountedPrice,
        this.discount,
        this.stockQty,
        this.discountType});

  NewProductModel.fromJson(Map<String, dynamic> json) {
    id = json['cartItemProductId'];
    name = json['cartItemProductVariantId'];
    stockQty = json['cartItemProductQuantity'];
    thumbnailImage = json['thumbnail_image'];
    basePrice = json['cartItemProductPrice'];
    baseDiscountedPrice = json['cartItemTotalPrice'];
    discount = json['cartItemDiscountPerProduct'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cartItemProductId'] = this.id;
    data['cartItemProductVariantId'] = this.name;
    data['cartItemProductQuantity'] = this.stockQty;
    data['thumbnail_image'] = this.thumbnailImage;
    data['base_price'] = this.basePrice;
    data['base_discounted_price'] = this.baseDiscountedPrice;
    data['discount'] = this.discount;
    data['discount_type'] = this.discountType;
    return data;
  }
}*/


class NewProductModel {
  int? cartItemProductId;
  int? cartItemProductVariantId;
  dynamic cartProductName;
  dynamic cartProductImage;
  var cartItemProductQuantity;
  dynamic cartItemProductPrice;
  dynamic cartItemTotalPrice;
  dynamic cartItemDiscountPerProduct;
  dynamic productStock;

  NewProductModel(
      {this.cartItemProductId,
        this.cartItemProductVariantId,
        this.cartItemProductQuantity,
        this.cartProductName,
        this.cartProductImage,
        this.cartItemProductPrice,
        this.cartItemTotalPrice,
        this.cartItemDiscountPerProduct,
        this.productStock
      });

  NewProductModel.fromJson(Map<String, dynamic> json) {
    cartItemProductId = json['cartItemProductId'];
    cartItemProductVariantId = json['cartItemProductVariantId'];
    cartItemProductQuantity = json['cartItemProductQuantity'];
    cartProductName = json['cartProductName'];
    cartProductImage = json['cartProductImage'];
    cartItemProductPrice = json['cartItemProductPrice'];
    cartItemTotalPrice = json['cartItemTotalPrice'];
    cartItemDiscountPerProduct = json['cartItemDiscountPerProduct'];
    productStock = json['productStock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cartItemProductId'] = this.cartItemProductId;
    data['cartItemProductVariantId'] = this.cartItemProductVariantId;

    data['cartProductName'] = this.cartProductName;
   data['cartProductImage'] = this.cartProductImage;

    data['cartItemProductQuantity'] = this.cartItemProductQuantity;
    data['cartItemProductPrice'] = this.cartItemProductPrice;
    data['cartItemTotalPrice'] = this.cartItemTotalPrice;
    data['cartItemDiscountPerProduct'] = this.cartItemDiscountPerProduct;
    return data;
  }
  Map<String, dynamic> toJsonOrder() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cartItemProductId'] = this.cartItemProductId;
    data['cartItemProductVariantId'] = this.cartItemProductVariantId;

  //  data['cartProductName'] = this.cartProductName;
   // data['cartProductImage'] = this.cartProductImage;

    data['cartItemProductQuantity'] = this.cartItemProductQuantity;
    data['cartItemProductPrice'] = this.cartItemProductPrice;
    data['cartItemTotalPrice'] = this.cartItemTotalPrice;
    data['cartItemDiscountPerProduct'] = this.cartItemDiscountPerProduct;
    return data;
  }
}