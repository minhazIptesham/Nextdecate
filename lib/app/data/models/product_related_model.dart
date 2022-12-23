class ProductRelatedModel {
  String? id;
  String? name;
  String? productDetails;
  String? review;
  String? description;
  String? specification;
  String? barCode;
  String? code;
  String? supplierId;
  String? categoryId;
  String? warrantee;
  String? price;
  String? supplierPrice;
  String? unit;
  String? productModel;
  String? imageThumb;
  String? brandId;
  String? variants;
  String? defaultVariant;
  String? variantPrice;
  String? type;
  String? bestSale;
  String? onsale;
  String? onsalePrice;
  String? invoiceDetails;
  String? imageLargeDetails;
  String? tag;
  String? video;
  String? status;
  String? isAssemble;
  String? categoryName;
  int? stock;

  ProductRelatedModel(
      {this.id,
        this.name,
        this.productDetails,
        this.review,
        this.description,
        this.specification,
        this.barCode,
        this.code,
        this.supplierId,
        this.categoryId,
        this.warrantee,
        this.price,
        this.supplierPrice,
        this.unit,
        this.productModel,
        this.imageThumb,
        this.brandId,
        this.variants,
        this.defaultVariant,
        this.variantPrice,
        this.type,
        this.bestSale,
        this.onsale,
        this.onsalePrice,
        this.invoiceDetails,
        this.imageLargeDetails,
        this.tag,
        this.video,
        this.status,
        this.isAssemble,
        this.categoryName,
        this.stock});

  ProductRelatedModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    productDetails = json['product_details'];
    review = json['review'];
    description = json['description'];
    specification = json['specification'];
    barCode = json['bar_code'];
    code = json['code'];
    supplierId = json['supplier_id'];
    categoryId = json['category_id'];
    warrantee = json['warrantee'];
    price = json['price'];
    supplierPrice = json['supplier_price'];
    unit = json['unit'];
    productModel = json['product_model'];
    imageThumb = json['image_thumb'];
    brandId = json['brand_id'];
    variants = json['variants'];
    defaultVariant = json['default_variant'];
    variantPrice = json['variant_price'];
    type = json['type'];
    bestSale = json['best_sale'];
    onsale = json['onsale'];
    onsalePrice = json['onsale_price'];
    invoiceDetails = json['invoice_details'];
    imageLargeDetails = json['image_large_details'];
    tag = json['tag'];
    video = json['video'];
    status = json['status'];
    isAssemble = json['is_assemble'];
    categoryName = json['category_name'];
    stock = json['stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['product_details'] = this.productDetails;
    data['review'] = this.review;
    data['description'] = this.description;
    data['specification'] = this.specification;
    data['bar_code'] = this.barCode;
    data['code'] = this.code;
    data['supplier_id'] = this.supplierId;
    data['category_id'] = this.categoryId;
    data['warrantee'] = this.warrantee;
    data['price'] = this.price;
    data['supplier_price'] = this.supplierPrice;
    data['unit'] = this.unit;
    data['product_model'] = this.productModel;
    data['image_thumb'] = this.imageThumb;
    data['brand_id'] = this.brandId;
    data['variants'] = this.variants;
    data['default_variant'] = this.defaultVariant;
    data['variant_price'] = this.variantPrice;
    data['type'] = this.type;
    data['best_sale'] = this.bestSale;
    data['onsale'] = this.onsale;
    data['onsale_price'] = this.onsalePrice;
    data['invoice_details'] = this.invoiceDetails;
    data['image_large_details'] = this.imageLargeDetails;
    data['tag'] = this.tag;
    data['video'] = this.video;
    data['status'] = this.status;
    data['is_assemble'] = this.isAssemble;
    data['category_name'] = this.categoryName;
    data['stock'] = this.stock;
    return data;
  }
}