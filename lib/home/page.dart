import 'package:flutter/material.dart';
import 'package:nubank_clone_flutter/utils/colors.dart';
import 'package:nubank_clone_flutter/utils/theme.dart';
import 'package:nubank_clone_flutter/widgets/fullscreen.dart';
import 'package:nubank_clone_flutter/widgets/menus.dart';
import 'package:nubank_clone_flutter/widgets/moneybar.dart';
import 'package:page_indicator/page_indicator.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;
  final String route = '/home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return solidBackgroundScreen(SafeArea(
        minimum: EdgeInsets.only(bottom: 15),
        bottom: true,
        child: Column(children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.red,
            ),
            flex: 18,
          ),
          Expanded(child: tab(), flex: 53),
          Expanded(child: SizedBox(), flex: 11),
          Expanded(child: horizontalHomeMenu(), flex: 13)
        ])));
  }

  Widget whiteCard(Widget upperWdg, Widget bottomWdg) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
        child: Column(
          children: <Widget>[
            Expanded(
              child: SizedBox.expand(child: upperWdg),
              flex: 6,
            ),
            Expanded(
              child: SizedBox.expand(child: bottomWdg),
              flex: 2,
            )
          ],
        ),
      ),
      minimum: EdgeInsets.all(25.0),
      bottom: true,
    );
  }

  Widget cardUpperNuConta() {
    Widget titleRow = Row(
      children: <Widget>[
        Icon(
          Icons.credit_card,
          size: 32,
          color: CommonColors.accent,
        ),
        Padding(padding: EdgeInsets.only(left: 15)),
        Text(
          'Cartão de crédito',
          style:
              TextStyle(height: 1.3, fontSize: 20, color: CommonColors.accent),
        )
      ],
    );

    Column subtitleColumn = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'FATURA ATUAL',
            style: Theme.of(context).textTheme.body2,
          ),
          Text(
            'R\$ 5800,00',
            style: Theme.of(context).textTheme.display2,
          ),
          Text(
            'Limite disponivel R\$ 4200,00',
            style: Theme.of(context).textTheme.body2,
          )
        ]);

    return FlatButton(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(),
                        flex: 1,
                      ),
                      Expanded(
                        child: titleRow,
                        flex: 1,
                      ),
                      Expanded(child: subtitleColumn, flex: 9),
                    ]),
                flex: 98),
            Expanded(
              child: moneyBar(30, 15, 40, 15),
              flex: 2,
            )
          ],
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(style: BorderStyle.none),
        ),
        padding: EdgeInsets.only(left: 20),
        onPressed: () {},
        color: Colors.white);
  }

  Widget cardBottomButton(IconData icon, String message) {
    return FlatButton(
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(
            child: Icon(icon, size: 35, color: Colors.grey[600]),
            flex: 2,
          ),
          Expanded(
            child: SizedBox(),
            flex: 1,
          ),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.normal),
            ),
            flex: 8,
          ),
          Expanded(
            child: SizedBox(),
            flex: 1,
          ),
          Expanded(
            child: Icon(Icons.navigate_next, color: Colors.grey[600]),
            flex: 1,
          )
        ]),
        shape: RoundedRectangleBorder(
          side: BorderSide(style: BorderStyle.none),
        ),
        onPressed: () {},
        color: greyOpacity100());
  }

  Widget tab() {
    return PageIndicatorContainer(
      child: PageView(
        children: <Widget>[
          whiteCard(
              cardUpperNuConta(),
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
      indicatorColor: greyOpacity20(),
      indicatorSelectorColor: Colors.white,
      shape: IndicatorShape.circle(size: 6),
    );
  }
}
