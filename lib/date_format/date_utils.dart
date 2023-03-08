import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart';

extension StringExtension on String {
  String camelCase() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

Future<void> initDateFormatting() async {
  await initializeDateFormatting(null, null);
  var locale = await findSystemLocale();
  Intl.systemLocale = locale;
}
