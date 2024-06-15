import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islami/model/details_screen_args.dart';
import 'package:islami/ui/screens/details_screen/detailsScreen.dart';
import 'package:islami/ui/utilits/app_assets.dart';
import 'package:islami/ui/utilits/constants.dart';

class QuranTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(flex: 3, child: Image.asset(AppAssets.icQuranTab)),
        const Divider(),
        Text(
          AppLocalizations.of(context)!.suraName,
          style: Theme.of(context).textTheme.displayMedium,
          textAlign: TextAlign.center,
        ),
        const Divider(),
        Expanded(
          flex: 7,
          child: ListView.builder(
              itemCount: Constants.suraNames.length,
              itemBuilder: (_, index) {
                return TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, DetailsScreen.routeName,
                          arguments: DetailsScreenArgs(
                              suraOrHadethName: Constants.suraNames[index],
                              fileName: "${index + 1}.txt",
                              isQuranFile: true));
                    },
                    child: Text(
                      Constants.suraNames[index],
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
