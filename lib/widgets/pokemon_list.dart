import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';
import 'package:flutter_pokedex/services/pokedex_api.dart';
import 'package:flutter_pokedex/widgets/pokelist_item.dart';

class PokemonList extends StatelessWidget {
  final Orientation orientation;
  const PokemonList({super.key, required this.orientation});

  @override
  Widget build(BuildContext context) {
    final pokemonListFuture = PokeApi.getPokemonData();

    return FutureBuilder<List<PokemonModel>>(
      future: pokemonListFuture,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<PokemonModel> listem = snapshot.data!;

          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            ),
            itemCount: listem.length,
            itemBuilder: (context, index) {
              var oankiPokemon = listem[index];
              return PokeListItem(
                pokemon: oankiPokemon,
                orientation: orientation,
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Veri Gelmedi'),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
