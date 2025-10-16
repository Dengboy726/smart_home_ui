import 'package:flutter/material.dart';

class DeviceCard extends StatelessWidget {
  final String deviceName;

  final bool isActive;

  final VoidCallback toggelDeviceState;

  const DeviceCard(
      {super.key,
      required this.deviceName,
      required this.isActive,
      required this.toggelDeviceState});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggelDeviceState,
      child: Container(
        height: 150,
        padding: const EdgeInsets.only(left: 15, top: 10),
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Colors.black,
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
            Icon(
              Icons.lightbulb_outlined,
              size: 40,
              color: isActive ? Colors.black : Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              deviceName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: isActive ? Colors.black : Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    boxShadow: [
                      BoxShadow(
                        color: isActive
                            ? Colors.black.withOpacity(0.2)
                            : Colors.white.withOpacity(0.5),
                        blurRadius: 20,
                        offset: const Offset(0, 4),
                        spreadRadius: 8,
                      )
                    ],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    Icons.power_settings_new,
                    size: 30,
                    color: isActive ? Colors.black : Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
