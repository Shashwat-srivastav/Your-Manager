// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MyData {
  static List<data> detail = [];
}

class data {
  String id;
  String name;
  String Bcolor;
  data({
    required this.id,
    required this.name,
    required this.Bcolor,
  });

  data copyWith({
    String? id,
    String? name,
    String? Bcolor,
  }) {
    return data(
      id: id ?? this.id,
      name: name ?? this.name,
      Bcolor: Bcolor ?? this.Bcolor,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'Bcolor': Bcolor,
    };
  }

  factory data.fromMap(Map<String, dynamic> map) {
    return data(
      id: map['id'] as String,
      name: map['name'] as String,
      Bcolor: map['Bcolor'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory data.fromJson(String source) =>
      data.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'data(id: $id, name: $name, Bcolor: $Bcolor)';

  @override
  bool operator ==(covariant data other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name && other.Bcolor == Bcolor;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ Bcolor.hashCode;
}
