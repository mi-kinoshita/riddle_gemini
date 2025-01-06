import 'package:flutter/material.dart';

class GradientFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;
  final String label;
  final List<Color> gradientColors;

  const GradientFloatingActionButton({
    super.key,
    required this.onPressed,
    required this.iconData,
    required this.label,
    this.gradientColors = const [Colors.lightBlueAccent, Colors.purpleAccent],
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 4,
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: FloatingActionButton.extended(
          backgroundColor: Colors.transparent,
          elevation: 0,
          icon: Icon(iconData, color: Colors.white,),
          label: Text(label, style: TextStyle(color: Colors.white),),
          onPressed: onPressed,
        ),
      ),
    );
  }
}