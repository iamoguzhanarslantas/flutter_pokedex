import 'package:flutter/material.dart';
import 'package:flutter_pokedex/constants/theme_constants.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';

class PokeInfo extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeInfo({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildInfoRow('Name', pokemon.name),
          _buildInfoRow('Height', pokemon.height),
          _buildInfoRow('Weight', pokemon.weight),
          _buildInfoRow('Spawn Time', pokemon.spawnTime),
          _buildInfoRow('Weaknesses', pokemon.weaknesses),
          _buildInfoRow('Pre Evolution', pokemon.prevEvolution),
          _buildInfoRow('Next Evolution', pokemon.nextEvolution),
        ],
      ),
    );
  }

  _buildInfoRow(String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: ThemeConstants.getPokeInfoLabelTextStyle(),
          ),
          if (value is List && value.isNotEmpty)
            Text(
              value.join(' , '),
              style: ThemeConstants.getPokeInfoTextStyle(),
            )
          else if (value == null)
            Text(
              'Not available',
              style: ThemeConstants.getPokeInfoTextStyle(),
            )
          else
            Text(
              value,
              style: ThemeConstants.getPokeInfoTextStyle(),
            ),
        ],
      ),
    );
  }
}
