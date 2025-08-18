import 'package:flutter_assignment_app/pages/campaign_matching/presentation/controller/compaign_matching_controller.dart';
import 'package:get/get.dart';

class CompaignMatchingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompaignMatchingController>(() => CompaignMatchingController());
  }
}
