class ProductDetailsModel {
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
  List<String>? variants;
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
  String? parentCategoryId;
  String? categoryName;
  String? topMenu;
  String? menuPos;
  String? catImage;
  String? catFavicon;
  String? catType;
  String? brandName;
  String? brandImage;
  String? website;
  String? refinedProductDetails;
  String? refinedReview;
  String? refinedDescription;
  String? refinedSpecification;
  String? productLink;
  List<ProductImages>? productImages;
  int? productRating;
  ReviewList? reviewList;
  int? stock;

  ProductDetailsModel(
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
        this.parentCategoryId,
        this.categoryName,
        this.topMenu,
        this.menuPos,
        this.catImage,
        this.catFavicon,
        this.catType,
        this.brandName,
        this.brandImage,
        this.website,
        this.refinedProductDetails,
        this.refinedReview,
        this.refinedDescription,
        this.refinedSpecification,
        this.productLink,
        this.productImages,
        this.productRating,
        this.reviewList,
        this.stock});

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
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
    variants = json['variants'].cast<String>();
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
    parentCategoryId = json['parent_category_id'];
    categoryName = json['category_name'];
    topMenu = json['top_menu'];
    menuPos = json['menu_pos'];
    catImage = json['cat_image'];
    catFavicon = json['cat_favicon'];
    catType = json['cat_type'];
    brandName = json['brand_name'];
    brandImage = json['brand_image'];
    website = json['website'];
    refinedProductDetails = json['refined_product_details'];
    refinedReview = json['refined_review'];
    refinedDescription = json['refined_description'];
    refinedSpecification = json['refined_specification'];
    productLink = json['product_link'];
    if (json['product_images'] != null) {
      productImages = <ProductImages>[];
      json['product_images'].forEach((v) {
        productImages!.add(new ProductImages.fromJson(v));
      });
    }
    productRating = json['product_rating'];
    reviewList = json['review_list'] != null
        ? new ReviewList.fromJson(json['review_list'])
        : null;
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
    data['parent_category_id'] = this.parentCategoryId;
    data['category_name'] = this.categoryName;
    data['top_menu'] = this.topMenu;
    data['menu_pos'] = this.menuPos;
    data['cat_image'] = this.catImage;
    data['cat_favicon'] = this.catFavicon;
    data['cat_type'] = this.catType;
    data['brand_name'] = this.brandName;
    data['brand_image'] = this.brandImage;
    data['website'] = this.website;
    data['refined_product_details'] = this.refinedProductDetails;
    data['refined_review'] = this.refinedReview;
    data['refined_description'] = this.refinedDescription;
    data['refined_specification'] = this.refinedSpecification;
    data['product_link'] = this.productLink;
    if (this.productImages != null) {
      data['product_images'] =
          this.productImages!.map((v) => v.toJson()).toList();
    }
    data['product_rating'] = this.productRating;
    if (this.reviewList != null) {
      data['review_list'] = this.reviewList!.toJson();
    }
    data['stock'] = this.stock;
    return data;
  }
}

class ProductImages {
  String? imageGalleryId;
  String? productId;
  String? imageUrl;
  String? imgThumb;

  ProductImages(
      {this.imageGalleryId, this.productId, this.imageUrl, this.imgThumb});

  ProductImages.fromJson(Map<String, dynamic> json) {
    imageGalleryId = json['image_gallery_id'];
    productId = json['product_id'];
    imageUrl = json['image_url'];
    imgThumb = json['img_thumb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image_gallery_id'] = this.imageGalleryId;
    data['product_id'] = this.productId;
    data['image_url'] = this.imageUrl;
    data['img_thumb'] = this.imgThumb;
    return data;
  }
}

class ReviewList {
  int? start5;
  int? start4;
  int? start3;
  int? start2;
  int? start1;

  ReviewList({this.start5, this.start4, this.start3, this.start2, this.start1});

  ReviewList.fromJson(Map<String, dynamic> json) {
    start5 = json['start_5'];
    start4 = json['start_4'];
    start3 = json['start_3'];
    start2 = json['start_2'];
    start1 = json['start_1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['start_5'] = this.start5;
    data['start_4'] = this.start4;
    data['start_3'] = this.start3;
    data['start_2'] = this.start2;
    data['start_1'] = this.start1;
    return data;
  }
}