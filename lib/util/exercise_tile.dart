import 'package:flutter/material.dart';

class ExerciseTile extends StatelessWidget {
  final VoidCallback onTap;
  final IconData iconData;
  final String exerciseName;
  final int numberOfExercises;

  const ExerciseTile({
    super.key,
    required this.onTap,
    required this.iconData,
    required this.exerciseName,
    required this.numberOfExercises,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(child: Icon(iconData),),
            title: Text(exerciseName),
            subtitle: Text('$numberOfExercises問出題'),
            trailing: Icon(Icons.chevron_right),
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
