import 'package:intl/intl.dart';

String formateDate(date) {
  final DateFormat dateFormatter = DateFormat('MMMM dd, yyyy');
  final DateFormat dateTimeFormatter = DateFormat('MMMM dd, yyyy - h:m a');
  if (date == null) {
    return "";
  } else {
    if (date!.hour == 00 && date!.minute == 00 && date!.second == 00) {
      return dateFormatter.format(date!);
    } else {
      return dateTimeFormatter.format(date!);
    }
  }
}
