import '../../features/app/domain/entities/operation_type.dart';
import '../../features/categories/domain/entities/category.dart';

List<Category> get defaultCategory => [
      Category(
        name: "food",
        type: OperationType.payment,
      ),
      Category(
        name: "salary",
        type: OperationType.income,
      ),
      Category(
        name: "transportation",
        type: OperationType.payment,
      ),
      Category(
        name: "gift",
        type: OperationType.payment,
      ),
      Category(
        name: "gift",
        type: OperationType.income,
      ),
    ];
