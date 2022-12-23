class WebSettingsModel {
  AboutUs? aboutUs;
  AboutUs? termsCondition;
  AboutUs? privacyPolicy;

  WebSettingsModel({this.aboutUs, this.termsCondition, this.privacyPolicy});

  WebSettingsModel.fromJson(Map<String, dynamic> json) {
    aboutUs = json['about_us'] != null
        ? new AboutUs.fromJson(json['about_us'])
        : null;
    termsCondition = json['terms_condition'] != null
        ? new AboutUs.fromJson(json['terms_condition'])
        : null;
    privacyPolicy = json['privacy_policy'] != null
        ? new AboutUs.fromJson(json['privacy_policy'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.aboutUs != null) {
      data['about_us'] = this.aboutUs!.toJson();
    }
    if (this.termsCondition != null) {
      data['terms_condition'] = this.termsCondition!.toJson();
    }
    if (this.privacyPolicy != null) {
      data['privacy_policy'] = this.privacyPolicy!.toJson();
    }
    return data;
  }
}

class AboutUs {
  String? pageId;
  String? headlines;
  String? image;
  String? details;

  AboutUs({this.pageId, this.headlines, this.image, this.details});

  AboutUs.fromJson(Map<String, dynamic> json) {
    pageId = json['page_id'];
    headlines = json['headlines'];
    image = json['image'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page_id'] = this.pageId;
    data['headlines'] = this.headlines;
    data['image'] = this.image;
    data['details'] = this.details;
    return data;
  }
}