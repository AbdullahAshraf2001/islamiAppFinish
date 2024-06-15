import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:islami/ui/screens/home/tabs/radioTab/radioModel.dart';

import 'ApiManager.dart';

class RadioPageCubit extends Cubit<RadioPageState> {
  late ApiManager apiManager;
  late RadioModel? radioModel;
  final player = AudioPlayer();
  int currentIndex = 0;
  bool isPlaying = false;

  RadioPageCubit() : super(RadioPageInitial()) {
    apiManager = ApiManager();
    getRadio();
  }

  Future<void> getRadio() async {
    var radios = await apiManager.getRadios();
    radioModel = radios;
    emit(RadioPageSuccessState(radioModel, isPlaying));
  }

  void nextRadio() {
    if (currentIndex < radioModel!.radios!.length - 1) {
      currentIndex++;
      emit(RadioPageSuccessState(radioModel, isPlaying));
    }
    player.stop();
    isPlaying = false;
  }

  void previousRadio() {
    if (currentIndex > 0) {
      currentIndex--;
      emit(RadioPageSuccessState(radioModel, isPlaying));
    }
    player.stop();
    isPlaying = false;
  }

  void togglePlayPause() async {
    if (isPlaying) {
      await player.stop();
    } else {
      await player.play(UrlSource(radioModel!.radios![currentIndex].url!));
    }
    isPlaying = !isPlaying;
    emit(RadioPageSuccessState(radioModel, isPlaying));
  }
}

abstract class RadioPageState {}

class RadioPageInitial extends RadioPageState {}

class RadioPageSuccessState extends RadioPageState {
  final RadioModel? radioModel;
  final bool isPlaying;

  RadioPageSuccessState(this.radioModel, this.isPlaying);
}

