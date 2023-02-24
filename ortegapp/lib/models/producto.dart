import 'package:flutter_bloc_authentication/models/models.dart';

class ProductoList {
  List<ProductoResponse>? content;
  int? totalElements;
  int? totalPages;
  int? page;

  ProductoList({this.content, this.totalElements, this.totalPages, this.page});

  ProductoList.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <ProductoResponse>[];
      json['content'].forEach((v) {
        content!.add(new ProductoResponse.fromJson(v));
      });
    }
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
    page = json['page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    data['totalElements'] = this.totalElements;
    data['totalPages'] = this.totalPages;
    data['page'] = this.page;
    return data;
  }
}

class ProductoResponse {
  int? id;
  String? nombre;
  String? foto;
  String? tipo;
  String? descripcion;
  double? precio;
  List<User>? likes;

  ProductoResponse(
      {this.id,
      this.nombre,
      this.foto,
      this.tipo,
      this.descripcion,
      this.precio,
      this.likes});

  ProductoResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    foto = json['foto'];
    tipo = json['tipo'];
    descripcion = json['descripcion'];
    precio = json['precio'];
  
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nombre'] = this.nombre;
    data['foto'] = this.foto;
    data['tipo'] = this.tipo;
    data['descripcion'] = this.descripcion;
    data['precio'] = this.precio;

    return data;
  }
}