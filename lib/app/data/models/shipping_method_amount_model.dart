class ShippingMethodAmountModel {
  String? id;
  String? name;
  String? details;
  String? chargeAmount;
  String? position;

  ShippingMethodAmountModel(
      {this.id, this.name, this.details, this.chargeAmount, this.position});

  ShippingMethodAmountModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    details = json['details'];
    chargeAmount = json['charge_amount'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['details'] = this.details;
    data['charge_amount'] = this.chargeAmount;
    data['position'] = this.position;
    return data;
  }
}