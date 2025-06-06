import 'package:aflutterapp/pokemon_page_response.dart';

abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonLoadingProgress extends PokemonState{}

class PokemonPageLoadSuccess extends PokemonState{
  final List<PokemonListing> pokemonListings;
  final bool canLoadNextPage;

  PokemonPageLoadSuccess({required this.pokemonListings, required this.canLoadNextPage});
}

class PokemonPageLoadFailed extends PokemonState {
  final Error error;

  PokemonPageLoadFailed({required this.error});
} 