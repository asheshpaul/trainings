import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SliderState {
  final int currentIndex;
  final CarouselSliderController controller;

  SliderState({
    required this.currentIndex,
    required this.controller,
  });
}

class SliderCubit extends Cubit<SliderState> {
  SliderCubit()
      : super(SliderState(
          currentIndex: 0,
          controller: CarouselSliderController(),
        ));

  void changeIndex(int index) =>
      emit(SliderState(currentIndex: index, controller: state.controller));

  void nextPage() => state.controller.nextPage();

  void previousPage() => state.controller.previousPage();
}
