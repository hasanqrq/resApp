import 'package:flutter/material.dart';
import 'package:resturent_app11/models/productItem.dart';
import 'package:resturent_app11/screens/productdetails_screen.dart';
import 'package:resturent_app11/utils/singleton.dart';
import 'package:scroll_navigation/scroll_navigation.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ScrollNavigation(
          bodyStyle: const NavigationBodyStyle(
            background: Colors.white,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
          ),
          barStyle: const NavigationBarStyle(
            position: NavigationPosition.top,
            background: Colors.white,
            elevation: 0.0,
          ),
          pages: [
            ListView.builder(
                itemCount: Singleton.preferance.productList.length,
                itemBuilder: (ctx, index) {
                  return productCell(
                      product: Singleton.preferance.productList[index],
                      ctx: context,
                      inx: index);
                }),
            Container(color: Colors.green[100]),
            Container(color: Colors.purple[100]),
          ],
          items: const [
            ScrollNavigationItem(icon: Text("smoothies 1")),
            ScrollNavigationItem(icon: Text("smoothies 2")),
            ScrollNavigationItem(icon: Text("smoothies 3")),
          ],
        ));
  }

  Widget productCell(
      {required ProductItemModel product,
      required BuildContext ctx,
      required int inx}) {
    return InkWell(
      onTap: () {
        Navigator.push(
          ctx,
          MaterialPageRoute(builder: (context) => ProductDetails(product, inx)),
        );
      },
      child: Column(
        children: [
          const SizedBox(height: 4),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: product.color),
                    borderRadius: BorderRadius.circular(37.5),
                  ),
                  height: 75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        product.price.toString(),
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Image.asset(
                "assets/images/productImg" + product.image + ".png",
                width: 75,
                height: 75,
              )
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
