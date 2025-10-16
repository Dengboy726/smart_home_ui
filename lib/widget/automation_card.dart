import 'package:demo/widget/custom_shape_painter.dart';
import 'package:demo/widget/custom_switch.dart';
import 'package:flutter/material.dart';

class AutomationCard extends StatelessWidget {
  final String title;
  final String location;
  final String time;
  final String actionType;
  final List<String> actions;
  final bool isActive;
  final VoidCallback toggleState;
  final Color cardColor;
  final Color textColor;

  const AutomationCard(
      {super.key,
      required this.title,
      required this.location,
      required this.time,
      required this.actionType,
      required this.actions,
      required this.isActive,
      required this.toggleState,
      required this.cardColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              CustomSwitch(
                value: isActive,
                onChanged: (value) => toggleState(),
                icon: Icons.power_settings_new_rounded,
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.black54,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        location,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.access_time,
                        color: Colors.black54,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        time,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                height: 120,
                width: 100,
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Positioned(
                      top: 5,
                      left: 5,
                      child: Text(
                        "Floor Lamo 1",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      left: 0,
                      child: ClipRRect(
                        child: Align(
                          alignment: Alignment.topCenter,
                          heightFactor: 0.5,
                          child: CustomPaint(
                            size: const Size(98, 180),
                            painter: CustomShapePainter(Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: -10,
                      child: ClipRRect(
                        child: Align(
                          alignment: Alignment.topLeft,
                          heightFactor: 0.5,
                          child: Image.asset(
                            "assets/images/lamp.png",
                            height: 200,
                            alignment: Alignment.topLeft,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 120,
                width: 100,
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Positioned(
                      top: 5,
                      left: 5,
                      child: Text(
                        "Floor Lamo 2",
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 25,
                      left: 0,
                      child: ClipRRect(
                        child: Align(
                          alignment: Alignment.topCenter,
                          heightFactor: 0.5,
                          child: CustomPaint(
                            size: const Size(92, 190),
                            painter: CustomShapePainter(Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 25,
                      left: 3,
                      child: ClipRRect(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          heightFactor: 0.7,
                          child: Image.asset(
                            "assets/images/ceil_light.png",
                            height: 60,
                            alignment: Alignment.bottomCenter,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: actions.map(
              (action) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            action,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ).toList(),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "+2 other rules * + 5 outher actions",
            style: TextStyle(
              color: Colors.black38,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  }
}
