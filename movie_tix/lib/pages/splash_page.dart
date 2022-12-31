import 'package:flutter/material.dart';
import 'login.dart';
import 'page.dart';
// import 'package:movie_tix/pages/home_page.dart';

class SplashPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 136,
                decoration: const BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage("assets/logo.png"))),
              ),
              Container(
                margin: const EdgeInsets.only(top: 70, bottom: 16),
                child: const Text(
                  "New Experience",
                ),
              ),
              Text(
                "Watch a new movie much\neasier than any before",
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                width: 250,
                height: 46,
                margin: const EdgeInsets.only(top: 70, bottom: 19),
                child: FloatingActionButton.extended(
                  backgroundColor: Colors.purple[900],
                    label: const Text(
                      "Get Started",
                    ),
                    onPressed: () {
                     Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainPage()),
                        );
                      }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Already have an account? ",
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MyLogin()),
                        );
                    },
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                      color: Colors.purple[900],
                ),
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
