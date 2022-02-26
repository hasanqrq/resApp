import 'package:flutter/material.dart';
import 'package:resturent_app11/screens/LoginPage/login_bloc.dart';
import 'package:resturent_app11/screens/create_account_screen.dart';
import 'package:resturent_app11/screens/forgot_password_screen.dart';
import 'package:resturent_app11/screens/main.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var mybloc = LoginBloc();

  @override
  void initState() {
    mybloc.userNameController.text = "abed";
    mybloc.passwordController.text = "123";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 85),
              Image.network(
                "https://images.fastcompany.net/image/upload/w_1280,f_auto,q_auto,fl_lossy/w_596,c_limit,q_auto:best,f_auto/fc/3034007-inline-i-applelogo.jpg",
                scale: 5.0,
              ),
              const SizedBox(
                height: 10,
              ),
              const Center(
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color(0xff747474),
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 102, left: 28, right: 28),
                child: TextField(
                  controller: mybloc.userNameController,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  cursorColor: Colors.red,
                  decoration: const InputDecoration(
                    hintText: "Username",
                    hintStyle: TextStyle(color: Color(0xff939393)),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff808080)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 30, left: 28, right: 28, bottom: 16),
                child: TextField(
                  controller: mybloc.passwordController,
                  obscureText: true,
                  obscuringCharacter: "+",
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                  cursorColor: Colors.red,
                  decoration: const InputDecoration(
                    hintText: "Password",
                    hintStyle: TextStyle(color: Color(0xff939393)),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff808080)),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                ),
              ),
              RaisedButton(
                  child: const Text("Login"),
                  onPressed: () {
                    mybloc.validateLoginField(context);
                    setState(() {});
                  }),
              Text(
                mybloc.errorMsg,
                style: const TextStyle(color: Colors.red),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "GOOGLE",
                          style:
                              TextStyle(color: Color(0xffF05F5F), fontSize: 11),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.grey,
                      height: 20,
                      width: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "FACEBOOK",
                          style:
                              TextStyle(color: Color(0xff3884C6), fontSize: 11),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.grey,
                      height: 20,
                      width: 1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "TWITTER",
                          style:
                              TextStyle(color: Color(0xff4CAAFC), fontSize: 11),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 180,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen()),
                      );
                    },
                    child: const Text(
                      "Forgrot Password",
                      style: TextStyle(color: Color(0xff939393), fontSize: 13),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const CreateAccountScreen()),
                      );
                    },
                    child: const Text(
                      "Create new account",
                      style: TextStyle(color: Color(0xff939393), fontSize: 13),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
