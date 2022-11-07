import 'package:flutter/material.dart';
import 'package:flutter_pokedex/constants/theme_constants.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';
import 'package:flutter_pokedex/pages/detail_page.dart';
import 'package:flutter_pokedex/widgets/poke_img_ball.dart';

class PokeListItem extends StatelessWidget {
  final PokemonModel pokemon;
  final Orientation orientation;
  const PokeListItem(
      {required this.pokemon, super.key, required this.orientation});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(
              pokemon: pokemon,
              orientation: orientation,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        elevation: 8,
        shadowColor: Colors.white,
        color: ThemeConstants.getColorFromType(pokemon.type![0]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  pokemon.name ?? 'N/A',
                  style: ThemeConstants.getPokemonNameTextStyle(),
                ),
              ),
              Expanded(
                flex: 1,
                child: Chip(
                  label: Text(
                    pokemon.type![0],
                    style: ThemeConstants.getTypeChipTextStyle(),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: PokeImageBall(
                  pokemon: pokemon,
                  orientation: orientation,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
