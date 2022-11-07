import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/constants/theme_constants.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';

class PokeImageBall extends StatelessWidget {
  final PokemonModel pokemon;
  final Orientation orientation;

  const PokeImageBall(
      {super.key, required this.pokemon, required this.orientation});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            ThemeConstants.pokeballImageUrl,
            width: ThemeConstants.calculatePokeImgBallSize(
                context: context, orientation: orientation),
            height: ThemeConstants.calculatePokeImgBallSize(
                context: context, orientation: orientation),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id!,
            child: CachedNetworkImage(
              imageUrl: pokemon.img ?? '',
              errorWidget: (context, url, error) =>
                  const Icon(Icons.catching_pokemon),
              width: ThemeConstants.calculatePokeImgBallSize(
                  context: context, orientation: orientation),
              height: ThemeConstants.calculatePokeImgBallSize(
                  context: context, orientation: orientation),
              placeholder: (context, url) => CircularProgressIndicator(
                color: ThemeConstants.getColorFromType(pokemon.type![0]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
