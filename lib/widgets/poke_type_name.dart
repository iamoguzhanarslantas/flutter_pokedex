import 'package:flutter/material.dart';
import 'package:flutter_pokedex/constants/theme_constants.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';

class PokeTypeName extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeTypeName({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                pokemon.name ?? '',
                style: ThemeConstants.getPokemonNameTextStyle(),
              ),
              Text(
                '#${pokemon.num}',
                style: ThemeConstants.getPokemonNameTextStyle(),
              ),
            ],
          ),
          Chip(
            label: Text(
              pokemon.type?.join(' , ') ?? '',
              style: ThemeConstants.getTypeChipTextStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
