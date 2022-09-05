import 'package:dartz/dartz.dart';

import '/core/error/failure.dart';
import '/domain/entities/entities.dart';
import '/domain/repositories/repository.dart';
import '/domain/usecase/base_usecase.dart';

class ShippingEditUsecase
    implements BaseUsecase<ShippingEditEntity, CustomerDetailEntity> {
  final Repository _repository;
  ShippingEditUsecase(this._repository);
  @override
  Future<Either<Failure, CustomerDetailEntity>> execute(
      ShippingEditEntity shippingEditEntity) async {
    return _repository.updateShippingInformations(
        shippingEditEntity.userId, shippingEditEntity.shippingEntity);
  }
}

class ShippingEditEntity {
  int userId;
  ShippingEntity shippingEntity;
  ShippingEditEntity(this.userId, this.shippingEntity);
}
