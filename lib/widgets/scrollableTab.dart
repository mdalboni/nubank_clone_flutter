import 'package:flutter/material.dart';
import 'package:nubank_clone_flutter/utils/theme.dart';
import 'package:nubank_clone_flutter/widgets/buttons.dart';
import 'package:nubank_clone_flutter/widgets/card.dart';
import 'package:page_indicator/page_indicator.dart';

Widget scrollableTab(PageController controller, context) {
  return PageIndicatorContainer(
    child: PageView(
      children: <Widget>[
        whiteCard(
            cardUpperNuConta(context),
            cardBottomButton(Icons.monetization_on,
                'Transferencia de R\$4000,00 para Maxwell')),
        whiteCard(null, null),
        whiteCard(null, null),
      ],
      controller: controller,
    ),
    align: IndicatorAlign.bottom,
    length: 3,
    indicatorSpace: 5.0,
    padding: const EdgeInsets.only(bottom: 0),
    indicatorColor: CommonColors.greyOpacity20,
    indicatorSelectorColor: Colors.white,
    shape: IndicatorShape.circle(size: 7),
  );
}
