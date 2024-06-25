import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:t/domain/model/city.dart';
import 'package:t/presentation/main/bloc/weather_bloc.dart';
import 'package:t/presentation/main/bloc/weather_event.dart';
import 'package:t/presentation/main/bloc/weather_state.dart';
import 'package:t/presentation/main/ui/widgets/select_city_widget.dart';
import 'package:t/utils/convert.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  City? selectedCity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text("Weather app")),
        body: Column(
          children: [
            BlocProvider(
              create: (context) => WeatherBloc(),
              child: BlocBuilder<WeatherBloc, WeatherState>(
                builder: (context, state) {
                  return Column(
                    children: [
                      SelectCityWidget(
                        onSubmit: (city) {
                          setState(() {
                            selectedCity = city;
                          });

                          BlocProvider.of<WeatherBloc>(context).add(CitySelected(city));
                        },
                      ),
                      if (state is WeatherLoading)
                        const Center(child: CircularProgressIndicator())
                      else if (state is WeatherLoaded)
                        Center(
                          child: Column(
                            children: [
                              Text("Temperature: ${kelvinToCelsius( double.parse(state.weather.temperature)).round() } C"),
                            ],
                          ),
                        )
                      else if (state is WeatherError)
                        Center(
                          child: Text(state.message),
                        )
                    ],
                  );
                },
              ),
            ),
          ],
        ));
  }
}
