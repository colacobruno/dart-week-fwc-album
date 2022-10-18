import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:fwc_album_app/app/core/rest/custom_dio.dart';
import 'package:fwc_album_app/app/core/ui/styles/button_styles.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/core/ui/widgets/button.dart';
import 'package:fwc_album_app/app/pages/home/widgets/status_tile.dart';
import 'package:fwc_album_app/app/pages/home/widgets/sticker_percent_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: context.colors.primary,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assests/images/background.png'),
                fit: BoxFit.cover),
          ),
          child: LayoutBuilder(
            builder: (_, constrains) {
              return ConstrainedBox(
                constraints: BoxConstraints(minHeight: constrains.maxHeight),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(bottom: 35),
                          width: MediaQuery.of(context).size.width,
                          child: Image.asset(
                            'assets/images/bola.png',
                            fit: BoxFit.cover,
                          ),
                        ),
// ****************** PERCENT
                        StickerPercentWidget(
                          percent: 60,
                        ),
// ****************** SEPARADOR
                        const SizedBox(
                          height: 20,
                        ),
// ****************** TÍTULO
                        Text(
                          '45 Figurinhas',
                          style: context.textStyles.titleWhite,
                        ),
// ****************** SEPARADOR
                        const SizedBox(
                          height: 20,
                        ),
// ****************** TODAS
                        StatusTile(
                            icon: Image.asset('assets/images/all_icon.png'),
                            label: 'Todas',
                            value: 34),
// ****************** SEPARADOR
                        const SizedBox(
                          height: 20,
                        ),
// ****************** FALTANDO
                        StatusTile(
                            icon: Image.asset('assets/images/missing_icon.png'),
                            label: 'Faltando',
                            value: 500),
// ****************** SEPARADOR
                        const SizedBox(
                          height: 20,
                        ),
// ****************** REPETIDAS
                        StatusTile(
                            icon: Image.asset('assets/images/repeted_icon.png'),
                            label: 'Repetidas',
                            value: 30),
// ****************** SEPARADOR
                        const SizedBox(
                          height: 20,
                        ),
// ****************** SEPARADOR
                        Button(
                          onPressed: () {},
                          width: MediaQuery.of(context).size.width * .9,
                          style: context.buttonStyles.yellowOutlineButton,
                          labelStyle: context
                              .textStyles.textSecondaryFontExtraBold
                              .copyWith(color: context.colors.yellow),
                          label: 'Minhas Figurinhas',
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
