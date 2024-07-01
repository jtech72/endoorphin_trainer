import 'dart:developer';

import 'package:endoorphin_trainer/services/network_services/api_call.dart';
import 'package:endoorphin_trainer/utils/exports.dart';

import '../services/models/response_models/get_trainer_doc_status_model.dart';
class DocumentController extends GetxController{





  Rx<GetTrainerDocStatusModel> trainerDocStatusModel=GetTrainerDocStatusModel().obs;
  Future<void> onRefresh()async{
 await   CallAPI.getDocStatus(storage.read("userId").toString()).then((value){
   trainerDocStatusModel.value=value;
   log("TRAINER DOC DATA: => ${trainerDocStatusModel.value.result![0].toString()}");
 });
  }
  @override
  void onInit() {
    onRefresh();
    super.onInit();
  }
}