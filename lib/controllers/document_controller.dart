import 'dart:developer';
import 'package:endoorphin_trainer/utils/exports.dart';
import '../services/models/response_models/get_trainer_doc_status_model.dart';
import '../services/network_services/api_call.dart';
class DocumentController extends GetxController{
  RxBool isFrontImageVisible1 = true.obs;
  RxBool isFrontImageVisible = true.obs;
  RxBool isFrontImageVisible2 = true.obs;
  Rx<GetTrainerDocStatusModel> trainerDocStatusModel=GetTrainerDocStatusModel().obs;
  Future<GetTrainerDocStatusModel> onRefresh()async{
 await   CallAPI.getDocStatus(storage.read("userId").toString()).then((value){
   trainerDocStatusModel.value=value;
   log("TRAINER DOC DATA: => ${trainerDocStatusModel.value.result![0].toString()}");
 });
 return trainerDocStatusModel.value;
  }
  @override
  void onInit() {
    onRefresh();
    super.onInit();
  }
}