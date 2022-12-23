class PolicyModel {
  String title;
  List<StuPolicyTitleModel> subTitles;

  PolicyModel(this.title, this.subTitles);
}

class StuPolicyTitleModel {
   String? subTitle;

   StuPolicyTitleModel({this.subTitle});
}

