import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/provider/settingProvider.dart';
import 'package:islami/ui/screens/home/tabs/ahadethTab/ahadethTab.dart';
import 'package:islami/ui/screens/home/tabs/quranTab/quranTab.dart';
import 'package:islami/ui/screens/home/tabs/radioTab/radioTab.dart';
import 'package:islami/ui/screens/home/tabs/sebhaTab/sebhaTab.dart';
import 'package:islami/ui/screens/home/tabs/settingsTab/SettingsTab.dart';
import 'package:islami/ui/utilits/app_assets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = "homeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;
  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    const RadioTab(),
    SettingsTab()
  ];

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(settingsProvider.isDarkMode()
                  ? AppAssets.backgroundDark
                  : AppAssets.background),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.islmai,
          ),
        ),
        body: tabs[currentTabIndex],
        bottomNavigationBar: buildBottomNavigationBar(),
      ),
    );
  }

  Widget buildBottomNavigationBar() => Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Theme.of(context).primaryColor),
        child: BottomNavigationBar(
          currentIndex: currentTabIndex,
          onTap: (index) {
            currentTabIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icQuran)),
                label: AppLocalizations.of(context)!.quran),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icAhadeth)),
                label: AppLocalizations.of(context)!.ahadeth),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icSebha)),
                label: AppLocalizations.of(context)!.sebha),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage(AppAssets.icRadio)),
                label: AppLocalizations.of(context)!.radio),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: AppLocalizations.of(context)!.settings,
            )
          ],
        ),
      );
}
