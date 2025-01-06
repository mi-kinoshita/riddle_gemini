import 'package:flutter/material.dart';

class DailySection extends StatelessWidget {
  const DailySection({
    super.key,
    required this.dailyRiddle,
  });

  final String dailyRiddle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 8, right: 20, bottom: 8),
      child: Center(
        child: Card(
          color: Colors.grey[300],
          // clipBehavior is necessary because, without it, the InkWell's animation
          // will extend beyond the rounded edges of the [Card] (see https://github.com/flutter/flutter/issues/109776)
          // This comes with a small performance cost, and you should not set [clipBehavior]
          // unless you need it.
          clipBehavior: Clip.hardEdge,
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              debugPrint('Card tapped.');
            },
            child: ListTile(
                title: const Text('きょうのクイズ'),
                titleTextStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[800],
                ),
                subtitle: const Text(
                  'きいろのくだものは？',
                  textAlign: TextAlign.center,
                ),
                subtitleTextStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.black
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ),
    );
  }
}
