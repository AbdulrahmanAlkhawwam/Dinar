part of 'categories_bloc.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesError extends CategoriesState {
  final Message message;

  CategoriesError({required this.message});
}

final class CategoriesLoaded extends CategoriesState {
  final List<Category> incomeCategories;
  final List<Category> paymentCategories;

  CategoriesLoaded({
    required this.incomeCategories,
    required this.paymentCategories,
  });
}