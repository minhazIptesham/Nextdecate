class UserProfileModel {
  String? customerId;
  String? name;
  String? firstName;
  String? lastName;
  String? email;
  String? address1;
  String? address2;
  String? city;
  String? state;
  String? country;
  String? zip;
  String? mobile;
  String? image;
  String? company;
  String? password;

  UserProfileModel(
      {this.customerId,
        this.name,
        this.firstName,
        this.lastName,
        this.email,
        this.address1,
        this.address2,
        this.city,
        this.state,
        this.country,
        this.zip,
        this.mobile,
        this.image,
        this.company,
        this.password});

  UserProfileModel.fromJson(Map<String, dynamic> json) {
    customerId = json['customer_id'];
    name = json['name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    zip = json['zip'];
    mobile = json['mobile'];
    image = json['image'];
    company = json['company'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_id'] = this.customerId;
    data['name'] = this.name;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['address_1'] = this.address1;
    data['address_2'] = this.address2;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['zip'] = this.zip;
    data['mobile'] = this.mobile;
    data['image'] = this.image;
    data['company'] = this.company;
    data['password'] = this.password;
    return data;
  }
}