class CouponModel {
  String? couponId;
  String? couponName;
  String? couponDiscountCode;
  String? discountAmount;
  Null? discountPercentage;
  String? startDate;
  String? endDate;
  String? discountType;
  String? status;

  CouponModel(
      {this.couponId,
        this.couponName,
        this.couponDiscountCode,
        this.discountAmount,
        this.discountPercentage,
        this.startDate,
        this.endDate,
        this.discountType,
        this.status});

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponId = json['coupon_id'];
    couponName = json['coupon_name'];
    couponDiscountCode = json['coupon_discount_code'];
    discountAmount = json['discount_amount'];
    discountPercentage = json['discount_percentage'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    discountType = json['discount_type'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coupon_id'] = this.couponId;
    data['coupon_name'] = this.couponName;
    data['coupon_discount_code'] = this.couponDiscountCode;
    data['discount_amount'] = this.discountAmount;
    data['discount_percentage'] = this.discountPercentage;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['discount_type'] = this.discountType;
    data['status'] = this.status;
    return data;
  }
}