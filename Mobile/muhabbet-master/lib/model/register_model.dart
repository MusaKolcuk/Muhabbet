// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RegisterModel {
  bool? success;
  String? accessToken;
  Data? data;
  RegisterModel({
    this.success,
    this.accessToken,
    this.data,
  });



  RegisterModel copyWith({
    bool? success,
    String? accessToken,
    Data? data,
  }) {
    return RegisterModel(
      success: success ?? this.success,
      accessToken: accessToken ?? this.accessToken,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'success': success,
      'accessToken': accessToken,
      'data': data?.toMap(),
    };
  }

  factory RegisterModel.fromMap(Map<String, dynamic> map) {
    return RegisterModel(
      success: map['success'] != null ? map['success'] as bool : null,
      accessToken: map['accessToken'] != null ? map['accessToken'] as String : null,
      data: map['data'] != null ? Data.fromMap(map['data'] as Map<String,dynamic>) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterModel.fromJson(String source) => RegisterModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'RegisterModel(success: $success, accessToken: $accessToken, data: $data)';

  @override
  bool operator ==(covariant RegisterModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.success == success &&
      other.accessToken == accessToken &&
      other.data == data;
  }

  @override
  int get hashCode => success.hashCode ^ accessToken.hashCode ^ data.hashCode;
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

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Data(name: $name, email: $email, id: $id)';

  @override
  bool operator ==(covariant Data other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode ^ id.hashCode;
}
