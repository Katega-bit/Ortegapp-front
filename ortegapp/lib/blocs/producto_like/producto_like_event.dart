part of 'producto_like_bloc.dart';

abstract class ProductoLikeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ProductoLikeFetched extends ProductoLikeEvent {}

