import 'package:flutter/material.dart';
import 'package:resturent_app11/screens/main.dart';

class LoginBloc {
  String errorMsg = "";

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  validateLoginField(BuildContext context) {
    if (userNameController.text.isEmpty) {
      errorMsg = "Username is empty";
    } else if (passwordController.text.isEmpty) {
      errorMsg = "Password is empty";
    } else if (userNameController.text != "abed") {
      errorMsg = "Username Not Correct";
    } else if (passwordController.text != "123") {
      errorMsg = "Password Not Correct";
    } else {
      errorMsg = "";
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MainContainer()),
      );
    }
  }
}
