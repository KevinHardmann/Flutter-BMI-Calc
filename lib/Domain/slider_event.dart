part of 'slider_bloc.dart';

abstract class SliderEvent extends Equatable {
  const SliderEvent();

  @override
  List<Object> get props => [];
}

class SliderOnChanged extends SliderState {
  final double value;

  const SliderOnChanged({required this.value});

  @override
  List<Object> get props => [value];
}

class SliderOnChangedEvent extends SliderEvent {
    double value;

   SliderOnChangedEvent({
    required this.value,
  });

  @override
  List<Object> get props => [value];
}
//EVents und state verstehe ich sogar, nur nicht was Equatable macht.