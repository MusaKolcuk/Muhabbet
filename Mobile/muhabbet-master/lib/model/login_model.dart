// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LoginModel {
  bool? success;
  String? access_token;
  Data? data;
  LoginModel({
    this.success,
    this.access_token,
    this.data,
  });

  LoginModel copyWith({
    bool? success,
    String? access_token,
    Data? data,
  }) {
    return LoginModel(
      success: success ?? this.success,
      access_token: access_token ?? access_token,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'access_token': access_token,
      'data': data?.toMap(),
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      success: map['success'] != null ? map['success'] as bool : null,
      access_token:
          map['access_token'] != null ? map['access_token'] as String : null,
      data: map['data'] != null
          ? Data.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) =>
      LoginModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LoginModel(success: $success, access_token: $access_token, data: $data)';

  @override
  bool operator ==(covariant LoginModel other) {
    if (identical(this, other)) return true;

    return other.success == success &&
        other.access_token == access_token &&
        other.data == data;
  }

  @override
  int get hashCode => success.hashCode ^ access_token.hashCode ^ data.hashCode;
}

class Data {
  String? name;
  String? email;
  String? id;
  Data({
    this.name,
    this.email,
    this.id,
  });

  Data copyWith({
    String? name,
    String? email,
    String? id,
  }) {
    return Data(
      name: name ?? this.name,
      email: email ?? this.email,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'id': id,
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) =>
      Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Data(name: $name, email: $email, id: $id)';

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;

    return other.name == name && other.email == email && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ id.hashCode;
}
