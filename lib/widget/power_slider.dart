import 'package:flutter/material.dart';

class PowerSlider extends StatelessWidget {
  final double brightness;
  final ValueChanged<double> onChanged;

  const PowerSlider(
      {super.key, required this.brightness, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return CustomSlider(
      value: brightness,
      onChanges: onChanged,
    );
  }
}

class CustomSlider extends StatefulWidget {
  final double value;
  final double width;
  final double height;
  final ValueChanged<double> onChanges;

  const CustomSlider(
      {super.key,
      required this.value,
      this.width = 200,
      this.height = 200,
      required this.onChanges});

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
            spreadRadius: -10,
          ),
        ],
      ),
      child: RotatedBox(
        quarterTurns: 3,
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: SliderTheme(
              data: SliderTheme.of(context).copyWith(
                activeTrackColor: Colors.grey,
                inactiveTrackColor: Colors.grey[300],
                trackHeight: widget.height / 3,
                thumbShape: CustomSliderThumbShape(
                  icon: Icons.power_settings_new_rounded,
                ),
                trackShape: CustomTrankShape(),
              ),
              child: Slider(
                value: widget.value,
                onChanged: widget.onChanges,
                min: 0,
                max: 1,
              )),
        ),
      ),
    );
  }
}

class CustomSliderThumShape {}

class CustomTrankShape extends RoundedRectSliderTrackShape {
  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required TextDirection textDirection,
    required Offset thumbCenter,
    Offset? secondaryOffset,
    bool isDiscrete = false,
    bool isEnabled = false,
    double additionalActiveTrackHeight = 2,
  }) {
    final Rect trackRect = getPreferredRect(
        parentBox: parentBox,
        sliderTheme: sliderTheme,
        offset: offset,
        isEnabled: isEnabled,
        isDiscrete: isDiscrete);
    context.canvas.save();
    context.canvas.clipRRect(
      RRect.fromRectAndRadius(
        trackRect,
        const Radius.circular(10),
      ),
    );

    context.canvas.restore();
    super.paint(
      context,
      offset,
      parentBox: parentBox,
      sliderTheme: sliderTheme,
      enableAnimation: enableAnimation,
      textDirection: textDirection,
      thumbCenter: thumbCenter,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
      additionalActiveTrackHeight: additionalActiveTrackHeight,
      secondaryOffset: secondaryOffset,
    );
  }
}

class CustomSliderThumbShape extends SliderComponentShape {
  final IconData icon;

  CustomSliderThumbShape({required this.icon});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(30, 30);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;

    final paint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, 40, paint);

    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: String.fromCharCode(icon.codePoint),
        style: TextStyle(
          fontSize: 16,
          fontFamily: icon.fontFamily,
          color: Colors.white,
        ),
      ),
      textDirection: textDirection,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      center - Offset(textPainter.width / 2, textPainter.height / 2),
    );
  }
}
