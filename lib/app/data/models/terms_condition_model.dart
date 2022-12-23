class StuTitleModel {
   String? subTitle;

  StuTitleModel({this.subTitle});
}

class TermsConditionModel {
  String title;
  List<StuTitleModel> subTitles;

  TermsConditionModel(this.title, this.subTitles);
}

List<TermsConditionModel> termConditionList = [
TermsConditionModel('1. Welcome', [
StuTitleModel(
subTitle:
'Welcome to www……..com The following terms and conditions govern your (and any person or entity you enable/allow access through your access) access and use of this website (“Site”), the contents contained herein (“Contents”) and the services offered on the Site (“Services”).')
])
];
