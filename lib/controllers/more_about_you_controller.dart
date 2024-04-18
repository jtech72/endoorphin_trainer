import '../utils/exports.dart';

class MoreAboutYouController extends GetxController{
  RxInt selectedIndex = (-1).obs;
List<String>item =[
  'Clear Images: Ensure documents are clear, not blurry.',
  'Correct Naming: Upload each document with its respective name.',
  'Alignment: Properly align the camera for accurate capture.',
  'Review & Submit: Double-check all documents before submitting.'];
  List<String>categoryname=['Certification','Passport','Emirates ID'];
List<String>categorysubname=['Upload your Certification ...','Upload your passport ...','Upload your Emirates ID ...'];
}