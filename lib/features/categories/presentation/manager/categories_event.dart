part of 'categories_bloc.dart';

@immutable
sealed class CategoriesEvent {}

class CategoryInitEvent extends CategoriesEvent {}

class AddCategoryEvent extends CategoriesEvent {
  final Category category;

  AddCategoryEvent({required this.category});
}
