import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/cart_provider.dart';
import '../cartpage.dart';
import '../item_tile.dart';

class MeatItems extends StatelessWidget {
  MeatItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var meathome = context.watch<CartProvider>().meathome;
    var marinatedcart = context.watch<CartProvider>().cartall;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.brown,
          onPressed: () => Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return CartPage();
            },
          )),
          child: Wrap(children: [
            Icon(
              Icons.shopping_bag,
              color: Colors.white,
            ),
            Text("${marinatedcart.length}")
          ]),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Meat Items",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GridView.builder(
                    itemCount: meathome.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.8),
                    itemBuilder: (context, index) {
                      var meat = meathome[index];
                      return ItemTile(
                        ItemName: meat.name,
                        ItemPrice: "${meat.price}",
                        ImagePath: meat.image,
                        color: Colors.green,
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addToCart(meat);
                        },
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
