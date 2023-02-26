import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:veggie_track_repository/veggie_track_repository.dart';

part 'month_days_state.dart';

class MonthDaysBloc extends Cubit<MonthDaysState> {
  final veggieTrackRepository = VeggieTrackRepository();

  MonthDaysBloc({required DateTime month})
      : super(MonthDaysInitial(month: month));

  Future<void> updateMonth(DateTime month) async {
    print('MonthDaysUpdateRequested: $month');
    emit(MonthDaysLoading(month: month));
    await Future.delayed(const Duration(milliseconds: 100));
    try {
      var days = <Day>[];
      for (DateTime dayDateTime in _getDaysOfMonth(month)) {
        days.add(await veggieTrackRepository.getDay(dayDateTime));
      }
      emit(MonthDaysLoaded(month: month, days: days));
    } catch (e) {
      emit(MonthDaysError(month: month, errorMessage: e.toString()));
      rethrow;
    }
  }

  static List<DateTime> _getDaysOfMonth(DateTime month) {
    final days = <DateTime>[];
    DateTime day = DateTime(month.year, month.month, 1);
    final DateTime lastDay = DateTime(day.year, day.month + 1, day.day);
    while (day.isBefore(lastDay)) {
      days.add(day);
      day = day.add(const Duration(days: 1));
    }
    return days;
  }
}
