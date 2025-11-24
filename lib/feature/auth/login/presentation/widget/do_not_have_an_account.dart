import 'package:flutter/material.dart';
import 'package:hungry_app/feature/auth/register/presentation/register_view.dart';

class DoNoHaveAnAccount extends StatelessWidget {
  const DoNoHaveAnAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Do Not Have An Account ? ",
          style: TextStyle(color: Colors.white),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, RegisterView.routeName);
          },
          child: Text(
            "Register",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
