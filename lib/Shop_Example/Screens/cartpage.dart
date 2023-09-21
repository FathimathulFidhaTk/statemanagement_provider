import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:statemanagement_provider/Shop_Example/Screens/qr_scanner.dart';

import 'Provider/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var carthome = context.watch<CartProvider>().cartall;
    num totalAmount = 0;
    for (var item in carthome) {
      totalAmount += (item.price * item.count);
    }
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: IconThemeData(color: Colors.black)),
        body: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 290),
                child: Text(
                  "My Cart",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: carthome.length,
                  itemBuilder: (context, index) {
                    var item = carthome[index];
                    totalAmount = (item.price * item.count) + totalAmount;

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey[200],
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(item.image),
                          ),
                          title: Text(item.name),
                          subtitle: Text("₹ ${item.price}\kg"),
                          trailing: Wrap(
                            children: [
                              Text(item.count.toString()),
                              IconButton(
                                  onPressed: () => Provider.of<CartProvider>(
                                          context,
                                          listen: false)
                                      .removeFromCart(item),
                                  icon: Icon(Icons.delete)),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total Price",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '₹ ${totalAmount.toString()}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.green.shade100),
                        ),
                        padding: EdgeInsets.all(12),
                        child: Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyHome()));
                              },
                              child: Text("Pay Now",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.white,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
