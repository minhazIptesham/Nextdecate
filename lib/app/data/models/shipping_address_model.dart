class ShippingAddressModel {
  String? shipingInfoId;
  String? customerId;
  String? orderId;
  String? customerName;
  String? firstName;
  String? lastName;
  String? customerShortAddress;
  String? customerAddress1;
  String? customerAddress2;
  String? customerMobile;
  String? customerEmail;
  String? city;
  String? state;
  String? country;
  String? zip;
  String? company;

  ShippingAddressModel(
      {this.shipingInfoId,
        this.customerId,
        this.orderId,
        this.customerName,
        this.firstName,
        this.lastName,
        this.customerShortAddress,
        this.customerAddress1,
        this.customerAddress2,
        this.customerMobile,
        this.customerEmail,
        this.city,
        this.state,
        this.country,
        this.zip,
        this.company});

  ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    shipingInfoId = json['shiping_info_id'];
    customerId = json['customer_id'];
    orderId = json['order_id'];
    customerName = json['customer_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    customerShortAddress = json['customer_short_address'];
    customerAddress1 = json['customer_address_1'];
    customerAddress2 = json['customer_address_2'];
    customerMobile = json['customer_mobile'];
    customerEmail = json['customer_email'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    zip = json['zip'];
    company = json['company'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
  //  data['shiping_info_id'] = this.shipingInfoId;
   // data['customer_id'] = this.customerId;
   // data['order_id'] = this.orderId;
   // data['customer_name'] = this.customerName;
   // data['first_name'] = this.firstName;
    data['fullname'] = this.firstName.toString()+this.lastName.toString();
   // data['customer_short_address'] = this.customerShortAddress;
    data['address'] = this.customerAddress1;
    //data['customer_address_2'] = this.customerAddress2;
    data['phone'] = this.customerMobile;
    data['email'] = this.customerEmail;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['zip'] = this.zip;
    data['company'] = this.company;
    return data;
  }
}