import 'package:aflutterapp/bloc/pokemon_event.dart';
import 'package:aflutterapp/bloc/pokemon_state.dart';
import 'package:aflutterapp/pokemon_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final _pokemonRepository = PokemonRepository();

  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonPageRequest>(_onPokemonPageRequest);
  }

  Future<void> _onPokemonPageRequest(
      PokemonPageRequest event, Emitter<PokemonState> emit) async {
    emit(PokemonLoadingProgress());
    try {
      final pokemonPageResponse =
          await _pokemonRepository.getPokemonPage(event.page);
      emit(PokemonPageLoadSuccess(
          pokemonListings: pokemonPageResponse.pokemonListing,
          canLoadNextPage: pokemonPageResponse.canLoadNextPage));
    } catch (e) {
      emit(PokemonPageLoadFailed(error: e as Error));
    }
  }
}
