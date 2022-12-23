class CheckOutModel {
  OrderInfo? orderInfo;
  ShippingInfo? shippingInfo;
  ShippingInfo? billingInfo;

  CheckOutModel({this.orderInfo, this.shippingInfo, this.billingInfo});

  CheckOutModel.fromJson(Map<String, dynamic> json) {
    orderInfo = json['orderInfo'] != null
        ? new OrderInfo.fromJson(json['orderInfo'])
        : null;
    shippingInfo = json['shippingInfo'] != null
        ? new ShippingInfo.fromJson(json['shippingInfo'])
        : null;
    billingInfo = json['billingInfo'] != null
        ? new ShippingInfo.fromJson(json['billingInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderInfo != null) {
      data['orderInfo'] = this.orderInfo!.toJson();
    }
    if (this.shippingInfo != null) {
      data['shippingInfo'] = this.shippingInfo!.toJson();
    }
    if (this.billingInfo != null) {
      data['billingInfo'] = this.billingInfo!.toJson();
    }
    return data;
  }
}

class OrderInfo {
  String? userId;
  int? paymentMethod;
  int? paidStatus;
  int? totalAmount;
  int? totalDiscount;
  int? serviceCharge;
  String? details;
  int? shippingBillingStatus;
  List<CartItems>? cartItems;
  String? couponCode;

  OrderInfo(
      {this.userId,
        this.paymentMethod,
        this.paidStatus,
        this.totalAmount,
        this.totalDiscount,
        this.serviceCharge,
        this.details,
        this.shippingBillingStatus,
        this.cartItems,
        this.couponCode});

  OrderInfo.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    paymentMethod = json['payment_method'];
    paidStatus = json['paidStatus'];
    totalAmount = json['totalAmount'];
    totalDiscount = json['totalDiscount'];
    serviceCharge = json['serviceCharge'];
    details = json['details'];
    shippingBillingStatus = json['shippingBillingStatus'];
    if (json['cartItems'] != null) {
      cartItems = <CartItems>[];
      json['cartItems'].forEach((v) {
        cartItems!.add(new CartItems.fromJson(v));
      });
    }
    couponCode = json['coupon_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['payment_method'] = this.paymentMethod;
    data['paidStatus'] = this.paidStatus;
    data['totalAmount'] = this.totalAmount;
    data['totalDiscount'] = this.totalDiscount;
    data['serviceCharge'] = this.serviceCharge;
    data['details'] = this.details;
    data['shippingBillingStatus'] = this.shippingBillingStatus;
    if (this.cartItems != null) {
      data['cartItems'] = this.cartItems!.map((v) => v.toJson()).toList();
    }
    data['coupon_code'] = this.couponCode;
    return data;
  }
}

class CartItems {
  int? cartItemProductId;
  int? cartItemProductVariantId;
  int? cartItemProductQuantity;
  int? cartItemProductPrice;
  int? cartItemTotalPrice;
  int? cartItemDiscountPerProduct;

  CartItems(
      {this.cartItemProductId,
        this.cartItemProductVariantId,
        this.cartItemProductQuantity,
        this.cartItemProductPrice,
        this.cartItemTotalPrice,
        this.cartItemDiscountPerProduct});

  CartItems.fromJson(Map<String, dynamic> json) {
    cartItemProductId = json['cartItemProductId'];
    cartItemProductVariantId = json['cartItemProductVariantId'];
    cartItemProductQuantity = json['cartItemProductQuantity'];
    cartItemProductPrice = json['cartItemProductPrice'];
    cartItemTotalPrice = json['cartItemTotalPrice'];
    cartItemDiscountPerProduct = json['cartItemDiscountPerProduct'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cartItemProductId'] = this.cartItemProductId;
    data['cartItemProductVariantId'] = this.cartItemProductVariantId;
    data['cartItemProductQuantity'] = this.cartItemProductQuantity;
    data['cartItemProductPrice'] = this.cartItemProductPrice;
    data['cartItemTotalPrice'] = this.cartItemTotalPrice;
    data['cartItemDiscountPerProduct'] = this.cartItemDiscountPerProduct;
    return data;
  }
}

class ShippingInfo {
  String? fullname;
  String? address;
  String? phone;
  String? email;
  String? city;
  String? state;
  int? country;
  int? zip;
  String? company;

  ShippingInfo(
      {this.fullname,
        this.address,
        this.phone,
        this.email,
        this.city,
        this.state,
        this.country,
        this.zip,
        this.company});

  ShippingInfo.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    address = json['Address'];
    phone = json['phone'];
    email = json['email'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    zip = json['zip'];
    company = json['company'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullname;
    data['Address'] = this.address;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['zip'] = this.zip;
    data['company'] = this.company;
    return data;
  }
}