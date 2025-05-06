// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class GenreModel extends Equatable {
  final int? id;
  final String? name;

  const GenreModel({this.id, this.name});

  GenreModel copyWith({int? id, String? name}) {
    return GenreModel(id: id ?? this.id, name: name ?? this.name);
  }

  factory GenreModel.fromMap(Map<String, dynamic> map) {
    return GenreModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  @override
  List<Object?> get props => [id, name];

  factory GenreModel.fromJson(String source) =>
      GenreModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
