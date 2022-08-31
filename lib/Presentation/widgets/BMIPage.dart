import 'package:bmi_calc/Presentation/widgets/BMICalcPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Domain/slider_bloc.dart';

class BMIPage extends StatelessWidget {
  const BMIPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(//BlocProvider, BlocProvider.of, BlocConsumer, BlocBuilder. Komm schon, wer soll da durchblicken wann ich was verwende :D Da kann ich ja Vokabeln lernen wie in der Oberstufe
        create: (context) => SliderBloc(),
        child: const BMICalcPage(),
      ),
    );
  }
}
