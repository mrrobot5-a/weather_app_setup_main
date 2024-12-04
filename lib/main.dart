import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubit/weather_cubit/weather_states.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/services/weather_service.dart';

//<p>
void main() {
  runApp(BlocProvider(
      create: (context) {
        return WeatherCubit(
          WeatherService(),
        );
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherStates>(builder: (context, state) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          primarySwatch:
              BlocProvider.of<WeatherCubit>(context).weatherModel == null
                  ? Colors.blue
                  : BlocProvider.of<WeatherCubit>(context)
                      .weatherModel!
                      .getThemeColor(),
        ),
        home: HomePage(),
      );
    });
  }
}
