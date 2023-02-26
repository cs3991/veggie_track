part of 'month_days_bloc.dart';

@immutable
abstract class MonthDaysState {
  final DateTime month;

  const MonthDaysState({required this.month});
}

class MonthDaysInitial extends MonthDaysState {
  const MonthDaysInitial({required super.month});
}

class MonthDaysLoading extends MonthDaysState {
  const MonthDaysLoading({required super.month});
}

class MonthDaysLoaded extends MonthDaysState {
  const MonthDaysLoaded({required super.month, required this.days});

  final List<Day> days;
}

class MonthDaysError extends MonthDaysState {
  const MonthDaysError({required super.month, required this.errorMessage});

  final String errorMessage;
}
