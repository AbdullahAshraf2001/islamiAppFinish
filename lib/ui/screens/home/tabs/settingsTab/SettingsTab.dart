import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/provider/settingProvider.dart';
import 'package:islami/ui/utilits/app_colors.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  bool arSwitch = false;
  bool darkMoodSwitch = false;
  late SettingsProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    arSwitch = provider.isArEnabled();
    darkMoodSwitch = provider.isDarkMode();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.settings,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.start,
          ),
          buildSettingsRow("العربيه", arSwitch, (newValue) {
            arSwitch = newValue;
            if (arSwitch) {
              provider.setCurrentLocale("ar");
            } else {
              provider.setCurrentLocale("en");
            }
          }),
          buildSettingsRow(
              AppLocalizations.of(context)!.darkMode, darkMoodSwitch,
              (newValue) {
            darkMoodSwitch = newValue;
            if (darkMoodSwitch) {
              provider.setCurrentMode(ThemeMode.dark);
            } else {
              provider.setCurrentMode(ThemeMode.light);
            }
          })
        ],
      ),
    );
  }

  Widget buildSettingsRow(
      String title, bool switchValue, Function(bool) onChanged) {
    return Row(
      children: [
        SizedBox(
          width: 16,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Spacer(),
        Switch(
          value: switchValue,
          onChanged: onChanged,
          activeColor: AppColors.primiary,
        )
      ],
    );
  }
}
