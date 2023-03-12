import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:veggie_track_repository/veggie_track_repository.dart';

part 'meal_edit_state.dart';

class MealEditCubit extends Cubit<MealEditState> {
  MealEditCubit() : super(MealEditInitial());

  void addFood(DateTime dateTime, MealType mealType) async {
    emit(MealEditChooseFood(dateTime: dateTime, mealType: mealType));
  }

  void foodChosen(DateTime dateTime, MealType mealType, FoodType foodType) async {
    emit(MealEditChooseQuantity(dateTime: dateTime, mealType: mealType, foodType: foodType));
  }

  void quantityChosen(DateTime dateTime, MealType mealType, int quantity) async {
    emit(MealEditInitial());
  }
}
