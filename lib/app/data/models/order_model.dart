class OrderModel {
  String? orderId;
  String? customerId;
  String? storeId;
  String? date;
  String? totalAmount;
  String? details;
  String? totalDiscount;
  String? serviceCharge;
  String? paidAmount;
  String? dueAmount;
  String? status;

  OrderModel(
      {this.orderId,
        this.customerId,
        this.storeId,
        this.date,
        this.totalAmount,
        this.details,
        this.totalDiscount,
        this.serviceCharge,
        this.paidAmount,
        this.dueAmount,
        this.status});

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    customerId = json['customer_id'];
    storeId = json['store_id'];
    date = json['date'];
    totalAmount = json['total_amount'];
    details = json['details'];
    totalDiscount = json['total_discount'];
    serviceCharge = json['service_charge'];
    paidAmount = json['paid_amount'];
    dueAmount = json['due_amount'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['customer_id'] = this.customerId;
    data['store_id'] = this.storeId;
    data['date'] = this.date;
    data['total_amount'] = this.totalAmount;
    data['details'] = this.details;
    data['total_discount'] = this.totalDiscount;
    data['service_charge'] = this.serviceCharge;
    data['paid_amount'] = this.paidAmount;
    data['due_amount'] = this.dueAmount;
    data['status'] = this.status;
    return data;
  }
}