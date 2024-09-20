import 'package:endoorphin_trainer/utils/exports.dart';
class SelectCategoryBinding implements Bindings{
  @override
  void dependencies() {
     Get.put(SelectCategoryController());
  }
}