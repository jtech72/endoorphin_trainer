

import 'package:endoorphin_trainer/utils/exports.dart';

import '../controllers/select_category_controller.dart';

class SelectCategoryBinding implements Bindings{
  @override
  void dependencies() {
     Get.put(SelectCategoryController());
  }

}