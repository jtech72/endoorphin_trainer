import 'package:endoorphin_trainer/utils/exports.dart';
import 'package:intl/intl.dart';
class BookingController extends GetxController{
  var _selectedDates = <DateTime?>[].obs;

String formatDateTime(String date, String time) {
    try {
      // Parse the date and time strings
      DateTime dateTime = DateFormat("yyyy-MM-dd").parse(date); // Adjust the format based on your date string
      DateTime parsedTime = DateFormat("HH:mm:ss").parse(time); // Adjust the format based on your time string

      // Combine the date and time into a single DateTime object
      DateTime combinedDateTime = DateTime(
        dateTime.year,
        dateTime.month,
        dateTime.day,
        parsedTime.hour,
        parsedTime.minute,
        parsedTime.second,
      );

      // Format the combined DateTime object
      String formattedDate = DateFormat("yyyy-MM-dd").format(combinedDateTime);
      String formattedTime = DateFormat("HH:mm:ss").format(combinedDateTime);

      return "$formattedDate $formattedTime";
    } catch (e) {
      // Handle the error if parsing fails
      return "";
    }
  }
}