import 'package:equatable/equatable.dart';




class Pokemon extends Equatable{

  final String id;
  final String name;
  final String image;

  const Pokemon({required this.id, required this.name, required this.image});

  @override
  List<Object?> get props => [id,name,image];

  Pokemon copyWith({
    String? id,
    String? name,
    String? image,
  }) {
    return Pokemon(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }
}
