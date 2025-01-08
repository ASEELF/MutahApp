import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mutahapplication/app/background.dart';
import 'package:mutahapplication/businessLogic/controllers/login_controller.dart';
import 'package:mutahapplication/data/services/api_service.dart';
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
  final FocusNode _focusNodeStudentNumber = FocusNode(); // FocusNode for student number field
  final FocusNode _focusNodePassword = FocusNode(); // FocusNode for password field
  final LoginController _loginController = LoginController(ApiService());

  void _handleLogin() async {
    final studentId = _studentNumberController.text.trim();
    final password = _passwordController.text.trim();

    if (studentId.isEmpty || password.isEmpty) {
      // Show error message
      Get.snackbar(AppStrings.error, AppStrings.fillAllFields);
      return;
    }

    try {
      final response = await _loginController.login(studentId, password);
      if (response != null) {
        // Navigate to main route
        Get.offNamed(Routes.mainRoute);
      } else {
        // Show error message
        Get.snackbar(AppStrings.error, AppStrings.invalidLogin);
      }
    } catch (e) {
      // Show exception error
      Get.snackbar(AppStrings.error, e.toString());
    }



  }
  void _dismissKeyboard() {
    // Unfocus all focus nodes to dismiss the keyboard
    _focusNodeStudentNumber.unfocus();
    _focusNodePassword.unfocus();
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _dismissKeyboard, // Dismiss keyboard when tapping outside
      child: BackgroundWidget(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: ColorManager.transparentcolor,
            body: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 7.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const LogoSection(),
                    const SizedBox(height: 50),
                    Text(
                      AppStrings.logInTitle,
                      style: getFirstSemiBoldStyle(color: ColorManager.black),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: _studentNumberController,
                      label: AppStrings.studentId,
                      icon: Icons.person,
                      keyboardType: TextInputType.number,
                      obscureText: false,
                    ),
                    const SizedBox(height: 10),
                    CustomTextField(
                      controller: _passwordController,
                      label: AppStrings.password,
                      icon: Icons.lock,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    BuildRememberMeCheckbox(
                      studentId: _studentNumberController.text,
                      password: _passwordController.text,
                    ),
                    const SizedBox(height: 40),
                    LoginButton(
                        onPressed: _handleLogin,

                    )
                      // onPressed: () {
                      //   Get.offNamed(Routes.mainRoute);
                      // },
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:mutahapplication/app/background.dart';
// import 'package:mutahapplication/businessLogic/controllers/login_controller.dart';
// import 'package:mutahapplication/data/services/api_service.dart';
// import 'package:mutahapplication/presentation/resources/color_manager.dart';
// import 'package:mutahapplication/presentation/resources/routes_manager.dart';
// import 'package:mutahapplication/presentation/resources/string_manager.dart';
// import 'package:mutahapplication/presentation/resources/styles_manager.dart';
// import 'package:mutahapplication/presentation/widgets/textfields/custom_login_text_field_widget.dart';
// import 'package:mutahapplication/presentation/widgets/button/login_button.dart';
// import 'package:mutahapplication/presentation/widgets/login_logo/logo_section_widget.dart';
// import 'package:mutahapplication/presentation/widgets/remember_forget_login/remember_checkbox_widget.dart';
// import 'package:shared_preferences/shared_preferences.dart';  // Import shared_preferences
//
// class LoginView extends StatefulWidget {
//   const LoginView({Key? key}) : super(key: key);
//
//   @override
//   _LoginViewState createState() => _LoginViewState();
// }
//
// class _LoginViewState extends State<LoginView> {
//   final TextEditingController _studentNumberController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final FocusNode _focusNodeStudentNumber = FocusNode(); // FocusNode for student number field
//   final FocusNode _focusNodePassword = FocusNode(); // FocusNode for password field
//   final LoginController _loginController = LoginController(ApiService());
//
//   // Load credentials from SharedPreferences
//   Future<void> loadCredentials() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? savedStudentId = prefs.getString('studentId');
//     String? savedPassword = prefs.getString('password');
//
//     if (savedStudentId != null && savedPassword != null) {
//       setState(() {
//         // Populate text fields with saved values
//         _studentNumberController.text = savedStudentId;
//         _passwordController.text = savedPassword;
//       });
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     loadCredentials(); // Load credentials when the login screen is initialized
//   }
//
//   void _handleLogin() async {
//     final studentId = _studentNumberController.text.trim();
//     final password = _passwordController.text.trim();
//
//     if (studentId.isEmpty || password.isEmpty) {
//       // Show error message
//       Get.snackbar(AppStrings.error, AppStrings.fillAllFields);
//       return;
//     }
//
//     try {
//       final response = await _loginController.login(studentId, password);
//       if (response != null) {
//         // Save credentials if "Remember Me" is selected
//         SharedPreferences prefs = await SharedPreferences.getInstance();
//         bool rememberMe = await _loginController.isRememberMeChecked(); // Check if Remember Me is checked
//         if (rememberMe) {
//           await prefs.setString('studentId', studentId);
//           await prefs.setString('password', password);
//         }
//
//         // Navigate to main route
//         Get.offNamed(Routes.mainRoute);
//       } else {
//         // Show error message
//         Get.snackbar(AppStrings.error, AppStrings.invalidLogin);
//       }
//     } catch (e) {
//       // Show exception error
//       Get.snackbar(AppStrings.error, e.toString());
//     }
//   }
//
//   void _dismissKeyboard() {
//     // Unfocus all focus nodes to dismiss the keyboard
//     _focusNodeStudentNumber.unfocus();
//     _focusNodePassword.unfocus();
//     FocusScope.of(context).requestFocus(FocusNode());
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: _dismissKeyboard, // Dismiss keyboard when tapping outside
//       child: BackgroundWidget(
//         child: Directionality(
//           textDirection: TextDirection.rtl,
//           child: Scaffold(
//             resizeToAvoidBottomInset: false,
//             backgroundColor: ColorManager.transparentcolor,
//             body: Center(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.symmetric(horizontal: 7.0),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     const LogoSection(),
//                     const SizedBox(height: 50),
//                     Text(
//                       AppStrings.logInTitle,
//                       style: getFirstSemiBoldStyle(color: ColorManager.black),
//                       textAlign: TextAlign.right,
//                     ),
//                     const SizedBox(height: 20),
//                     CustomTextField(
//                       controller: _studentNumberController,
//                       label: AppStrings.studentId,
//                       icon: Icons.person,
//                       keyboardType: TextInputType.number,
//                       obscureText: false,
//                     ),
//                     const SizedBox(height: 10),
//                     CustomTextField(
//                       controller: _passwordController,
//                       label: AppStrings.password,
//                       icon: Icons.lock,
//                       keyboardType: TextInputType.text,
//                       obscureText: true,
//                     ),
//                     const SizedBox(height: 10),
//                     BuildRememberMeCheckbox(
//                       studentId: _studentNumberController.text,
//                       password: _passwordController.text,
//                     ),
//                     const SizedBox(height: 40),
//                     LoginButton(
//                       onPressed: _handleLogin,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
