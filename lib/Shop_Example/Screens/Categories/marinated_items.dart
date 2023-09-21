import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/cart_provider.dart';
import '../cartpage.dart';
import '../item_tile.dart';

class MarinatedItems extends StatelessWidget {
  MarinatedItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var marinatedhome = context.watch<CartProvider>().marinatedhome;
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
          onPressed: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) {
            return CartPage();
          })),
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
                Text(
                  "   Marinated Items",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GridView.builder(
                    itemCount: marinatedhome.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.8),
                    itemBuilder: (context, index) {
                      var marinated = marinatedhome[index];
                      return ItemTile(
                        ItemName: marinated.name,
                        ItemPrice: "${marinated.price}",
                        ImagePath: marinated.image,
                        color: Colors.green,
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addToCart(marinated);
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
