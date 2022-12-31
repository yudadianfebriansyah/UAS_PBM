import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../controlers/password_management.dart';
import 'page.dart';
import 'register.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {

   bool _obscureText = true;

  late String _password;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Stack(
            // alignment: AlignmentDirectional.centerStart,
            children: [
            Container(
                  height: 80,
                  padding: EdgeInsets.only(top: 50),
                  decoration: const BoxDecoration(
                      image:
                          DecorationImage(image: AssetImage("assets/logo.png"))),
            ),
            const SizedBox(width: 15),
            Container(
              padding: const EdgeInsets.only(left: 35, top: 80),
              child: const Text(
                "Welcome Back",
                style: TextStyle(color: Colors.black, fontSize: 33),
              ),
            ),
             Container(
                height: 70,
              ),
            Container(
              padding: EdgeInsets.only(
                  right: 35,
                  left: 35,
                  top: MediaQuery.of(context).size.height * 0.2
                  ),
              child: Column(children: [
                TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      suffixIcon: IconButton(
                        icon: Icon(
                                    // Based on passwordVisible state choose the icon
                                    _obscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                    color: Theme.of(context).primaryColorDark,
                                    ),
                          onPressed: () =>
                             setState(() {
                                    _obscureText = !_obscureText;
                                }),
                      ),
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    // obscureText: context.watch<PasswordProvider>().viewpw,
                  ),
                  
                ),
                const SizedBox(
                  height: 40,
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Sign In',
                      style: TextStyle(
                        color: Color(0xff4c505b),
                        fontSize: 27,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.purple[900],
                      child: IconButton(
                        color: Colors.black,
                        onPressed: () {
                           Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage()),
                        );
                        },
                        icon: const Icon(Icons.arrow_forward),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                         Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MyRegister()),
                        );
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Color(0xff4c505b),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MyRegister()),
                        );
                        },
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            fontSize: 18,
                            color: Color(0xff4c505b),
                          ),
                        ),
                      ),
                    ]),
              ]),
            ),
          ]),
        ),
      ),
    );
  }
}