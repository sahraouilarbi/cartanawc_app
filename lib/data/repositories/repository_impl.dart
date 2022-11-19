import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '/core/error/error_handler.dart';
import '/core/error/failure.dart';
import '/core/prefs/app_prefs.dart';
import '/data/data_source/remote_data_source.dart';
import '/data/mapper/mappers.dart';
import '/data/models/login_request.dart';
import '/data/models/models.dart';
import '/data/network/network_info.dart';
import '/domain/entities/entities.dart';
import '/domain/repositories/repository.dart';

class RepositoryImpl implements Repository {
  RepositoryImpl(
      this._remoteDataSource, this._networkInfo, this._appPreferences);
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  final AppPreferences _appPreferences;

  // Login repository implementation
  @override
  Future<Either<Failure, LoginResponseModel>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final _response = await _remoteDataSource.login(loginRequest);
        if (_response.statusCode == 200) {
          return Right(_response);
        } else {
          return Left(Failure(_response.statusCode!, _response.message!));
        }
      } catch (_error) {
        return Left(ErrorHandler.handle(_error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  // Forgot password repository implementation
  @override
  Future<Either<Failure, ResetPasswordResponseEntity>> forgotPassword(
      String email) async {
    if (await _networkInfo.isConnected) {
      try {
        final _response = await _remoteDataSource.forgotPassword(email);
        return Right(_response.toDomain());
      } catch (_error) {
        return Left(ErrorHandler.handle(_error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  // Get customer profile repository implementation
  @override
  Future<Either<Failure, CustomerDetailEntity>> getCustomerProfile(
      int userId) async {
    final userID = await _appPreferences.getUserId();
    if (await _networkInfo.isConnected) {
      try {
        final _response = await _remoteDataSource.getCustomerProfile(userID);
        if (true) {
          return Right(_response.toDomain());
        }
      } catch (_error) {
        return Left(ErrorHandler.handle(_error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  // Update Shipping Informations repository implementation
  @override
  Future<Either<Failure, CustomerDetailEntity>> updateShippingInformations(
      int _userId, ShippingEntity _shippingEntity) async {
    if (await _networkInfo.isConnected) {
      try {
        final _response = await _remoteDataSource.updateShippingInformations(
            _userId, _shippingEntity.toModel());
        if (true) {
          return Right(_response.toDomain());
        }
      } catch (_error) {
        return Left(ErrorHandler.handle(_error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, CartResponseEntity>> addToCart(
      CartRequestEntity _cart) async {
    if (await _networkInfo.isConnected) {
      try {
        final _response = await _remoteDataSource.addToCart(_cart.toModel());
        return Right(_response.toDomain());
      } catch (_error) {
        return Left(ErrorHandler.handle(_error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> createOrder(
      OrderEntity _order) async {
    if (await _networkInfo.isConnected) {
      try {
        final _response = await _remoteDataSource.createOrder(_order.toModel());
        return Right(_response);
      } catch (_error) {
        return Left(ErrorHandler.handle(_error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, CartResponseEntity>> getCartItems(
      int customerId) async {
    if (await _networkInfo.isConnected) {
      try {
        final _response = await _remoteDataSource.getCartItem();
        return Right(_response.toDomain());
      } catch (_error) {
        return Left(ErrorHandler.handle(_error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    if (await _networkInfo.isConnected) {
      try {
        final _response = await _remoteDataSource.getCategories();
        final List<CategoryEntity> _categories =
            List<CategoryEntity>.from(_response.map((e) => e.toDomain()));
        return Right(_categories);
      } catch (_error) {
        return Left(ErrorHandler.handle(_error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, OrderDetailEntity>> getOrderDetails(
      int orderId) async {
    if (await _networkInfo.isConnected) {
      try {
        final _response = await _remoteDataSource.getOrderDetails(orderId);
        return Right(_response.toDomain());
      } catch (_error) {
        return Left(ErrorHandler.handle(_error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> getOrders(
    int customerID, {
    int? pageNumber = 1,
    int? perPage = 10,
    String? search,
    String? after,
    String? before,
    String? sortOrder = 'desc',
    String? sortBy = 'date',
    String? status = 'any',
    int? product,
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        final _response = await _remoteDataSource.getOrders(
          customerID,
          pageNumber: pageNumber,
          perPage: perPage,
          search: search,
          after: after,
          before: before,
          sortOrder: sortOrder,
          sortBy: sortBy,
          status: status,
          product: product,
        );
        final List<OrderEntity> _orderEntity =
            List<OrderEntity>.from(_response.map((e) => e.toDomain()));
        return Right(_orderEntity);
      } catch (_error) {
        return Left(ErrorHandler.handle(_error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts(
    String customerRole, {
    String? status = 'publish',
    String? strSearch,
    int? perPage = 100,
    int? pageNumber,
    String? tagName,
    List<int>? productsIds,
    String? categoryId,
    String? sortBy,
    String? sortOrder = 'asc',
  }) async {
    if (await _networkInfo.isConnected) {
      try {
        final _response = await _remoteDataSource.getProducts(
          status: status,
          strSearch: strSearch,
          perPage: perPage,
          pageNumber: pageNumber,
          tagName: tagName,
          productsIds: productsIds,
          categoryId: categoryId,
          sortBy: sortBy,
          sortOrder: sortOrder,
        );
        final List<ProductEntity> _products =
            List<ProductEntity>.from(_response.map((e) => e.toDomain()));
        return Right(_products);
      } catch (_error) {
        return Left(ErrorHandler.handle(_error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, List<PaymentGatewaysEntity>>>
      getPaymentGateways() async {
    if (await _networkInfo.isConnected) {
      try {
        final _response = await _remoteDataSource.getPaymentGateways();
        final List<PaymentGatewaysEntity> _paymentGateways =
            List<PaymentGatewaysEntity>.from(
                _response.map((e) => e.toDomain()));
        return Right(_paymentGateways);
      } catch (_error) {
        return Left(ErrorHandler.handle(_error).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<Either<Failure, DevenirDistributeurResponseEntity>>
      devenirDistributeur(DevenirDistributeurRequestEntity _formData) async {
    if (await _networkInfo.isConnected) {
      try {
        final _response =
            await _remoteDataSource.devenirDistributeur(_formData.toModel());
        return Right(_response.toDomain());
      } catch (_error) {
        return Left(ErrorHandler.handle(_error.toString()).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }

  // Get Paiements
  @override
  Future<Either<Failure, List<PaiementEntity>>> getPaiements(
      int customerId) async {
    if (await _networkInfo.isConnected) {
      try {
        final _response = await _remoteDataSource.getPaiements();
        final List<PaiementEntity> _paiements =
            List<PaiementEntity>.from(_response.map((e) => e.toDomain()))
                .where((element) {
          return element.acf.client.id == customerId;
        }).toList();

        return Right(_paiements);
      } catch (_error) {
        debugPrint(_error.toString());
        return Left(ErrorHandler.handle(_error.toString()).failure);
      }
    } else {
      return Left(DataSource.noInternetConnection.getFailure());
    }
  }
}
