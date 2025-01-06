import 'package:flutter/material.dart';
import 'package:riddle_gemini/util/shared_prefs.dart';

class TitleSection extends StatefulWidget {
  const TitleSection({super.key});

  @override
  State<TitleSection> createState() => _TitleSectionState();
}

class _TitleSectionState extends State<TitleSection> {
  String userName = 'Guest';
  final ValueNotifier<String?> _nameNotifier = ValueNotifier<String?>(null); // Initialize with null

  @override
  void initState() {
    super.initState();
    SharedPrefs.setPrefsInstance();
    _loadUserName();
  }

  // void _userName() async{
  //   final fetchUserName = SharedPrefs.fetchUserName();
  //
  //   if (fetchUserName != null) {
  //     setState(() {
  //       userName = fetchUserName;
  //     });
  //   } else {
  //     setState(() {
  //       userName = 'No Name';
  //     });
  //   }
  // }

  Future<void> _loadUserName() async {
    setState(() {
      userName = SharedPrefs.fetchUserName() ?? 'No Name';
    });
    _nameNotifier.value = userName; //
    print('=== title _loadUserName $userName');// Update the ValueNotifier
  }

  // Combined method for greeting and icon
  Map<String, dynamic> getTimeBasedInfo() {
    final now = DateTime.now();
    final hour = now.hour;

    if (hour >= 5 && hour < 12) {
      return {
        'greeting': 'おはようございます',
        'icon': Icons.sunny,
      };
    } else if (hour >= 12 && hour < 18) {
      return {
        'greeting': 'こんにちは',
        'icon': Icons.wb_sunny,
      };
    } else {
      return {
        'greeting': 'こんばんは',
        'icon': Icons.nightlight_round,
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    final timeInfo = getTimeBasedInfo(); // Get greeting and icon

    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 20, right: 25, bottom: 5),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      timeInfo['icon'] as IconData, // Access icon from map
                      color: Colors.grey[800],
                      size: 15,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      timeInfo['greeting'] as String, // Access greeting from map
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
                Text(
                  userName,
                  style: const TextStyle(
                    color: Colors.indigoAccent,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.account_circle,
            color: Colors.indigoAccent,
            size: 50,
          ),
          // ValueListenableBuilder<String?>(
          //   valueListenable: _nameNotifier,
          //   builder: (context, name, _) {
          //     return Text(
          //       name ?? 'Guest',
          //       style: const TextStyle(
          //         color: Colors.indigoAccent,
          //         fontSize: 25,
          //       ),
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}