class SliderModel {
  String? sliderId;
  String? sliderLink;
  String? sliderImage;
  String? sliderPosition;
  String? sliderCategory;
  String? status;

  SliderModel(
      {this.sliderId,
        this.sliderLink,
        this.sliderImage,
        this.sliderPosition,
        this.sliderCategory,
        this.status});

  SliderModel.fromJson(Map<String, dynamic> json) {
    sliderId = json['slider_id'];
    sliderLink = json['slider_link'];
    sliderImage = json['slider_image'];
    sliderPosition = json['slider_position'];
    sliderCategory = json['slider_category'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slider_id'] = this.sliderId;
    data['slider_link'] = this.sliderLink;
    data['slider_image'] = this.sliderImage;
    data['slider_position'] = this.sliderPosition;
    data['slider_category'] = this.sliderCategory;
    data['status'] = this.status;
    return data;
  }
}