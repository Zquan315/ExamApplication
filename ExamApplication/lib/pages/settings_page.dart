import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Components/button.dart';
import '../Components/my_settings_title.dart';
import '../themes/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(40),
                child: Image.asset(
                  "assets/LogoApp.png",
                  scale: 1.5,
                ),
              )
            ],
          ),
          Column(
            children: [
              MySettingsTitle(
                title: "Dark Mode",
                action: CupertinoSwitch(
                  onChanged: (value) =>
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme(),
                  value: Provider.of<ThemeProvider>(context, listen: false)
                      .isDarkMode,
                ),
              ),
              Button(
                label: "Edit information",
                onTap: () {},
              ),
              Button(
                label: "Change password",
                onTap: () {},
              ),
              Button(
                label: "Response us",
                onTap: () {},
              ),
              Button(
                label: "Delete account",
                onTap: () {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
