import 'package:flutter/material.dart';
import 'package:fruit/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 80.0, right: 80, bottom: 80, top: 120),
          child: Image.asset('lib/images/pear.png'),
        ),

        //text
        const Padding(
            padding: EdgeInsets.all(24.0),
            child: Text(
              "We deliver groceries at your doorstep",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            )),

        //fresh items
        const Text("Fresh items everyday"),

        //get started
        GestureDetector(
          onTap: () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const HomePage();
          })),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(24),
              child: const Text("Get Started",
                  style: TextStyle(color: Colors.white))),
        )
      ],
    ));
  }
}
