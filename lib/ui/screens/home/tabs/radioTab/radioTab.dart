import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami/ui/screens/home/tabs/radioTab/radio_page_cubit.dart';
import 'package:islami/ui/utilits/app_assets.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => RadioPageCubit(),
        child: BlocBuilder<RadioPageCubit, RadioPageState>(
          builder: (context, state) {
            var cubit = context.read<RadioPageCubit>();
            if (state is RadioPageInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is RadioPageSuccessState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.radioIcon),
                  const SizedBox(
                    height: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          cubit.radioModel!.radios![cubit.currentIndex].name!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 30),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () {
                          cubit.previousRadio();
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),
                      IconButton(
                        onPressed: () {
                          cubit.togglePlayPause();
                        },
                        icon: Icon(
                          cubit.isPlaying ? Icons.stop : Icons.play_arrow,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          cubit.nextRadio();
                        },
                        icon: const Icon(Icons.arrow_forward),
                      ),
                    ],
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
