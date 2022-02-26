import 'package:flutter/material.dart';
import 'package:resturent_app11/models/productItem.dart';
import 'package:resturent_app11/screens/payment_screen.dart';
import 'package:resturent_app11/shared_widgets/custom_appbar.dart';
import 'package:resturent_app11/utils/singleton.dart';

class CartScreen extends StatefulWidget {
  // final Function(List<ProductItemModel>) newList;
  bool commingFromTab;
  VoidCallback refreshPage;

  CartScreen({
    //required this.newList,
    required this.refreshPage,
    this.commingFromTab = true,
    Key? key,
  }) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<ProductItemModel> filteredList = [];

  @override
  void initState() {
    // filteredList = Singleton.preferance.productList
    //     .where((element) => filteredList = element.qty > 0);

    for (ProductItemModel item in Singleton.preferance.productList) {
      if (item.qty > 0) {
        filteredList.add(item);
      }
    }

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.commingFromTab
          ? null
          : ourCutomAppBar(context, showBackButton: true, title: "My Cart",
              backButtonPressed: () {
              widget.refreshPage();
              // widget.newList(Singleton.preferance.productList);
            }),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: filteredList.length,
                itemBuilder: (ctx, index) {
                  return productTile(filteredList[index], index);
                }),
          ),
          Container(
            height: 175,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text("Your Orders"),
                  Row(
                    children: [
                      const Text("Bill Total"),
                      Expanded(child: Container()),
                      Text(" ₹ " + getBillTotal()),
                    ],
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                  Row(
                    children: [
                      const Text("Discount"),
                      Expanded(child: Container()),
                      const Text("30%"),
                    ],
                  ),
                  Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                  Row(
                    children: [
                      const Text("Grand Total"),
                      Expanded(child: Container()),
                      Text(" ₹ " + grantTotal(getBillTotal())),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {});
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PaymentScreen()));
                      },
                      child: const Text("Proceed to pay"))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget productTile(ProductItemModel model, int index) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 131,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    "assets/images/productImg" + model.image + ".png",
                    width: 50,
                    height: 50,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(model.name),
                      Row(
                        children: [
                          const Icon(Icons.chair),
                          const SizedBox(
                            width: 4,
                          ),
                          Text("200ml, 1x ₹ ${model.price}"),
                        ],
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  IconButton(
                      onPressed: () {
                        Singleton.preferance.productList[index].qty = 0;
                        Singleton.preferance.productList.removeAt(index);
                        setState(() {});
                      },
                      icon: Icon(Icons.close))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 1,
                  color: Colors.grey,
                ),
              ),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        if (model.qty == 1) {
                          Singleton.preferance.productList.removeAt(index);
                        }
                        model.qty--;
                        setState(() {});
                      },
                      icon: Icon(Icons.remove)),
                  Text(model.qty.toString()),
                  IconButton(
                      onPressed: () {
                        model.qty++;
                        setState(() {});
                      },
                      icon: Icon(Icons.add)),
                  Expanded(child: Container()),
                  Text(" ₹" + (model.qty * model.price).toStringAsFixed(2))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  String getBillTotal() {
    double total = 0;

    for (ProductItemModel model in Singleton.preferance.productList) {
      total = total + (model.qty * model.price);
    }

    return total.toStringAsFixed(2);
  }

  String grantTotal(String total) {
    var doubleTotal = double.parse(total);
    return (doubleTotal * 70 / 100).toStringAsFixed(2);
  }
}
