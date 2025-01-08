// import 'package:flutter/material.dart';
// import 'package:animated_toggle_switch/animated_toggle_switch.dart';
// import 'package:mutahapplication/presentation/resources/color_manager.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class CustomSwitchExample extends StatefulWidget {
//   final String studentId;
//   final String password;
//
//   CustomSwitchExample({required this.studentId, required this.password});
//
//   @override
//   _CustomSwitchExampleState createState() => _CustomSwitchExampleState();
// }
//
// class _CustomSwitchExampleState extends State<CustomSwitchExample> {
//   bool positive = false;
//
//   // Function to store credentials in SharedPreferences
//   Future<void> storeCredentials(String studentId, String password) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     // Print to check if we got a valid instance
//     print("SharedPreferences instance: $prefs");
//
//     bool studentIdSaved = await prefs.setString('studentId', studentId);
//     bool passwordSaved = await prefs.setString('password', password);
//
//     // Print to check if the data is being saved
//     print("Student ID saved: $studentIdSaved");
//     print("Password saved: $passwordSaved");
//   }
//
//   // Function to clear stored credentials
//   Future<void> clearCredentials() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove('studentId');
//     await prefs.remove('password');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomAnimatedToggleSwitch<bool>(
//       current: positive,
//       values: const [false, true],
//       spacing: 0.0,
//       indicatorSize: const Size.square(23.0), // Size of the circle
//       animationDuration: const Duration(milliseconds: 200),
//       animationCurve: Curves.linear,
//       onChanged: (b) => setState(() => positive = b),
//       onTap: (_) async {
//         setState(() {
//           positive = !positive;
//         });
//
//         // Store the credentials when toggle is on
//         if (positive) {
//           await storeCredentials(widget.studentId, widget.password);
//
//           // Check if the credentials are stored correctly by retrieving them
//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           String? savedStudentId = prefs.getString('studentId');
//           String? savedPassword = prefs.getString('password');
//
//           if (savedStudentId != null && savedPassword != null) {
//             // You can show a success message or print the credentials for testing
//             print("Credentials saved: $savedStudentId, $savedPassword");
//           } else {
//             print("Failed to save credentials.");
//           }
//         } else {
//           // Clear credentials when toggle is off
//           await clearCredentials();
//         }
//       },
//       // Wrapper for background track
//       wrapperBuilder: (context, global, child) {
//         return Stack(
//           alignment: Alignment.center,
//           children: [
//             Positioned(
//               left: 0.0,
//               right: 0.0,
//               height: 10.0,
//               child: DecoratedBox(
//                 decoration: BoxDecoration(
//                   color: ColorManager.darkGrey, // Grey track color
//                   borderRadius: BorderRadius.circular(50.0),
//                 ),
//               ),
//             ),
//             child,
//           ],
//         );
//       },
//       // Foreground for the indicator circle (the "knob")
//       foregroundIndicatorBuilder: (context, global) {
//         return SizedBox.fromSize(
//           size: global.indicatorSize,
//           child: DecoratedBox(
//             decoration: BoxDecoration(
//               color: positive ? ColorManager.mediumgrey : ColorManager.red,
//               borderRadius: BorderRadius.circular(30.0),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.black38,
//                   spreadRadius: 0.05,
//                   blurRadius: 1.1,
//                   offset: Offset(0.0, 0.8),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//       iconBuilder: (context, local, global) {
//         return const SizedBox(); // Empty icon as per your requirements
//       },
//     );
//   }
// }
//
//
//
// // import 'package:flutter/material.dart';
// // import 'package:animated_toggle_switch/animated_toggle_switch.dart';
// // import 'package:mutahapplication/presentation/resources/color_manager.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // class CustomSwitchExample extends StatefulWidget {
// //   final String studentId;
// //   final String password;
// //
// //   CustomSwitchExample({required this.studentId, required this.password});
// //
// //   @override
// //   _CustomSwitchExampleState createState() => _CustomSwitchExampleState();
// // }
// //
// // class _CustomSwitchExampleState extends State<CustomSwitchExample> {
// //   bool positive = false;
// //
// //   // Function to store credentials in SharedPreferences
// //   void storeCredentials(String studentId, String password) async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     await prefs.setString('studentId', studentId);
// //     await prefs.setString('password', password);
// //   }
// //
// //   // Function to clear stored credentials
// //   void clearCredentials() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     await prefs.remove('studentId');
// //     await prefs.remove('password');
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return CustomAnimatedToggleSwitch<bool>(
// //       current: positive,
// //       values: const [false, true],
// //       spacing: 0.0,
// //       indicatorSize: const Size.square(23.0), // Size of the circle
// //       animationDuration: const Duration(milliseconds: 200),
// //       animationCurve: Curves.linear,
// //       onChanged: (b) => setState(() => positive = b),
// //       onTap: (_) async {
// //         setState(() {
// //           positive = !positive;
// //         });
// //
// //         // Store the credentials when toggle is on
// //         if (positive) {
// //            storeCredentials(widget.studentId, widget.password);
// //
// //           // Check if the credentials are stored correctly by retrieving them
// //           SharedPreferences prefs = await SharedPreferences.getInstance();
// //           String? savedStudentId = prefs.getString('studentId');
// //           String? savedPassword = prefs.getString('password');
// //
// //           if (savedStudentId != null && savedPassword != null) {
// //             // You can show a success message or print the credentials for testing
// //             print("Credentials saved: $savedStudentId, $savedPassword");
// //           } else {
// //             print("Failed to save credentials.");
// //           }
// //         } else {
// //           // Clear credentials when toggle is off
// //            clearCredentials();
// //         }
// //       },
// //       // Wrapper for background track
// //       wrapperBuilder: (context, global, child) {
// //         return Stack(
// //           alignment: Alignment.center,
// //           children: [
// //             Positioned(
// //               left: 0.0,
// //               right: 0.0,
// //               height: 10.0,
// //               child: DecoratedBox(
// //                 decoration: BoxDecoration(
// //                   color: ColorManager.darkGrey, // Grey track color
// //                   borderRadius: BorderRadius.circular(50.0),
// //                 ),
// //               ),
// //             ),
// //             child,
// //           ],
// //         );
// //       },
// //       // Foreground for the indicator circle (the "knob")
// //       foregroundIndicatorBuilder: (context, global) {
// //         return SizedBox.fromSize(
// //           size: global.indicatorSize,
// //           child: DecoratedBox(
// //             decoration: BoxDecoration(
// //               color: positive ? ColorManager.mediumgrey : ColorManager.red,
// //               borderRadius: BorderRadius.circular(30.0),
// //               boxShadow: const [
// //                 BoxShadow(
// //                   color: Colors.black38,
// //                   spreadRadius: 0.05,
// //                   blurRadius: 1.1,
// //                   offset: Offset(0.0, 0.8),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //       iconBuilder: (context, local, global) {
// //         return const SizedBox(); // Empty icon as per your requirements
// //       },
// //     );
// //   }
// // }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// // import 'package:flutter/material.dart';
// // import 'package:animated_toggle_switch/animated_toggle_switch.dart';
// // import 'package:mutahapplication/presentation/resources/color_manager.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // class CustomSwitchExample extends StatefulWidget {
// //   final String studentId;
// //   final String password;
// //
// //   CustomSwitchExample({required this.studentId, required this.password});
// //
// //   @override
// //   _CustomSwitchExampleState createState() => _CustomSwitchExampleState();
// // }
// //
// // class _CustomSwitchExampleState extends State<CustomSwitchExample> {
// //   bool positive = false;
// //
// //   // Function to store credentials in SharedPreferences
// //   void storeCredentials(String studentId, String password) async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     await prefs.setString('studentId', studentId);
// //     await prefs.setString('password', password);
// //   }
// //
// //   // Function to clear stored credentials
// //   void clearCredentials() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     await prefs.remove('studentId');
// //     await prefs.remove('password');
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return CustomAnimatedToggleSwitch<bool>(
// //       current: positive,
// //       values: const [false, true],
// //       spacing: 0.0,
// //       indicatorSize: const Size.square(23.0), // Size of the circle
// //       animationDuration: const Duration(milliseconds: 200),
// //       animationCurve: Curves.linear,
// //       onChanged: (b) => setState(() => positive = b),
// //       onTap: (_) {
// //         setState(() {
// //           positive = !positive;
// //
// //           // Store credentials when toggle is on
// //           if (positive) {
// //             storeCredentials(widget.studentId, widget.password);
// //           } else {
// //             clearCredentials();
// //           }
// //         });
// //       },
// //       // Wrapper for background track
// //       wrapperBuilder: (context, global, child) {
// //         return Stack(
// //           alignment: Alignment.center,
// //           children: [
// //             Positioned(
// //               left: 0.0,
// //               right: 0.0,
// //               height: 10.0,
// //               child: DecoratedBox(
// //                 decoration: BoxDecoration(
// //                   color: ColorManager.darkGrey, // Grey track color
// //                   borderRadius: BorderRadius.circular(50.0),
// //                 ),
// //               ),
// //             ),
// //             child,
// //           ],
// //         );
// //       },
// //       // Foreground for the indicator circle (the "knob")
// //       foregroundIndicatorBuilder: (context, global) {
// //         return SizedBox.fromSize(
// //           size: global.indicatorSize,
// //           child: DecoratedBox(
// //             decoration: BoxDecoration(
// //               color: positive ? ColorManager.mediumgrey : ColorManager.red,
// //               borderRadius: BorderRadius.circular(30.0),
// //               boxShadow: const [
// //                 BoxShadow(
// //                   color: Colors.black38,
// //                   spreadRadius: 0.05,
// //                   blurRadius: 1.1,
// //                   offset: Offset(0.0, 0.8),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },  iconBuilder: (context, local, global) {
// //        return const SizedBox(); // Empty icon as per your requirements
// //        },
// //     );
// //   }
// // }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// //
// // class CustomSwitchExample extends StatefulWidget {
// //   @override
// //   _CustomSwitchExampleState createState() => _CustomSwitchExampleState();
// // }
// //
// // class _CustomSwitchExampleState extends State<CustomSwitchExample> {
// //   bool positive = false;
// //
// //   // Function to store credentials in SharedPreferences
// //   void storeCredentials(String studentId, String password) async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     await prefs.setString('studentId', studentId);
// //     await prefs.setString('password', password);
// //   }
// //
// //   // Function to retrieve credentials from SharedPreferences
// //   Future<Map<String, String>> getCredentials() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     String studentId = prefs.getString('studentId') ?? '';
// //     String password = prefs.getString('password') ?? '';
// //     return {'studentId': studentId, 'password': password};
// //   }
// //
// //   // Function to clear stored credentials
// //   void clearCredentials() async {
// //     SharedPreferences prefs = await SharedPreferences.getInstance();
// //     await prefs.remove('studentId');
// //     await prefs.remove('password');
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return CustomAnimatedToggleSwitch<bool>(
// //       current: positive,
// //       values: const [false, true],
// //       spacing: 0.0,
// //       indicatorSize: const Size.square(23.0), // this is the size of the circle
// //       animationDuration: const Duration(milliseconds: 200),
// //       animationCurve: Curves.linear,
// //       onChanged: (b) => setState(() => positive = b),
// //       iconBuilder: (context, local, global) {
// //         return const SizedBox(); // Empty icon as per your requirements
// //       },
// //       cursors: const ToggleCursors(
// //         defaultCursor: SystemMouseCursors.click,
// //       ),
// //       onTap: (_) {
// //         setState(() {
// //           positive = !positive;
// //
// //           // Store the credentials when toggle is on
// //           if (positive) {
// //             storeCredentials('student_id_123', 'password_123');  // Replace with actual input
// //           } else {
// //             clearCredentials();
// //           }
// //         });
// //       },
// //       iconsTappable: false,
// //
// //       // WrapperBuilder creates the toggle's background track, which remains grey
// //       wrapperBuilder: (context, global, child) {
// //         return Stack(
// //           alignment: Alignment.center,
// //           children: [
// //             Positioned(
// //               left: 0.0,
// //               right: 0.0,
// //               height: 10.0, //this is the height of the indicator in the toggle
// //               child: DecoratedBox(
// //                 decoration: BoxDecoration(
// //                   color: ColorManager.darkGrey, // Constant grey track color
// //                   borderRadius: BorderRadius.circular(50.0),
// //                 ),
// //               ),
// //             ),
// //             child,
// //           ],
// //         );
// //       },
// //
// //       // ForegroundIndicatorBuilder creates the indicator circle (the round "knob" that moves)
// //       foregroundIndicatorBuilder: (context, global) {
// //         return SizedBox.fromSize(
// //           size: global.indicatorSize,
// //           child: DecoratedBox(
// //             decoration: BoxDecoration(
// //               color: positive ? ColorManager.mediumgrey : ColorManager.red,
// //               // Red when on, grey when off
// //               borderRadius: BorderRadius.circular(30.0),
// //               boxShadow: const [
// //                 BoxShadow(
// //                   color: Colors.black38,
// //                   spreadRadius: 0.05,
// //                   blurRadius: 1.1,
// //                   offset: Offset(0.0, 0.8),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }
// //
// //
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// // import 'package:flutter/material.dart';
// // import 'package:animated_toggle_switch/animated_toggle_switch.dart';
// // import 'package:mutahapplication/presentation/resources/color_manager.dart';
// //
// // class CustomSwitchExample extends StatefulWidget {
// //   @override
// //   _CustomSwitchExampleState createState() => _CustomSwitchExampleState();
// // }
// //
// // class _CustomSwitchExampleState extends State<CustomSwitchExample> {
// //   bool positive = false;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return CustomAnimatedToggleSwitch<bool>(
// //       current: positive,
// //       values: const [false, true],
// //       spacing: 0.0,
// //       indicatorSize: const Size.square(23.0), // this is the size of the circle
// //       animationDuration: const Duration(milliseconds: 200),
// //       animationCurve: Curves.linear,
// //       onChanged: (b) => setState(() => positive = b),
// //       iconBuilder: (context, local, global) {
// //         return const SizedBox(); // Empty icon as per your requirements
// //       },
// //       cursors: const ToggleCursors(
// //         defaultCursor: SystemMouseCursors.click,
// //       ),
// //       onTap: (_) => setState(() => positive = !positive),
// //       iconsTappable: false,
// //
// //       // WrapperBuilder creates the toggle's background track, which remains grey
// //       wrapperBuilder: (context, global, child) {
// //         return Stack(
// //           alignment: Alignment.center,
// //           children: [
// //             Positioned(
// //               left: 0.0,
// //               right: 0.0,
// //               height: 10.0, //this is the height of the indicator in the toggle
// //               child: DecoratedBox(
// //                 decoration: BoxDecoration(
// //                   color: ColorManager.darkGrey, // Constant grey track color
// //                   borderRadius: BorderRadius.circular(50.0),
// //                 ),
// //               ),
// //             ),
// //             child,
// //           ],
// //         );
// //       },
// //
// //       // ForegroundIndicatorBuilder creates the indicator circle (the round "knob" that moves)
// //       foregroundIndicatorBuilder: (context, global) {
// //         return SizedBox.fromSize(
// //           size: global.indicatorSize,
// //           child: DecoratedBox(
// //             decoration: BoxDecoration(
// //               color: positive ?ColorManager.mediumgrey:  ColorManager.red  ,
// //               // Red when on, grey when off
// //               borderRadius: BorderRadius.circular(30.0),
// //               boxShadow: const [
// //                 BoxShadow(
// //                   color: Colors.black38,
// //                   spreadRadius: 0.05,
// //                   blurRadius: 1.1,
// //                   offset: Offset(0.0, 0.8),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }
// //
//
// import 'package:flutter/material.dart';
// import 'package:animated_toggle_switch/animated_toggle_switch.dart';
// import 'package:mutahapplication/presentation/resources/color_manager.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class CustomSwitchExample extends StatefulWidget {
//   final String studentId;
//   final String password;
//
//   CustomSwitchExample({required this.studentId, required this.password});
//
//   @override
//   _CustomSwitchExampleState createState() => _CustomSwitchExampleState();
// }
//
// class _CustomSwitchExampleState extends State<CustomSwitchExample> {
//   bool positive = false;
//
//   // Function to store credentials in SharedPreferences
//   Future<void> storeCredentials(String studentId, String password) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     // Print to check if we got a valid instance
//     print("SharedPreferences instance: $prefs");
//
//     bool studentIdSaved = await prefs.setString('studentId', studentId);
//     bool passwordSaved = await prefs.setString('password', password);
//
//     // Print to check if the data is being saved
//     print("Student ID saved: $studentIdSaved");
//     print("Password saved: $passwordSaved");
//   }
//
//   // Function to clear stored credentials
//   Future<void> clearCredentials() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove('studentId');
//     await prefs.remove('password');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomAnimatedToggleSwitch<bool>(
//       current: positive,
//       values: const [false, true],
//       spacing: 0.0,
//       indicatorSize: const Size.square(23.0), // Size of the circle
//       animationDuration: const Duration(milliseconds: 200),
//       animationCurve: Curves.linear,
//       onChanged: (b) => setState(() => positive = b),
//       onTap: (_) async {
//         setState(() {
//           positive = !positive;
//         });
//
//         // Store the credentials when toggle is on
//         if (positive) {
//           await storeCredentials(widget.studentId, widget.password);
//
//           // Check if the credentials are stored correctly by retrieving them
//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           String? savedStudentId = prefs.getString('studentId');
//           String? savedPassword = prefs.getString('password');
//
//           if (savedStudentId != null && savedPassword != null) {
//             // You can show a success message or print the credentials for testing
//             print("Credentials saved: $savedStudentId, $savedPassword");
//           } else {
//             print("Failed to save credentials.");
//           }
//         } else {
//           // Clear credentials when toggle is off
//           await clearCredentials();
//         }
//       },
//       // Wrapper for background track
//       wrapperBuilder: (context, global, child) {
//         return Stack(
//           alignment: Alignment.center,
//           children: [
//             Positioned(
//               left: 0.0,
//               right: 0.0,
//               height: 10.0,
//               child: DecoratedBox(
//                 decoration: BoxDecoration(
//                   color: ColorManager.darkGrey, // Grey track color
//                   borderRadius: BorderRadius.circular(50.0),
//                 ),
//               ),
//             ),
//             child,
//           ],
//         );
//       },
//       // Foreground for the indicator circle (the "knob")
//       foregroundIndicatorBuilder: (context, global) {
//         return SizedBox.fromSize(
//           size: global.indicatorSize,
//           child: DecoratedBox(
//             decoration: BoxDecoration(
//               color: positive ? ColorManager.mediumgrey : ColorManager.red,
//               borderRadius: BorderRadius.circular(30.0),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.black38,
//                   spreadRadius: 0.05,
//                   blurRadius: 1.1,
//                   offset: Offset(0.0, 0.8),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//       iconBuilder: (context, local, global) {
//         return const SizedBox(); // Empty icon as per your requirements
//       },
//     );
//   }
// }








//
//
// import 'package:flutter/material.dart';
// import 'package:animated_toggle_switch/animated_toggle_switch.dart';
// import 'package:mutahapplication/presentation/resources/color_manager.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class CustomSwitchExample extends StatefulWidget {
//   final String studentId;
//   final String password;
//
//   CustomSwitchExample({required this.studentId, required this.password});
//
//   @override
//   _CustomSwitchExampleState createState() => _CustomSwitchExampleState();
// }
//
// class _CustomSwitchExampleState extends State<CustomSwitchExample> {
//   bool positive = false;
//   String? storedStudentId;
//   String? storedPassword;
//
//   // Function to store credentials in SharedPreferences
//   Future<void> storeCredentials(String studentId, String password) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     // Print to check if we got a valid instance
//     print("SharedPreferences instance: $prefs");
//
//     bool studentIdSaved = await prefs.setString('studentId', studentId);
//     bool passwordSaved = await prefs.setString('password', password);
//
//     // Print to check if the data is being saved
//     print("Student ID saved: $studentIdSaved");
//     print("Password saved: $passwordSaved");
//   }
//
//   // Function to clear stored credentials
//   Future<void> clearCredentials() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove('studentId');
//     await prefs.remove('password');
//   }
//
//   // Function to load credentials from SharedPreferences
//   Future<void> loadCredentials() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? studentId = prefs.getString('studentId');
//     String? password = prefs.getString('password');
//
//     if (studentId != null && password != null) {
//       setState(() {
//         storedStudentId = studentId;
//         storedPassword = password;
//         positive = true; // Toggle on if credentials exist
//       });
//       print("Credentials loaded: $storedStudentId, $storedPassword");
//     } else {
//       print("No credentials found");
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     loadCredentials(); // Load the credentials when the app starts
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return CustomAnimatedToggleSwitch<bool>(
//       current: positive,
//       values: const [false, true],
//       spacing: 0.0,
//       indicatorSize: const Size.square(23.0), // Size of the circle
//       animationDuration: const Duration(milliseconds: 200),
//       animationCurve: Curves.linear,
//       onChanged: (b) => setState(() => positive = b),
//       onTap: (_) async {
//         setState(() {
//           positive = !positive;
//         });
//
//         // Store the credentials when toggle is on
//         if (positive) {
//           await storeCredentials(widget.studentId, widget.password);
//
//           // Check if the credentials are stored correctly by retrieving them
//           SharedPreferences prefs = await SharedPreferences.getInstance();
//           String? savedStudentId = prefs.getString('studentId');
//           String? savedPassword = prefs.getString('password');
//
//           if (savedStudentId != null && savedPassword != null) {
//             // You can show a success message or print the credentials for testing
//             print("Credentials saved: $savedStudentId, $savedPassword");
//           } else {
//             print("Failed to save credentials.");
//           }
//         } else {
//           // Clear credentials when toggle is off
//           await clearCredentials();
//         }
//       },
//       // Wrapper for background track
//       wrapperBuilder: (context, global, child) {
//         return Stack(
//           alignment: Alignment.center,
//           children: [
//             Positioned(
//               left: 0.0,
//               right: 0.0,
//               height: 10.0,
//               child: DecoratedBox(
//                 decoration: BoxDecoration(
//                   color: ColorManager.darkGrey, // Grey track color
//                   borderRadius: BorderRadius.circular(50.0),
//                 ),
//               ),
//             ),
//             child,
//           ],
//         );
//       },
//       // Foreground for the indicator circle (the "knob")
//       foregroundIndicatorBuilder: (context, global) {
//         return SizedBox.fromSize(
//           size: global.indicatorSize,
//           child: DecoratedBox(
//             decoration: BoxDecoration(
//               color: positive ? ColorManager.mediumgrey : ColorManager.red,
//               borderRadius: BorderRadius.circular(30.0),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.black38,
//                   spreadRadius: 0.05,
//                   blurRadius: 1.1,
//                   offset: Offset(0.0, 0.8),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//       iconBuilder: (context, local, global) {
//         return const SizedBox(); // Empty icon as per your requirements
//       },
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomSwitchExample extends StatefulWidget {
  final String studentId;
  final String password;

  CustomSwitchExample({required this.studentId, required this.password});

  @override
  _CustomSwitchExampleState createState() => _CustomSwitchExampleState();
}

class _CustomSwitchExampleState extends State<CustomSwitchExample> {
  bool positive = false;
  String? storedStudentId;
  String? storedPassword;

  // Load credentials when the widget is initialized
  @override
  void initState() {
    super.initState();
    loadCredentials();
  }

  // Function to load credentials from SharedPreferences
  Future<void> loadCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? studentId = prefs.getString('studentId');
    String? password = prefs.getString('password');

    if (studentId != null && password != null) {
      setState(() {
        storedStudentId = studentId;
        storedPassword = password;
        positive = true; // Toggle on if credentials exist
      });
    }
  }

  // Function to store credentials in SharedPreferences
  Future<void> storeCredentials(String studentId, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('studentId', studentId);
    await prefs.setString('password', password);
  }

  // Function to clear stored credentials
  Future<void> clearCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('studentId');
    await prefs.remove('password');
  }

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedToggleSwitch<bool>(
      current: positive,
      values: const [false, true],
      spacing: 0.0,
      indicatorSize: const Size.square(23.0),
      animationDuration: const Duration(milliseconds: 200),
      animationCurve: Curves.linear,
      onChanged: (b) => setState(() => positive = b),
      onTap: (_) async {
        setState(() {
          positive = !positive;
        });

        // Store the credentials when toggle is on
        if (positive) {
          await storeCredentials(widget.studentId, widget.password);
        } else {
          await clearCredentials();
        }
      },
      wrapperBuilder: (context, global, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0.0,
              right: 0.0,
              height: 10.0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: ColorManager.darkGrey,
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
            child,
          ],
        );
      },
      foregroundIndicatorBuilder: (context, global) {
        return SizedBox.fromSize(
          size: global.indicatorSize,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: positive ? ColorManager.mediumgrey : ColorManager.red,
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  spreadRadius: 0.05,
                  blurRadius: 1.1,
                  offset: Offset(0.0, 0.8),
                ),
              ],
            ),
          ),
        );
      },
      iconBuilder: (context, local, global) {
        return const SizedBox();
      },
    );
  }
}
