import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:veggie_track_repository/veggie_track_repository.dart';

part 'month_days_state.dart';

class MonthDaysBloc extends Cubit<MonthDaysState> {
  final veggieTrackRepository = VeggieTrackRepository();

  MonthDaysBloc({required DateTime date}) : super(MonthDaysInitial(date: date));

  Future<void> updateMonth(DateTime date) async {
    emit(MonthDaysLoading(date: date));
    // await Future.delayed(const Duration(milliseconds: 100));
    try {
      var days = <Day>[];
      for (DateTime dayDateTime in _getDaysOfMonth(date)) {
        days.add(await veggieTrackRepository.getDay(dayDateTime));
      }
      emit(MonthDaysLoaded(date: date, days: days));
    } catch (e) {
      emit(MonthDaysError(date: date, errorMessage: e.toString()));
      rethrow;
    }
  }

  Future<void> nextMonth() async {
    updateMonth(DateTime(state.date.year, state.date.month + 1));
  }

  Future<void> previousMonth() async {
    updateMonth(DateTime(state.date.year, state.date.month - 1));
  }

  void updateDayInSameMonth(int dayOfMonth) {
    emit(state.copyWith(
      date: DateTime(state.date.year, state.date.month, dayOfMonth),
    ));
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
