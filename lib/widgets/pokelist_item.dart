import 'package:flutter/material.dart';
import 'package:flutter_proje_4/constants/constants.dart';
import 'package:flutter_proje_4/constants/ui_helper.dart';
import 'package:flutter_proje_4/model/pokemon_model.dart';
import 'package:flutter_proje_4/pages/detail_page.dart';
import 'package:flutter_proje_4/widgets/poke_img_ball.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokeListItem extends StatelessWidget {
  final PokemonModel pokemon;

  const PokeListItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailPage(pokemon: pokemon),
        ));
      },
      child: Padding(
        padding: EdgeInsets.all(2),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.w),
          ),
          shadowColor: Colors.white,
          color: UIHelper.getColorFromType(pokemon.type![0]),
          child: Padding(
            padding: UIHelper.getDefaultPadding(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pokemon.name ?? 'N/A',
                  style: Constants.getPokemonNameTextStyle(),
                ),
                Chip(
                  color: MaterialStateProperty.all(Colors.grey.shade800),
                  label: Text(
                    pokemon.type![0],
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(child: PokeImageAndBall(pokemon: pokemon)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
