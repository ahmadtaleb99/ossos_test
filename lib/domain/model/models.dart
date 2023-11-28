import 'package:equatable/equatable.dart';




class Pokemon extends Equatable{

  final String url;
  final String name;
   final String? image;

   Pokemon({required this.url,required this.name,required this.image});

  @override
  List<Object?> get props => [url,name,image];

  Pokemon copyWith({
    String? id,
    String? name,
    String? image,
  }) {
    return Pokemon(
      url: id ?? this.url,
      name: name ?? this.name,
        image: image ?? this.image
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
