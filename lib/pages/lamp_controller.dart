import 'package:demo/widget/color_option_button.dart';
import 'package:demo/widget/custom_shape_painter.dart';
import 'package:demo/widget/power_slider.dart';
import 'package:demo/widget/usage_card.dart';
import 'package:flutter/material.dart';

class LampController extends StatefulWidget {
  const LampController({super.key});

  @override
  State<LampController> createState() => _LampControllerState();
}

class _LampControllerState extends State<LampController> {
  Color selectedColor = Colors.green;
  double brightness = 0.6;

  void updateBrightness(double newBrightness) {
    setState(() {
      brightness = newBrightness;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 20),
              child: Text(
                "Floor Lamp 2",
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "By Godrej",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Positioned(
                  left: 32,
                  top: -25,
                  child: Center(
                    child: CustomPaint(
                      size: const Size(225, 450),
                      painter: CustomShapePainter(selectedColor),
                    ),
                  ),
                ),
                Image.asset(
                  "assets/images/lamp.png",
                  width: double.infinity,
                  height: 500,
                  alignment: Alignment.topLeft,
                ),
                Positioned(
                    top: 50,
                    right: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                ColorOptionButton(
                                  color: Colors.white,
                                  isSelected: selectedColor == Colors.white,
                                  onTap: () {
                                    setState(() {
                                      selectedColor = Colors.white;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                ColorOptionButton(
                                  color: Colors.green,
                                  isSelected: selectedColor == Colors.green,
                                  onTap: () {
                                    setState(() {
                                      selectedColor = Colors.green;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                ColorOptionButton(
                                  color: Colors.yellow,
                                  isSelected: selectedColor == Colors.yellow,
                                  onTap: () {
                                    setState(() {
                                      selectedColor = Colors.yellow;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                ColorOptionButton(
                                  color: Colors.purple,
                                  isSelected: selectedColor == Colors.purple,
                                  onTap: () {
                                    setState(() {
                                      selectedColor = Colors.purple;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                ColorOptionButton(
                                  color: Colors.red,
                                  isSelected: selectedColor == Colors.red,
                                  onTap: () {
                                    setState(() {
                                      selectedColor = Colors.red;
                                    });
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            PowerSlider(
                              brightness: brightness,
                              onChanged: updateBrightness,
                            )
                          ],
                        ),
                        const UsageCard(),
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
