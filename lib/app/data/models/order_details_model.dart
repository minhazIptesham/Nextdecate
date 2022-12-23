class OrderDetailsModel {
  String? orderId;
  String? productName;
  String? productImage;
  String? storeId;
  String? variantName;
  String? quantity;
  String? rate;
  String? totalPrice;
  String? discount;

  OrderDetailsModel(
      {this.orderId,
        this.productName,
        this.productImage,
        this.storeId,
        this.variantName,
        this.quantity,
        this.rate,
        this.totalPrice,
        this.discount});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    productName = json['product_name'];
    productImage = json['product_image'];
    storeId = json['store_id'];
    variantName = json['variant_name'];
    quantity = json['quantity'];
    rate = json['rate'];
    totalPrice = json['total_price'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['product_name'] = this.productName;
    data['product_image'] = this.productImage;
    data['store_id'] = this.storeId;
    data['variant_name'] = this.variantName;
    data['quantity'] = this.quantity;
    data['rate'] = this.rate;
    data['total_price'] = this.totalPrice;
    data['discount'] = this.discount;
    return data;
  }
}