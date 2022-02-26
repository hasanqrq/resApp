import 'package:flutter/material.dart';
import 'package:resturent_app11/shared_widgets/custom_appbar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PaymentScreen extends StatelessWidget {
  var pageController = PageController(initialPage: 1, viewportFraction: 0.8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ourCutomAppBar(context,
          showBackButton: true, title: "Payment", backButtonPressed: () {}),
      body: Container(
        color: Color(0xffEDEDED),
        child: Column(
          children: [
            Container(
              height: 170,
              child: PageView.builder(
                  itemCount: 3,
                  controller: pageController,
                  itemBuilder: (context, index) {
                    return cardView(index);
                  }),
            ),
            SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: const ScrollingDotsEffect(
                  activeStrokeWidth: 2.6,
                  activeDotScale: 1.3,
                  maxVisibleDots: 5,
                  radius: 8,
                  spacing: 10,
                  dotHeight: 12,
                  dotWidth: 12,
                )),
          ],
        ),
      ),
    );
  }

  Widget cardView(int index) {
    if (index == 0) {
      return card(Colors.grey);
    } else if (index == 1) {
      return card(Colors.blue);
    } else {
      return card(Colors.pink);
    }
  }

  Widget card(Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: color,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Padding(
            padding: const EdgeInsets.only(top: 17, right: 17),
            child: Image.asset(
              "assets/images/visa.png",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "1234   5678   9023",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: const Padding(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                "1234",
                style: TextStyle(color: Colors.white, fontSize: 7),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Abed alrahman",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              Expanded(child: Container()),
              Container(
                width: 50,
                child: const Text(
                  "Valid THRU",
                  maxLines: 2,
                  style: TextStyle(color: Colors.white, fontSize: 13),
                ),
              ),
              const SizedBox(
                width: 3,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: Text(
                  "03/12",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
