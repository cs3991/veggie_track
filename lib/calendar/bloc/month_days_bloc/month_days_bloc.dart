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

  Future<void> deleteFood(DateTime dateTime, MealType mealType, int foodId) async {
    if (state is MonthDaysLoaded) {
      final MonthDaysLoaded state = this.state as MonthDaysLoaded;
      if (mealType == MealType.lunch) {
        var newFoodList = List<Food>.from(state.days[dateTime.day - 1].lunch);
        newFoodList.removeAt(foodId);
        // todo : optimize this
        await veggieTrackRepository
            .editDay(Day(date: dateTime, lunch: newFoodList, diner: state.days[dateTime.day - 1].diner));
      } else {
        var newFoodList = List<Food>.from(state.days[dateTime.day - 1].diner);
        newFoodList.removeAt(foodId);
        await veggieTrackRepository
            .editDay(Day(date: dateTime, lunch: state.days[dateTime.day - 1].lunch, diner: newFoodList));
      }
      await updateMonth(state.date);
    } else {
      throw Exception('State was not MonthDaysLoaded while deleteFood was called');
    }
  }

  Future<void> addFood(DateTime dateTime, MealType mealType, FoodType foodType, int quantity) async {
    if (state is MonthDaysLoaded) {
      final MonthDaysLoaded state = this.state as MonthDaysLoaded;
      await veggieTrackRepository.addFood(dateTime, mealType, Food(foodType: foodType, quantity: quantity));
      await updateMonth(state.date);
    } else {
      throw Exception('State was not MonthDaysLoaded while addFood was called');
    }
  }

  Future<void> editFood(
    DateTime dateTime,
    MealType mealType,
    int foodId,
    FoodType foodType,
    int quantity,
  ) async {
    if (state is MonthDaysLoaded) {
      final MonthDaysLoaded state = this.state as MonthDaysLoaded;
      if (mealType == MealType.lunch) {
        var newFoodList = List<Food>.from(state.days[dateTime.day - 1].lunch);
        newFoodList[foodId] = Food(
          foodType: foodType,
          quantity: quantity,
        );
        await veggieTrackRepository.editDay(Day(
          date: dateTime,
          lunch: newFoodList,
          diner: state.days[dateTime.day - 1].diner,
        ));
      } else {
        var newFoodList = List<Food>.from(state.days[dateTime.day - 1].diner);
        newFoodList[foodId] = Food(
          foodType: foodType,
          quantity: quantity,
        );
        await veggieTrackRepository.editDay(Day(
          date: dateTime,
          lunch: state.days[dateTime.day - 1].lunch,
          diner: newFoodList,
        ));
      }
      await updateMonth(state.date);
    } else {
      throw Exception('State was not MonthDaysLoaded while editFood was called');
    }
  }

  static List<DateTime> _getDaysOfMonth(DateTime month) {
    final days = <DateTime>[];
    DateTime day = DateTime(month.year, month.month, 1);
    final DateTime lastDay = DateTime(day.year, day.month + 1, day.day);
    while (day.isBefore(lastDay)) {
      days.add(day);
      day = day.copyWith(day: day.day + 1);
    }
    return days;
  }
}
