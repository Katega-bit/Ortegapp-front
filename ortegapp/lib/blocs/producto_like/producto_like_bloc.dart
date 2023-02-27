import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_authentication/models/producto.dart';
import 'package:get_it/get_it.dart';
import '../../repositories/producto_repository.dart';
import 'producto_like.dart';
import 'package:stream_transform/stream_transform.dart';
part 'producto_like_event.dart';
part 'producto_like_state.dart';


const throttleDuration = Duration(milliseconds: 100);
int page = -1;
EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}


class ProductoLikeBloc extends Bloc<ProductoLikeEvent, ProductoLikeState>{
      final ProductoRepository productoRepository;


    ProductoLikeBloc(this.productoRepository) : super(const ProductoLikeState()) {
    on<ProductoLikeFetched>(
      _onProductosLikeFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }



  Future<void> _onProductosLikeFetched(ProductoLikeFetched event, Emitter<ProductoLikeState> emitter) async{
        if (state.hasReachedMax) return;
    try {
      if (state.status == ProductoLikeStatus.initial) {
        page = 0;
        final response = await productoRepository.fetchProductosLike(page);
        final producto = response;
        return emitter(state.copyWith(
          status: ProductoLikeStatus.success,
          producto: producto.content,
          hasReachedMax: response.totalPages! - 1 <= page,
        ));
      }
      page += 1;
      final response = await productoRepository.fetchProductosLike(page);
      final favPosts = response;

      emitter(state.copyWith(
          status: ProductoLikeStatus.success,
          producto: List.of(state.producto)..addAll(favPosts.content!),
          hasReachedMax: response.totalPages! - 1 <= page));
    } catch (_) {
      emitter(state.copyWith(status: ProductoLikeStatus.failure));
    }
  }

  }

