import 'package:flutter/material.dart';

class ThemeConstants {
  ThemeConstants._();

  static String title = 'Pokedex';

  static TextStyle getTitleTextStyle() {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 48,
    );
  }

  static TextStyle getPokemonNameTextStyle() {
    return const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 28,
    );
  }

  static TextStyle getTypeChipTextStyle() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 22,
    );
  }

  static const String pokeballImageUrl = 'images/pokeball.png';

  static double calculatePokeImgBallSize(
      {required BuildContext context, required Orientation orientation}) {
    if (orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.width / 2;
    } else {
      return MediaQuery.of(context).size.width / 5;
    }
  }

  static double calculatePokeInfoImgBallSize(
      {required BuildContext context, required Orientation orientation}) {
    if (orientation == Orientation.portrait) {
      return MediaQuery.of(context).size.width / 4.5;
    } else {
      return MediaQuery.of(context).size.width / 8;
    }
  }

  static final Map<String, Color> _typeColorMap = {
    'Grass': Colors.green,
    'Fire': Colors.redAccent,
    'Water': Colors.blue,
    'Electric': Colors.yellow,
    'Rock': Colors.grey,
    'Ground': Colors.brown,
    'Bug': Colors.lightGreenAccent.shade700,
    'Psychic': Colors.indigo,
    'Fighting': Colors.orange,
    'Ghost': Colors.deepPurple,
    'Normal': Colors.black26,
    'Poison': Colors.deepPurpleAccent,
  };

  static Color getColorFromType(String type) {
    if (_typeColorMap.containsKey(type)) {
      return _typeColorMap[type] ?? Colors.pink.shade300;
    } else {
      return Colors.pink.shade300;
    }
  }

  static getPokeInfoTextStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 18,
    );
  }

  static getPokeInfoLabelTextStyle() {
    return const TextStyle(
      color: Colors.black,
      fontSize: 25,
      fontWeight: FontWeight.bold,
    );
  }
}
