import 'package:flutter/material.dart';
import 'package:nubank_clone_flutter/widgets/buttons.dart';

Widget horizontalHomeMenu() {
  return SafeArea(
      minimum: EdgeInsets.all(0.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: menuList([
              'Indicar amigos',
              'Ajustar limte',
              'Pagar',
              'Transferir',
              'Despositar'
            ])),
      ));
}

List<Widget> menuList(List<String> items) {
  List<Widget> wdgList = new List();
  wdgList.add(Padding(padding: EdgeInsets.only(left: 15.0)));
  items.forEach((item) {
    wdgList.add(greyContainerButton(Icons.person_add, item));
    wdgList.add(Padding(padding: EdgeInsets.only(left: 15.0)));
  });
  return wdgList;
}
