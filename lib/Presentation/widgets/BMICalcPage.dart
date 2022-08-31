import 'dart:ffi';

import 'package:bmi_calc/Presentation/buttons/BottomButton.dart';
import 'package:bmi_calc/Presentation/widgets/age_weight_quer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Domain/slider_bloc.dart';

class BMICalcPage extends StatelessWidget {
  const BMICalcPage({Key? key}) : super(key: key);
//Das hat mir so jemand aus StackOver geschickt um den Slider zu verwenden, ist finde ich eine coole idee, richtig verstehen tue ich die aber nicht xD
  Widget _buildItem(
    BuildContext context,//er baut hier irgend ein widget das halt der slider ist
    double value,
  ) {
    final themeData = Theme.of(context);
    return Column(
      children: [
        Text(
          "${value.toStringAsFixed(0)} cm",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            inactiveTrackColor: Color(0xFF8D8E98),
            activeTrackColor: Colors.white,
            thumbColor: themeData.colorScheme.secondary,
            overlayColor: Color.fromRGBO(61, 126, 126, 0.2196078431372549),
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
          ),
          child: Slider(
            min: 60,
            max: 230,
            value: value,
            onChanged: (v) {
              BlocProvider.of<SliderBloc>(context)
                  .add(SliderOnChangedEvent(value: v));//Das ist der Value den ich ja für die berechnung bräucht, das verstehe ich aber nicht wie ich das zum bloc schicke
//weil ich das ja nochmal schicken müsste, aktuell umfasst der bloc ja ausschließlich den slider, ich brauch aber die Calculator logic.
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "BMI Rechner",
            style: themeData.textTheme.headline1!.copyWith(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              AgeOrWeight(title: "Alter", lableText: "In Jahren"), //das war alles ich, bis zum BlocConsumer verstehe ich es logischerweise.
              SizedBox(width: 10,),
              AgeOrWeight(title: "Gewicht", lableText: "In Kg"), //AgeOrWeight widget wird noch mal interessant
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            elevation: 15,
            borderRadius: BorderRadius.circular((15)),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular((15)),
                color: Colors.blueGrey[800],
              ),
              height: 190,
              width: 190,
              child: Column(
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Größe",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocConsumer<SliderBloc, SliderState>( //wieder das anfangsthema, zu viele Bloc.... sachen. Ich weiß einfach noch nicht wann ich was verwende
                    listener: (context, state) {},//Was hier abgeht verstehe ich nicht, listener mit leeren funktionsblock
                    builder: (context, state) {
                      if (state is SliderInitial) {
                        return Column(
                          children: [
                            _buildItem(context, state.value),//hier ist noch mal der value den ich haben will, was übergeben wird verstehe ich aber soweit
                          ],
                        );
                      }

                      if (state is SliderOnChanged) {
                        return Column(
                          children: [
                            _buildItem(context, state.value),
                          ],
                        );
                      }

                      return const Text("unimplemented state");
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.all(8),
          child: BottomButton(btnText: "BMI Berechnen", callback: () {}),
        ),
      ],
    );
  }
}
