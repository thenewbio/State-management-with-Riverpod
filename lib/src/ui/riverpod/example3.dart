// providing list of cities and updating the city on ui based on selected city
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum City {
  stockholm,
  paris,
  london,
}

typedef WeatherEmoji = String;
Future<WeatherEmoji> getWeather(City city) {
  return Future.delayed(
    const Duration(seconds: 1),
    () => {City.stockholm: "ST", City.paris: "PA", City.london: "LO"}[city]!,
  );
}

// UI writes to and reads to this
final currntCityProvider = StateProvider<City?>((ref) => null);

const unknownWeatherEmoji = "..";

// UI reads  this
final weatherProvider = FutureProvider<WeatherEmoji>((ref) {
  final city = ref.watch(currntCityProvider);
  if (city != null) {
    return getWeather(city);
  } else {
    return unknownWeatherEmoji;
  }
});

class Example3 extends ConsumerWidget {
  const Example3({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWeather = ref.watch(weatherProvider);
    // currentWeather.when()
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          currentWeather.when(
              data: (data) => Text(
                    data,
                    style: const TextStyle(fontSize: 40),
                  ),
              error: (_, __) => const Text("Error"),
              loading: () => const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(),
                  )),
          Expanded(
              child: ListView.builder(
                  itemCount: City.values.length,
                  itemBuilder: (context, i) {
                    final city = City.values[i];
                    final isSelected = city == ref.watch(currntCityProvider);

                    return ListTile(
                      title: Text(
                        city.toString(),
                      ),
                      trailing: isSelected ? const Icon(Icons.check) : null,
                      onTap: () =>
                          ref.read(currntCityProvider.notifier).state = city,
                    );
                  }))
        ],
      ),
    );
  }
}
