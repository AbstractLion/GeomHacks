import 'package:efika/models/order.dart';
import 'package:efika/models/orders.dart';
import 'package:efika/screens/order_checklist_screen.dart';
import 'package:efika/widgets/efika_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:getflutter/components/button/gf_button.dart';
import 'package:getflutter/components/button/gf_button_bar.dart';
import 'package:getflutter/components/card/gf_card.dart';
import 'package:getflutter/components/list_tile/gf_list_tile.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EfikaAppBar(
        title: Text('Orders'),
      ),
      body: ListView.builder(
        itemCount: Orders.orders.length,
        itemBuilder: (BuildContext context, int index) {
          Order order = Orders.orders[index];
          return GFCard(
            title: GFListTile(
              title: Text(order.id.toString()),
            ),
            buttonBar: GFButtonBar(
              alignment: WrapAlignment.center,
              children: <Widget>[
                GFButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      OrderChecklistScreen.routeName,
                      arguments: RouteParams(
                        index,
                      )
                    );
                  },
                  text: "View Details",
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
