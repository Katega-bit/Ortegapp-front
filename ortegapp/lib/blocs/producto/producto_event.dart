part of 'producto_bloc.dart';

abstract class ProductoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductoFetched extends ProductoEvent {}

