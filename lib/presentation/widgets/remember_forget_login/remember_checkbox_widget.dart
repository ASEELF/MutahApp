import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:mutahapplication/presentation/resources/string_manager.dart';
import 'package:mutahapplication/presentation/resources/styles_manager.dart';
import 'package:mutahapplication/presentation/widgets/remember_forget_login/customized_toggle.dart';

class BuildRememberMeCheckbox extends StatefulWidget {
  final String studentId;
  final String password;

  const BuildRememberMeCheckbox(
      {Key? key, required this.studentId, required this.password})
      : super(key: key);

  @override
  _BuildRememberMeCheckboxState createState() =>
      _BuildRememberMeCheckboxState();
}

class _BuildRememberMeCheckboxState extends State<BuildRememberMeCheckbox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomSwitchExample(
              studentId: widget.studentId, // Access via 'widget' keyword
              password: widget.password, // Access via 'widget' keyword
            ),
            const SizedBox(width: 15),
            Text(
              AppStrings.saveInfo,
              style: getFirstRegularStyle(color: ColorManager.black),
            ),
          ],
        ),
        TextButton(
          onPressed: () {
            // Handle "forgot password" logic here
          },
          child: Text(
            AppStrings.forgotPassword,
            style: getFirstRegularStyle(color: ColorManager.black),
          ),
        ),
      ],
    );
  }
}

// import 'package:mutahapplication/presentation/resources/styles_manager.dart';



// import 'package:mutahapplication/presentation/widgets/remember_forget_login/customized_toggle.dart';
//
// class BuildRememberMeCheckbox extends StatefulWidget {
//   const BuildRememberMeCheckbox({super.key});
//
//   @override
//   _BuildRememberMeCheckboxState createState() => _BuildRememberMeCheckboxState();
// }
//
// class _BuildRememberMeCheckboxState extends State<BuildRememberMeCheckbox> {
//
//   int value = 0;
//   int? nullableValue;
//   bool positive = false;
//   bool loading = false;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             CustomSwitchExample(),
//             SizedBox(width: 15),
//              Text(AppStrings.saveInfo,
//             style: getFirstRegularStyle(color: ColorManager.black),
//             ) ,
//
//           ],
//         ),
//         TextButton(
//           onPressed: () {
//             // Handle "forgot password" logic here
//           },
//           child:
//           Text( AppStrings.forgotPassword ,
//             style: getFirstRegularStyle(color: ColorManager.black),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
