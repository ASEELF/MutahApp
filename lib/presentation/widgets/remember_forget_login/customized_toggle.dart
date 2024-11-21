import 'package:flutter/material.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:mutahapplication/presentation/resources/color_manager.dart';

class CustomSwitchExample extends StatefulWidget {
  @override
  _CustomSwitchExampleState createState() => _CustomSwitchExampleState();
}

class _CustomSwitchExampleState extends State<CustomSwitchExample> {
  bool positive = false;

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedToggleSwitch<bool>(
      current: positive,
      values: const [false, true],
      spacing: 0.0,
      indicatorSize: const Size.square(23.0), // this is the size of the circle
      animationDuration: const Duration(milliseconds: 200),
      animationCurve: Curves.linear,
      onChanged: (b) => setState(() => positive = b),
      iconBuilder: (context, local, global) {
        return const SizedBox(); // Empty icon as per your requirements
      },
      cursors: const ToggleCursors(
        defaultCursor: SystemMouseCursors.click,
      ),
      onTap: (_) => setState(() => positive = !positive),
      iconsTappable: false,

      // WrapperBuilder creates the toggle's background track, which remains grey
      wrapperBuilder: (context, global, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              left: 0.0,
              right: 0.0,
              height: 10.0, //this is the height of the indicator in the toggle
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: ColorManager.darkGrey, // Constant grey track color
                  borderRadius: BorderRadius.circular(50.0),
                ),
              ),
            ),
            child,
          ],
        );
      },

      // ForegroundIndicatorBuilder creates the indicator circle (the round "knob" that moves)
      foregroundIndicatorBuilder: (context, global) {
        return SizedBox.fromSize(
          size: global.indicatorSize,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: positive ?ColorManager.mediumgrey:  ColorManager.red  ,
              // Red when on, grey when off
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
    );
  }
}

