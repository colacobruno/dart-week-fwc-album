import 'package:flutter/material.dart';
import 'package:fwc_album_app/app/core/ui/styles/colors_app.dart';
import 'package:fwc_album_app/app/core/ui/styles/text_styles.dart';
import 'package:fwc_album_app/app/models/groups_stickers.dart';
import 'package:fwc_album_app/app/models/user_sticker_model.dart';

class StickerGroup extends StatelessWidget {
  final GroupsStickers group;
  final String statusFilter;

  const StickerGroup({super.key, required this.group, required this.statusFilter});

  @override
  Widget build(BuildContext context) {
    print('build $hashCode');
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
//* LOGO ABAIXO DO FILTRO
          SizedBox(
            height: 64,
            child: OverflowBox(
              //* Componente que deixa dar overflow e passar as constraint do flutter
              maxWidth: double.infinity,
              maxHeight: double.infinity,
              child: ClipRect(
                //* Componmente que vai cortar a imagem
                child: Align(
                  alignment: const Alignment(0, -0.1),
                  widthFactor: 1, //* Ocupa 100% da tela
                  heightFactor: 0.1, //* Diminui o fato de alinhamento e corta
                  child: Image.network(
                    group.flag,
                    cacheWidth: (MediaQuery.of(context).size.width * 3).toInt(),
                  ),
                ),
              ),
            ),
          ),
//* TITULO ABAIXO DO LOGO
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              group.countryName,
              style: context.textStyles.titleBlack.copyWith(fontSize: 26),
            ),
          ),
//* GRID DE FIGURINHAS
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(), //* Remove o scroll
            shrinkWrap: true,
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final stickerNumber = '${group.stickersStart + index}';

              //* procura a figurinha no album
              final stickerList = group.stickers.where((sticker) => sticker.stickerNumber == stickerNumber);

              //* se achar coloca ela, senão coloca nulo
              final sticker = stickerList.isNotEmpty ? stickerList.first : null;

              final stickerWidget = Sticker(
                stickerNumber: stickerNumber,
                sticker: sticker,
                countryName: group.countryName,
                countryCode: group.countryCode,
              );

              if (statusFilter == 'all') {
                return stickerWidget;
              } else if (statusFilter == 'missing') {
                if (sticker == null) {
                  return stickerWidget;
                }
              } else if (statusFilter == 'repetead') {
                if (sticker != null && sticker.duplicate > 0) {
                  return stickerWidget;
                }
              }

              return const SizedBox.shrink();
            },
          )
        ],
      ),
    );
  }
}

class Sticker extends StatelessWidget {
  final String stickerNumber;
  final UserStickerModel? sticker;
  final String countryName;
  final String countryCode;

  const Sticker({
    super.key,
    required this.stickerNumber,
    required this.sticker,
    required this.countryName,
    required this.countryCode,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //* Para ser clicável
      onTap: () {},
      child: Container(
        color: sticker != null ? context.colors.primary : context.colors.grey,
        child: Column(
          children: [
            Visibility(
              visible: (sticker?.duplicate ?? 0) > 0, //* Mostra o número somente no quadrado colorido
              maintainSize:
                  true, //* Serve para manter a posição do texto como se o que ficou escondido (BRA) estivesse aparecendo
              maintainAnimation: true, //* Por conta do maintainSize
              maintainState: true, //* Por conta do maintainSize
              child: Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.all(2),
                child: Text(
                  sticker?.duplicate.toString() ?? '',
                  style: context.textStyles.textSecondaryFontMedium.copyWith(
                    color: context.colors.yellow,
                  ),
                ),
              ),
            ),
            Text(
              countryCode,
              style: context.textStyles.textSecondaryFontExtraBold.copyWith(
                color: sticker != null ? Colors.white : Colors.black,
              ),
            ),
            Text(
              stickerNumber,
              style: context.textStyles.textSecondaryFontExtraBold.copyWith(
                color: sticker != null ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
