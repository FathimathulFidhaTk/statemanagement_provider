import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:statemanagement_provider/Shop_Example/Screens/Categories/fish_item.dart';
import 'package:statemanagement_provider/Shop_Example/Screens/Categories/marinated_items.dart';
import 'package:statemanagement_provider/Shop_Example/Screens/Categories/meat.dart';
import 'package:statemanagement_provider/Shop_Example/Screens/Categories/ready_to_cook.dart';

void main() {
  runApp(MaterialApp(
    home: Categories(),
    debugShowCheckedModeBanner: false,
  ));
}

class Categories extends StatefulWidget {
  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final List<String> images1 = [
    "assets/shop_images/meat.jpeg",
    "assets/shop_images/fish.jpeg",
    "assets/shop_images/marinated.jpeg",
    "assets/shop_images/ready_cook.png",
  ];

  final List<String> text = [
    "Meat",
    "Fish",
    "Marinated Items",
    "Ready to Cook",
  ];
  var link = [MeatItems(), FishItems(), MarinatedItems(), ReadyToCookItems()];

  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 25, right: 15, left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25,
              ),
              Text("Hey User,",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              Text(
                "Let's order Fresh Items,",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                thickness: 3,
              ),
              SizedBox(
                height: 15,
              ),
              Text('Categories',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 25,
              ),
              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 20),
                  itemCount: images1.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Flexible(
                          flex: 7,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12)),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  Image.asset(
                                    images1[index],
                                    fit: BoxFit.cover,
                                    height: 95,
                                    width: 200,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    text[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => link[index],
                                      ));
                                    },
                                    child: Text(
                                      "View more",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8))),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.brown),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    ));
  }
}
