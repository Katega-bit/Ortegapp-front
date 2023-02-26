class ProductoList {
  List<Producto>? content;
  int? totalElements;
  int? totalPages;
  int? page;

  ProductoList({this.content, this.totalElements, this.totalPages, this.page});

  ProductoList.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Producto>[];
      json['content'].forEach((v) {
        content!.add(new Producto.fromJson(v));
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

class Producto {
  int? id;
  String? nombre;
  String? foto;
  String? tipo;
  String? descripcion;
  double? precio;
  List<String>? likes;
  List<Comentario>? comentarios;

  Producto(
      {this.id,
      this.nombre,
      this.foto,
      this.tipo,
      this.descripcion,
      this.precio,
      this.likes,
      this.comentarios});

  Producto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    foto = json['foto'];
    tipo = json['tipo'];
    descripcion = json['descripcion'];
    precio = json['precio'];
    if (json['comentarios'] != null) {
      comentarios = <Comentario>[];
      json['comentarios'].forEach((v) {
        comentarios!.add(new Comentario.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nombre'] = this.nombre;
    data['foto'] = this.foto;
    data['tipo'] = this.tipo;
    data['descripcion'] = this.descripcion;
    data['precio'] = this.precio;
    if (this.comentarios != null) {
      data['comentarios'] = this.comentarios!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comentario{
  int? idComentario;
  String? producto;
  String? user;
  String? avatar;
  String? fullname;

  String? mensaje;


Comentario(
{
this.idComentario,
this.producto,
this.user,
this.avatar,
this.fullname,
this.mensaje
});

  Comentario.fromJson(Map<String, dynamic> json) {
    idComentario =json['id'];
    producto= json['producto'];
    user = json['user'];
    avatar = json['avatar'];
    fullname = json['fullname'];
    mensaje = json['mensaje'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.idComentario;
    data['producto'] = this.producto;
    data['user'] = this.user;
    data['avatar'] = this.avatar;
    data['fullname'] =  this.fullname;
    data['mensaje'] = this.mensaje;
    return data;
  }

}