import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/model/details_screen_args.dart';
import 'package:islami/ui/screens/details_screen/detailsScreen.dart';
import 'package:islami/ui/utilits/app_assets.dart';

class AhadethTab extends StatelessWidget {
  List<String> ahadethNames = List.generate(50, (index) {
    return "${index + 1}الحديث رقم ";
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 3, child: Image.asset(AppAssets.Ahadeth)),
        const Divider(),
        Text(
          AppLocalizations.of(context)!.ahadesname,
          style: Theme.of(context).textTheme.displayMedium,
          textAlign: TextAlign.center,
        ),
        const Divider(),
        Expanded(
          flex: 7,
          child: ListView.builder(
              itemCount: ahadethNames.length,
              itemBuilder: (_, index) {
                return TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, DetailsScreen.routeName,
                          arguments: DetailsScreenArgs(
                              suraOrHadethName: ahadethNames[index],
                              fileName: "h${index + 1}.txt",
                              isQuranFile: false));
                    },
                    child: Text(
                      ahadethNames[index],
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ));
              }),
        ),
      ],
    );
  }
}
