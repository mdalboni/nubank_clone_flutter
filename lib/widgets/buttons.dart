import 'package:flutter/material.dart';
import 'package:nubank_clone_flutter/utils/theme.dart';
import 'package:nubank_clone_flutter/widgets/moneybar.dart';

Widget greyContainerButton(IconData icon, String label) {
  Text text = Text(
    label,
    textAlign: TextAlign.left,
    style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12),
  );
  return ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(4.0)),
    child: Container(
        width: 95,
        height: double.infinity,
        color: CommonColors.greyOpacity20,
        alignment: Alignment.centerLeft,
        child: FlatButton(
            splashColor: CommonColors.primaryDark,
            highlightColor: Colors.transparent,
            onPressed: () {},
            padding: EdgeInsets.only(top: 8, left: 8, bottom: 8, right: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Icon(
                    icon,
                    size: 28.0,
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  text
                ]))),
  );
}

Widget transparentButton(IconData icon, String label) {
  return Container(
      color: Colors.transparent,
      child: FlatButton(
        onPressed: () {},
        child: SafeArea(
            minimum: EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      icon,
                      size: 34.0,
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Text(
                  label,
                  textAlign: TextAlign.left,
                )
              ],
            )),
      ));
}

Widget cardUpperNuConta(context) {
  Widget titleRow = Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.max,
    children: <Widget>[
      Icon(
        Icons.credit_card,
        size: 32,
        color: CommonColors.accent,
      ),
      Padding(padding: EdgeInsets.only(left: 15)),
      Text(
        'Cartão de crédito',
        style: TextStyle(fontSize: 20, color: CommonColors.accent, height: 1.3),
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
          'R\$ 9999,99',
          style: Theme.of(context).textTheme.display2,
        ),
        Text(
          'Limite disponivel R\$ 50000,00',
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
                      flex: 2,
                    ),
                    Expanded(
                      child: titleRow,
                      flex: 3,
                    ),
                    Expanded(child: subtitleColumn, flex: 12),
                    Expanded(
                      child: Container(),
                      flex: 2,
                    ),
                  ]),
              flex: 99),
          Expanded(
            child: moneyBar(30, 15, 40, 15),
            flex: 3,
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
        side: BorderSide(
            style: BorderStyle.solid,
            color: CommonColors.greyOpacity100,
            width: 1),
      ),
      onPressed: () {},
      color: CommonColors.greyOpacity100);
}
