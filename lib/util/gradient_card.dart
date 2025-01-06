import 'package:flutter/material.dart';

class GradientCard extends StatelessWidget {
  final VoidCallback onTap;

  const GradientCard({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(left: 25, top: 20, right: 25, bottom: 5),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 5),
                colors: <Color>[
                  Colors.lightBlue,
                  Colors.purple,
                ],
              tileMode: TileMode.mirror,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.auto_awesome,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8,),
                    Text(
                      'クイズを生成する',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Icon(
                  Icons.chevron_right,
                  color: Colors.purpleAccent,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
