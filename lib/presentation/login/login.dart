import 'package:flutter/material.dart';
import 'package:mutahapplication/app/background.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/routes_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';
import 'package:mutahapplication/presentation/widgets/textfields/custom_login_text_field_widget.dart';
import 'package:mutahapplication/presentation/widgets/button/login_button.dart';
import 'package:mutahapplication/presentation/widgets/login_logo/logo_section_widget.dart';
import 'package:mutahapplication/presentation/widgets/remember_forget_login/remember_checkbox_widget.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _studentNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child:
      Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: ColorManager.transparentcolor,
        body: Center(
        child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const LogoSection(),
                const SizedBox(height: 50),
                 Text(
                  AppStrings.logInTitle,
                  style:
                  getFirstSemiBoldStyle(color: ColorManager.black)
                  ,
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _studentNumberController,
                   label: AppStrings.studentId,
                  icon: Icons.person,
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  controller: _passwordController,
                  label:AppStrings.password,
                  icon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                const BuildRememberMeCheckbox(),
                const SizedBox(height: 40),
                LoginButton(onPressed: (){
                  Navigator.pushReplacementNamed(context, Routes.mainRoute);
                  //
                },),
              ],
            ),
          ),
        ),
      ),
    )
    ,
    );
  }


}














