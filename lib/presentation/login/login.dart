import 'package:flutter/material.dart';
import 'package:mutahapplication/app/background.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return  BackgroundWidget(
      child: Scaffold(
      backgroundColor: ColorManager.transparentcolor,
      body: const Center(
        child: Column(
          children: [
            Row(),
            Row(),
            Row(),
            Row(),
            Row()
          ],

        ),
      ),
    ),
    );
  }

  }

