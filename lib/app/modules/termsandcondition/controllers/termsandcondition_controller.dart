import 'package:get/get.dart';

import '../../../data/models/terms_condition_model.dart';
import '../../../data/repositories/PolicyTermsRepo.dart';


class TermsandconditionController extends GetxController {
  final isLoadedTermsInfo = true.obs;
  final _termsConditionList = <TermsConditionModel>[].obs;
  List<TermsConditionModel> get termsConditionList => _termsConditionList;

  @override
  void onInit() async {
    super.onInit();
    await getTermsList();
    print('call terms controller on init');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getTermsList() async {
    //if (await checkInternetConnection()) {
    isLoadedTermsInfo(true);
    termsConditionList.clear();

    var terms = await PolicyTermsRepo().getTerms();

    if (terms != []) {
      isLoadedTermsInfo(false);
      termsConditionList.addAll(terms);

      print('terms lng :$termsConditionList');
    } else {
      isLoadedTermsInfo(false);
      print('terms info not found');
    }
    print(termsConditionList);
    // }
  }
}
