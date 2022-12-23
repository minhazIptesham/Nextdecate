class CountryModel {
  String? id;
  String? sortname;
  String? name;
  String? phonecode;

  CountryModel({this.id, this.sortname, this.name, this.phonecode});

  CountryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sortname = json['sortname'];
    name = json['name'];
    phonecode = json['phonecode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['sortname'] = this.sortname;
    data['name'] = this.name;
    data['phonecode'] = this.phonecode;
    return data;
  }
}