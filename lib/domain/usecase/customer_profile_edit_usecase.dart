import 'package:cartanawc_app/core/error/failure.dart';
import 'package:cartanawc_app/domain/entities/entities.dart';
import 'package:cartanawc_app/domain/repositories/repository.dart';
import 'package:cartanawc_app/domain/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

class ShippingEditUsecase
    implements BaseUsecase<ShippingEditEntity, CustomerDetailEntity> {
  final Repository _repository;
  ShippingEditUsecase(this._repository);
  @override
  Future<Either<Failure, CustomerDetailEntity>> execute(
    ShippingEditEntity shippingEditEntity,
  ) async {
    return _repository.updateShippingInformations(
      shippingEditEntity.userId,
      shippingEditEntity.shippingEntity,
    );
  }
}

class ShippingEditEntity {
  int userId;
  ShippingEntity shippingEntity;
  ShippingEditEntity(this.userId, this.shippingEntity);
}
