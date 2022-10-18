import 'dart:math';

import 'package:flutter/material.dart';

import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';

class StickerPercentWidget extends StatelessWidget {
  final int percent;

  const StickerPercentWidget({
    Key? key,
    required this.percent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      // ! Stack serve para empilhar componentes
      alignment: Alignment.center,
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: context.colors.gray,
            shape: BoxShape.circle,
          ),
// ********************* Esse center é o que faz o número da % ir para o centro
          child: Center(
            child: Text(
              '$percent%',
              style: context.textStyles.titlePrimaryColor,
            ),
          ),
        ),
// ********************** Esse sizedbox é o que alinha o CircularProgressIndicator
        SizedBox(
          width: 110,
          height: 110,
          child: Transform.rotate(
            // ! vai rotacionar o círculo de fora (circular progress)
            angle: -pi / 2.5,
// ********************** Esse CircularProgressIndicator é o círculo de fora
            child: CircularProgressIndicator(
              value: percent /
                  100, // ! Quando coloca um valor aqui, o circular progress fica parado.
              color: Colors.white,
              strokeWidth: 5,
              backgroundColor: Colors.white.withOpacity(0.5),
            ),
          ),
        )
      ],
    );
  }
}
