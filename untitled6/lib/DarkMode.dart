import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';

/// Hello world !
void main()
{
  runApp(MaterialApp(home: DarkModee(),));
}

class DarkModee extends StatefulWidget {
  const DarkModee({Key? key}) : super(key: key);

  @override
  State<DarkModee> createState() => _DarkModeeState();
}

class _DarkModeeState extends State<DarkModee> {
  bool isDarkModeEnabled = true;
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(color: const Color(0xFF253341)),
          scaffoldBackgroundColor: const Color(0xFF15202B),
        ),
        themeMode: isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
        home: Scaffold(
          body: SizedBox.expand(
            child: Row(
              mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DayNightSwitcher(
                  isDarkModeEnabled: isDarkModeEnabled,
                  onStateChanged: onStateChanged,
                ),
              ],
            ),
          ),
        ),
      );
    }

    /// Called when the state (day / night) has changed.
    void onStateChanged(bool isDarkModeEnabled) {
      setState(() {
        this.isDarkModeEnabled = isDarkModeEnabled;
      });
    }
  }

