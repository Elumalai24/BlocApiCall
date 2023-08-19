import 'package:equatable/equatable.dart';

import '../model/product.dart';

abstract class ProductState extends Equatable {}

class LoadingState extends ProductState {
  @override
  List<Object?> get props => [];
}

class LoadedState extends ProductState {
  final List<Product> products;
  LoadedState(this.products);
  @override
  List<Object?> get props => [];
}

class ErrorState extends ProductState {
  final String error;
  ErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
