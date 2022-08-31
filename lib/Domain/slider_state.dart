part of 'slider_bloc.dart';

abstract class SliderState extends Equatable {
  const SliderState();
  @override
  List<Object> get props => [];
}

class SliderInitial extends SliderState {

  final double value;

  const SliderInitial({required this.value});
  @override
  List<Object> get props => [value];
}
