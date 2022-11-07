import 'package:flutter/material.dart';
import 'package:flutter_pokedex/constants/theme_constants.dart';

class AppTitle extends StatelessWidget {
  final Orientation orientation;
  const AppTitle({super.key, required this.orientation});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 5,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  ThemeConstants.title,
                  style: ThemeConstants.getTitleTextStyle(),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Image.asset(
                ThemeConstants.pokeballImageUrl,
                width: ThemeConstants.calculatePokeImgBallSize(
                    context: context, orientation: orientation),
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
