import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/cart_provider.dart';
import '../cartpage.dart';
import '../item_tile.dart';

class ReadyToCookItems extends StatelessWidget {
  ReadyToCookItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var readytocookhome = context.watch<CartProvider>().readytocookhome;
    var readytocookcart = context.watch<CartProvider>().cartall;

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
            Text("${readytocookcart.length}")
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
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    "Ready To Cook Products",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GridView.builder(
                    itemCount: readytocookhome.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.8),
                    itemBuilder: (context, index) {
                      var readytocook = readytocookhome[index];
                      return ItemTile(
                        ItemName: readytocook.name,
                        ItemPrice: "${readytocook.price}",
                        ImagePath: readytocook.image,
                        color: Colors.green,
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addToCart(readytocook);
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
