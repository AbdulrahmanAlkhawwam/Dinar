import '../../features/app/domain/entities/operation_type.dart';
import '../../features/categories/domain/entities/category.dart';

List<Category> get defaultCategory => [
      Category(
        null,
        name: "food",
        type: OperationType.payment,
      ),
      Category(
        null,
        name: "salary",
        type: OperationType.income,
      ),
      Category(
        null,
        name: "transportation",
        type: OperationType.payment,
      ),
      Category(
        null,
        name: "gift",
        type: OperationType.payment,
      ),
      Category(
        null,
        name: "gift",
        type: OperationType.income,
      ),
    ];
