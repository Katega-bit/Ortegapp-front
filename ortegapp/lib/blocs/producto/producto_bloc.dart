import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_authentication/models/producto.dart';
import 'package:get_it/get_it.dart';
import '../../repositories/producto_repository.dart';
import 'producto.dart';
import 'package:stream_transform/stream_transform.dart';
part 'producto_event.dart';
part 'producto_state.dart';


const throttleDuration = Duration(milliseconds: 100);
int page = -1;
EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}


class ProductoBloc extends Bloc<ProductoEvent, ProductoState>{
      final ProductoRepository productoRepository;


    ProductoBloc(this.productoRepository) : super(const ProductoState()) {
    on<ProductoFetched>(
      _onProductosFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }


  Future<void> _onProductosFetched(ProductoFetched event, Emitter<ProductoState> emitter) async{
        if (state.hasReachedMax) return;
    try {
      if (state.status == ProductoStatus.initial) {
        page = 0;
        final response = await productoRepository.fetchProductos(page);
        final producto = response;
        return emitter(state.copyWith(
          status: ProductoStatus.success,
          producto: producto.content,
          hasReachedMax: response.totalPages! - 1 <= page,
        ));
      }
      page += 1;
      final response = await productoRepository.fetchProductos(page);
      final favPosts = response;

      emitter(state.copyWith(
          status: ProductoStatus.success,
          producto: List.of(state.producto)..addAll(favPosts.content!),
          hasReachedMax: response.totalPages! - 1 <= page));
    } catch (_) {
      emitter(state.copyWith(status: ProductoStatus.failure));
    }
  }
  }

