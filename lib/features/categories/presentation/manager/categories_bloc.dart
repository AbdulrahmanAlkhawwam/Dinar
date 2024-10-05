import 'dart:async';

import 'package:Dinar/features/categories/domain/use_cases/add_category_uc.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/utils/message.dart';
import '../../../app/presentation/manager/general/general_bloc.dart';
import '../../domain/entities/category.dart';
import '../../domain/use_cases/load_income_categories_uc.dart';
import '../../domain/use_cases/load_payment_categories_uc.dart';

part 'categories_event.dart';

part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  List<Category> incomeCategories = [];
  List<Category> paymentCategories = [];

  final LoadIncomeCategoriesUc loadIncomeCategoriesUc;
  final LoadPaymentCategoriesUc loadPaymentCategoriesUc;
  final AddCategoryUc addCategoryUc;

  CategoriesBloc({
    required this.loadPaymentCategoriesUc,
    required this.loadIncomeCategoriesUc,
    required this.addCategoryUc,
  }) : super(CategoriesInitial()) {
    on<CategoryInitEvent>(_initializeCategories);
    on<AddCategoryEvent>(_addCategory);
  }

  FutureOr<void> _initializeCategories(
    CategoryInitEvent event,
    Emitter<CategoriesState> emit,
  ) async {
    emit(CategoriesLoading());
    var response = await loadIncomeCategoriesUc();
    response.fold(
      (failure) => emit(CategoriesError(message: Message.fromFailure(failure))),
      (categories) {
        incomeCategories
          ..clear()
          ..addAll(categories);
      },
    );
    response = await loadPaymentCategoriesUc();
    response.fold(
        (failure) =>
            emit(CategoriesError(message: Message.fromFailure(failure))),
        (categories) {
      paymentCategories
        ..clear()
        ..addAll(categories);
    });
    emit(CategoriesLoaded(
      incomeCategories: incomeCategories,
      paymentCategories: paymentCategories,
    ));
  }

  FutureOr<void> _addCategory(
      AddCategoryEvent event, Emitter<CategoriesState> emit) async {
    await addCategoryUc.call(param: event.category);
  }
}
