import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pokedex/constants/theme_constants.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';
import 'package:flutter_pokedex/widgets/poke_info.dart';
import 'package:flutter_pokedex/widgets/poke_type_name.dart';

class DetailPage extends StatelessWidget {
  final PokemonModel pokemon;
  final Orientation orientation;
  const DetailPage(
      {super.key, required this.pokemon, required this.orientation});

  @override
  Widget build(BuildContext context) {
    return orientation == Orientation.portrait
        ? _buildPortrait(context)
        : _buildLandscape(context);
  }

  Scaffold _buildLandscape(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConstants.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        PokeTypeName(pokemon: pokemon),
                        Expanded(
                          child: Hero(
                            tag: pokemon.id!,
                            child: CachedNetworkImage(
                              imageUrl: pokemon.img ?? '',
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PokeInfo(pokemon: pokemon),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Scaffold _buildPortrait(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeConstants.getColorFromType(pokemon.type![0]),
      body: OrientationBuilder(builder: (context, orientation) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                ),
              ),
              PokeTypeName(pokemon: pokemon),
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Image.asset(
                        ThemeConstants.pokeballImageUrl,
                        height: ThemeConstants.calculatePokeInfoImgBallSize(
                            context: context, orientation: orientation),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      top: MediaQuery.of(context).size.height / 10,
                      child: PokeInfo(pokemon: pokemon),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Hero(
                        tag: pokemon.id!,
                        child: CachedNetworkImage(
                          imageUrl: pokemon.img ?? '',
                          height: MediaQuery.of(context).size.height / 3,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
