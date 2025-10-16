import 'package:demo/widget/action_button.dart';
import 'package:demo/widget/automation_card.dart';
import 'package:flutter/material.dart';

class AutomationDevice extends StatefulWidget {
  const AutomationDevice({super.key});

  @override
  State<AutomationDevice> createState() => _AutomationDeviceState();
}

class _AutomationDeviceState extends State<AutomationDevice> {
  bool isArrivingHomeActivate = true;
  bool isBedTimeActivate = true;

  void toggleArrivingHomeState() {
    setState(() {
      isArrivingHomeActivate = !isArrivingHomeActivate;
    });
  }

  void toggleBedTimeState() {
    setState(() {
      isBedTimeActivate = !isBedTimeActivate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Auromate',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 34,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2,
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ActionButton(
                    label: "Create Max",
                    iconData: Icons.add,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  ActionButton(
                    label: "AI Suggestion",
                    iconData: Icons.lightbulb_outline,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              AutomationCard(
                title: 'Arrival Home',
                location: 'Home',
                time: '15:00 - 17:00',
                actionType: 'Actions',
                actions: const ['Floor Lamp2', 'Ceiling Lamp'],
                isActive: isArrivingHomeActivate,
                toggleState: toggleArrivingHomeState,
                cardColor: Colors.black,
                textColor: Colors.white,
              ),
              const SizedBox(
                height: 20,
              ),
              AutomationCard(
                title: 'Bed Time',
                location: 'Home Bedroom',
                time: '21:00 - 04:00',
                actionType: 'Deactivate',
                actions: const ['Floor Lamp2', 'Ceiling Lamp'],
                isActive: isBedTimeActivate,
                toggleState: toggleBedTimeState,
                cardColor: Color(0xfff5f5f5),
                textColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
