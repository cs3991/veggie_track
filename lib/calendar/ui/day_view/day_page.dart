import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:veggie_track/calendar/bloc/month_days_bloc/month_days_bloc.dart';
import 'package:veggie_track/date_format/date_utils.dart';

import 'day_body.dart';

class DayPage extends StatelessWidget {
  const DayPage({super.key});

  @override
  Widget build(BuildContext context) {
    var date = context.read<MonthDaysBloc>().state.date;
    return Scaffold(
      appBar: AppBar(
        title: Text(DateFormat.MMMMEEEEd().format(date).camelCase()),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const DayBody(),
    );
  }
}
