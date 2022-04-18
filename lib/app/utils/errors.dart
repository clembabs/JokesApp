import 'package:equatable/equatable.dart';

/// Server Exception
class ServerException implements Exception {}

/// Server Exception
class CacheException implements Exception {}

/// Abstract class that models the most common failures scenarios
abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

/// Server Failure
class ServerFailure extends Failure {}

/// Cache Failure
class CacheFailure extends Failure {}
