import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:t/domain/model/city.dart';
import 'package:t/domain/repository/city_repository.dart';
import 'package:t/internal/di.dart';

class SelectCityWidget extends StatefulWidget {
  const SelectCityWidget({super.key, required this.onSubmit});

  final Function(City) onSubmit;

  @override
  State<SelectCityWidget> createState() => _MainPageState();
}

class _MainPageState extends State<SelectCityWidget> {
  TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TypeAheadField<City>(
      controller: cityController,
      suggestionsCallback: (search) async {
        if (search.length >= 3 && search.length < 50) {
            return await sl<CityRepository>().getCities(keyword: search);
        }
        return null;

      },
      builder: (context, controller, focusNode) {
        return TextField(
            controller: cityController,
            focusNode: focusNode,
            autofocus: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'City',
            ));
      },
      itemBuilder: (context, city) {
        return ListTile(
          title: Text(city.name),
          subtitle: Text(city.lat.toString()),
        );
      },
      onSelected: (city) {
        setState(() {
          cityController.text = city.name;
          widget.onSubmit(city);
        });
      },
    );
  }
}
