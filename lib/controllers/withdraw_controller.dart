import 'package:endoorphin_trainer/utils/exports.dart';

class WithdrawController extends GetxController{
  int selectedMembership = 0;
  void selectItem2(int index) {
    selectedMembership = index;
    update();
  }
  List<Items2> items2 = [ ];
  List<String>cardname =['Mastercard','Visa','Paypal'];
  @override
  void onInit() {
    items2.add(Items2(
      imagePath: ImagesPaths.mastercard,));
    items2.add(Items2(
      imagePath: ImagesPaths.visa,));
    items2.add(Items2(
      imagePath: ImagesPaths.paypal,));


    // TODO: implement onInit
    super.onInit();
  }

}
class Items2 {


  String? imagePath;
  Items2({required this.imagePath});
}