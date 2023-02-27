class RegisterRequest {
  String username;
  String password;
  String verifyPassword;
  String email;
  String telefono;
  String nombre;

  RegisterRequest(
      {required this.username,
      required this.password,
      required this.verifyPassword,
      required this.email,
      required this.telefono,
      required this.nombre});


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['verifyPassword'] = verifyPassword;
    data['email'] = email;
    data['telefono'] = telefono;
    data['nombre'] = nombre;
    return data;
  }
}

class RegisterResponse {
  String? id;
  String? username;
  String? avatar;
  String? nombre;
  String? email;
  String? createdAt;

  RegisterResponse(
      {this.id,
      this.username,
      this.avatar,
      this.nombre,
      this.email,
      this.createdAt});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    avatar = json['avatar'];
    nombre = json['nombre'];
    email = json['email'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['avatar'] = this.avatar;
    data['nombre'] = this.nombre;
    data['email'] = this.email;
    data['createdAt'] = this.createdAt;
    return data;
  }
}