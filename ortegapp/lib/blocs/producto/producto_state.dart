part of 'producto_bloc.dart';

enum ProductoStatus { initial, success, failure }

class ProductoState extends Equatable {
  const ProductoState({
    this.status = ProductoStatus.initial,
    this.producto = const <Producto>[],
    this.hasReachedMax = false,
  });

  final ProductoStatus status;
  final List<Producto> producto;
  final bool hasReachedMax;

  ProductoState copyWith({
    ProductoStatus? status,
    List<Producto>? producto,
    bool? hasReachedMax,
  }) {
    return ProductoState(
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