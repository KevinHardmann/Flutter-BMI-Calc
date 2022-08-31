import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'slider_event.dart';

part 'slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc() : super(const SliderInitial(value: 160)) {
    on<SliderOnChangedEvent>(_onValueChanged);
  }

  _onValueChanged(SliderOnChangedEvent event, emit) {

    emit(SliderOnChanged(value: event.value));

    calculateBmi(hight: event.value);
  }
}

double calculateBmi({required double hight}) {
  return (hight * hight);
//Hier versuche ich im SliderBloc die BMI Berechnung zu machen, glaube das geht nicht :(
}