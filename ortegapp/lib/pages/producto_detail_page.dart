import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_authentication/models/producto.dart';

class ProductoDetail extends StatelessWidget {
  const ProductoDetail({Key? key, required this.producto}) : super(key: key);
  final Producto producto;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Detalle producto'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(producto.nombre.toString(),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
            Padding(
              padding: EdgeInsets.all(20),
              child: Image(
              image: NetworkImage(producto.foto.toString()),
              height: 200),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text('Tipo: ' +producto.tipo.toString(),
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),),
                  Text('Precio: '+producto.precio.toString()+'€',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),),
                  Text('Descripcion: '+ producto.descripcion.toString(),
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15))
                ]),)

          ],
        )
      ),
      
    );
  }
  

}

