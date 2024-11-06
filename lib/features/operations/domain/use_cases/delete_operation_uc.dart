import 'package:Dinar/core/errors/failures.dart';
import 'package:Dinar/core/use_case/use_case.dart';
import 'package:Dinar/features/operations/domain/repositories/operations_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteOperationUc extends UseCase<void, String> {
  final OperationsRepository repository;

  DeleteOperationUc({required this.repository});

  @override
  Future<Either<Failure, void>> call({required String param}) async =>
      await repository.deleteOperation(param);
}
