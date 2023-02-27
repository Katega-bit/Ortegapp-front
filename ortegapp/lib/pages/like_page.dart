import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_authentication/pages/producto_detail_page.dart';
import 'package:flutter_bloc_authentication/repositories/producto_repository.dart';
import '../blocs/producto/producto_bloc.dart';
import '../blocs/producto_like/producto_like_bloc.dart';
import '../models/producto.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({Key? key, required this.idProducto}) : super(key: key);
  final int idProducto;

  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _isLiked = false;
  final _postRepository = ProductoRepository();
  final int idProducto = 1;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      
      onTap: () {
        setState(() {
          _postRepository.productoLike(widget.idProducto);
          _isLiked = !_isLiked;
        });

      },
      child: Icon(
        _isLiked ? Icons.delete : Icons.delete,
        color:  Colors.red,
        size: 30,
      ),
    );
  }
}


class LikePage extends StatelessWidget {
  const LikePage({super.key});

  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 1;
    return BlocProvider(
      create: (context) => ProductoLikeBloc(ProductoRepository())..add(ProductoLikeFetched()),
      child: Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
    final _scrollController = ScrollController();

    @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

    bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

    void _onScroll() {
    if (_isBottom) context.read<ProductoLikeBloc>().add(ProductoLikeFetched());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductoLikeBloc, ProductoLikeState>(
      builder: (context, state) {
                      return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return index >= state.producto.length
                    ? const BottomLoader()
                    : ProductoItem(producto: state.producto[index]);
              },
              itemCount: state.hasReachedMax
                  ? state.producto.length
                  : state.producto.length + 1,
              controller: _scrollController,
            );
      },
    );
  }
}
class BottomLoader extends StatelessWidget {
  const BottomLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Padding(
      padding: EdgeInsets.only(top: 6, bottom: 6),
      child: SizedBox(
        height: 24,
        width: 24,
        child: CircularProgressIndicator(strokeWidth: 1.5),
      ),
    ));
  }
}

class ProductoItem extends StatelessWidget {
  const ProductoItem({super.key, required this.producto});

  final Producto producto;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
        child: GestureDetector(
            child: Container(
              height: 300,
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [

                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(
                          child: Text(producto.nombre!,
                           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                        ),
                      ),
                      Center(
                        child: Image(
                          image: NetworkImage(producto.foto!),
                          height: 180,)
                      ),
                      LikeButton(
                        idProducto: int.parse('${producto.id}'),
                      ),
                    ]),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 5,
                margin: EdgeInsets.all(10),
              ),
            ),
            ));
            
  }
}

