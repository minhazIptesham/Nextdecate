class BrandModel {
  String? brandId;
  String? brandName;
  String? brandImage;
  String? website;
  String? status;

  BrandModel(
      {this.brandId,
        this.brandName,
        this.brandImage,
        this.website,
        this.status});

  BrandModel.fromJson(Map<String, dynamic> json) {
    brandId = json['brand_id'];
    brandName = json['brand_name'];
    brandImage = json['brand_image'];
    website = json['website'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['brand_id'] = this.brandId;
    data['brand_name'] = this.brandName;
    data['brand_image'] = this.brandImage;
    data['website'] = this.website;
    data['status'] = this.status;
    return data;
  }
}