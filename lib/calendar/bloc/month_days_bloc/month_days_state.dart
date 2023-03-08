part of 'month_days_bloc.dart';

@immutable
abstract class MonthDaysState {
  final DateTime date;

  const MonthDaysState({required this.date});

  MonthDaysState copyWith({DateTime? date});
}

class MonthDaysInitial extends MonthDaysState {
  const MonthDaysInitial({required super.date});

  @override
  MonthDaysState copyWith({DateTime? date}) {
    return MonthDaysInitial(date: date ?? this.date);
  }
}

class MonthDaysLoading extends MonthDaysState {
  const MonthDaysLoading({required super.date});

  @override
  MonthDaysState copyWith({DateTime? date}) {
    return MonthDaysLoading(date: date ?? this.date);
  }
}

class MonthDaysLoaded extends MonthDaysState {
  const MonthDaysLoaded({required super.date, required this.days});

  final List<Day> days;

  @override
  MonthDaysState copyWith({DateTime? date}) {
    return MonthDaysLoaded(date: date ?? this.date, days: days);
  }
}

class MonthDaysError extends MonthDaysState {
  const MonthDaysError({required super.date, required this.errorMessage});

  final String errorMessage;

  @override
  MonthDaysState copyWith({DateTime? date}) {
    return MonthDaysError(date: date ?? this.date, errorMessage: errorMessage);
  }
}
