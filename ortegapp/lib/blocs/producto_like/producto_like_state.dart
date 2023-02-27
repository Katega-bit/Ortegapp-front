part of 'producto_like_bloc.dart';

enum ProductoLikeStatus { initial, success, failure }

class ProductoLikeState extends Equatable {
  const ProductoLikeState({
    this.status = ProductoLikeStatus.initial,
    this.producto = const <Producto>[],
    this.hasReachedMax = false,
  });

  final ProductoLikeStatus status;
  final List<Producto> producto;
  final bool hasReachedMax;

  ProductoLikeState copyWith({
    ProductoLikeStatus? status,
    List<Producto>? producto,
    bool? hasReachedMax,
  }) {
    return ProductoLikeState(
      status: status ?? this.status,
      producto: producto ?? this.producto,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  String toString() {
    return '''ProductoState { status: $status, hasReachedMax: $hasReachedMax, posts: ${producto.length} }''';
  }

  @override
  List<Object> get props => [status, producto, hasReachedMax];
}