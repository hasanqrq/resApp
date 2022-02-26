import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:resturent_app11/models/productItem.dart';
import 'package:resturent_app11/screens/cart_screen.dart';
import 'package:resturent_app11/shared_widgets/custom_appbar.dart';
import 'package:resturent_app11/utils/singleton.dart';

class ProductDetails extends StatefulWidget {
  ProductItemModel product;
  int selectedIndex;

  ProductDetails(this.product, this.selectedIndex);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ourCutomAppBar(context,
          title: widget.product.name,
          showBackButton: true,
          backButtonPressed: () {}),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 8),
            height: 500,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              itemCount: Singleton.preferance.productList.length,
              onPageChanged: (index) {},
              controller: PageController(
                  initialPage: widget.selectedIndex, viewportFraction: 0.8),
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: Singleton
                                  .preferance.productList[index].color),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 50),
                            Image.asset(
                              "assets/images/productImg" +
                                  Singleton
                                      .preferance.productList[index].image +
                                  ".png",
                              scale: 0.45,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              Singleton.preferance.productList[index].name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.check_circle,
                                    color: Colors.white),
                                const SizedBox(width: 3),
                                Text(
                                  "200ml, 1x ₹" +
                                      Singleton
                                          .preferance.productList[index].price
                                          .toString(),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 30.0, right: 30.0),
                              child: Divider(color: Colors.white),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 17.0, right: 30.0),
                              child: Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      if (Singleton.preferance
                                              .productList[index].qty ==
                                          0) {
                                        return;
                                      }
                                      Singleton
                                          .preferance.productList[index].qty--;
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.remove_circle_outline,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    Singleton.preferance.productList[index].qty
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Singleton
                                          .preferance.productList[index].qty++;
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.add_circle_outline,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  Text(
                                    "₹" +
                                        (Singleton.preferance.productList[index]
                                                    .qty *
                                                Singleton.preferance
                                                    .productList[index].price)
                                            .toStringAsFixed(2),
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      RatingBar.builder(
                        initialRating:
                            Singleton.preferance.productList[index].rating,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.red,
                        ),
                        onRatingUpdate: (rating) {
                          Singleton.preferance.productList[index].rating =
                              rating;
                          setState(() {});
                        },
                      ),
                      Text("You Have Rate " +
                          Singleton.preferance.productList[index].rating
                              .toString() +
                          " Stars")
                    ],
                  ),
                );
              },
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(
                    commingFromTab: false,
                    refreshPage: () {
                      setState(() {});
                    },

                    // newList: (list) {
                    //   for (ProductItemModel mainList
                    //       in Singleton.preferance.productList) {
                    //     for (ProductItemModel subList
                    //         in Singleton.preferance.productList) {
                    //       if (mainList.name == subList.name) {
                    //         mainList.qty = subList.qty;
                    //       }
                    //     }
                    //   }
                    //   setState(() {});
                    // },
                  ),
                ),
              );
            },
            child: Container(
              height: 41,
              width: 146,
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [Colors.red, Colors.yellow]),
              ),
              child: const Center(
                child: Text(
                  "Cart",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
