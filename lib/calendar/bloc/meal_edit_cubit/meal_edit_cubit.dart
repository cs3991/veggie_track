import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:veggie_track_repository/veggie_track_repository.dart';

part 'meal_edit_state.dart';

class MealEditCubit extends Cubit<MealEditState> {
  final DateTime dateTime;
  final MealType mealType;

  MealEditCubit({required this.dateTime, required this.mealType}) : super(MealEditInitial());

  void addFood({int? mealEditedId}) async {
    assert(state is MealEditInitial);
    emit(MealEditChooseFood(
      dateTime: dateTime,
      mealType: mealType,
      mealEditedId: mealEditedId,
    ));
  }

  void foodChosen(FoodType foodType) async {
    assert(this.state is MealEditChooseFood);
    var state = this.state as MealEditChooseFood;
    emit(MealEditChooseQuantity(
      dateTime: dateTime,
      mealType: mealType,
      foodType: foodType,
      mealEditedId: state.mealEditedId,
    ));
  }

  void quantityChosen(int quantity) async {
    assert(state is MealEditChooseQuantity);
    emit(MealEditInitial());
  }
}
