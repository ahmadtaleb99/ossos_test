import 'package:equatable/equatable.dart';




class Pokemon extends Equatable{

  final String url;
  final String name;

  const Pokemon({required this.url,required this.name});

  @override
  List<Object?> get props => [url,name];

  Pokemon copyWith({
    String? id,
    String? name,
  }) {
    return Pokemon(
      url: id ?? this.url,
      name: name ?? this.name
    );
  }
}



class PokemonDetails extends Equatable{

  final int id;
  final String name;
  final String image;


  @override
  List<Object?> get props => [id,name,image];

  const PokemonDetails({
    required this.id,
    required this.name,
    required this.image,
  });

  PokemonDetails copyWith({
    int? id,
    String? name,
    String? image,
  }) {
    return PokemonDetails(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }
}
