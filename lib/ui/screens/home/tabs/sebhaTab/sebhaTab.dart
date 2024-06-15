import 'package:flutter/material.dart';
import 'package:islami/ui/utilits/app_assets.dart';
import 'package:islami/ui/utilits/app_colors.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  List<String> text = [
    "سبحان الله",
    "الحمد لله",
    "الله أكبر",
  ];
  int curIndex = 0;
  double angle = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 38,
          ),
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.09),
                height: MediaQuery.of(context).size.height * 0.2,
                child: Transform.rotate(
                    angle: angle,
                    child: Theme(
                      data: ThemeData(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent),
                      child: InkWell(
                          onTap: () {
                            clickOnImage();
                          },
                          child: Image.asset(AppAssets.bodyOfSebha)),
                    )),
              ),
              Container(
                margin: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * 0.05),
                height: MediaQuery.of(context).size.height * 0.1,
                child: Image.asset(AppAssets.headOfSebha),
              )
            ],
          ),
          const Text(
            "عدد التسبيحات",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Container(
            width: 70,
            height: 70,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: AppColors.primiary,
                borderRadius: BorderRadius.circular(25)),
            child: Text(
              "$counter",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 38,
          ),
          Theme(
            data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent),
            child: InkWell(
              onTap: () {
                clickOnImage();
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.symmetric(horizontal: 80),
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.primiary,
                    borderRadius: BorderRadius.circular(25)),
                child: Text(
                  text[curIndex],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void clickOnImage() {
    angle += 3;
    if (counter == 33) {
      counter = 0;

      curIndex++;
      curIndex = curIndex % 3;
    }
    counter++;

    setState(() {});
  }
}
