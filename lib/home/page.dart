import 'package:flutter/material.dart';
import 'package:nubank_clone_flutter/utils/colors.dart';
import 'package:nubank_clone_flutter/widgets/fullscreen.dart';
import 'package:nubank_clone_flutter/widgets/menus.dart';
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
        minimum: EdgeInsets.only(bottom: 20),
        bottom: true,
        child: Column(children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.red,
            ),
            flex: 18,
          ),
          Expanded(child: tab(), flex: 59),
          Expanded(child: SizedBox(), flex: 10),
          Expanded(child: horizontalHomeMenu(), flex: 13)
        ])));
  }

  Widget whiteCard(Widget upper, Widget bottom) {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
        child: Column(
          children: <Widget>[
            Expanded(
              child: SizedBox.expand(
                  child: cardBottomButton(Icons.monetization_on,
                      'Transferencia de R\$4000 para Maxwell')),
              flex: 6,
            ),
            Expanded(
              child: SizedBox.expand(
                  child: cardBottomButton(Icons.monetization_on,
                      'Transferencia de R\$4000 para Maxwell')),
              flex: 2,
            )
          ],
        ),
      ),
      minimum: EdgeInsets.all(25.0),
      bottom: true,
    );
  }

  Widget cardBottomButton(IconData icon, String message) {
    return FlatButton(
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Expanded(
            child: Icon(
              icon,
              size: 35,
            ),
            flex: 2,
          ),
          Expanded(
            child: SizedBox(),
            flex: 1,
          ),
          Expanded(
            child: Text(message),
            flex: 8,
          ),
          Expanded(
            child: SizedBox(),
            flex: 1,
          ),
          Expanded(
            child: Icon(Icons.navigate_next),
            flex: 1,
          )
        ]),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(0.0),
        ),
        onPressed: () {},
        color: greyOpacity100());
  }

  Widget tab() {
    return PageIndicatorContainer(
      child: PageView(
        children: <Widget>[
          whiteCard(null, null),
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
