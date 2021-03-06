// ignore_for_file: unused_import, prefer_const_constructors

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_weather_clean_architecture/features/weather/domain/entities/weather.dart';
import 'package:flutter_weather_clean_architecture/features/weather/domain/repositories/weather_repository.dart';
import 'package:flutter_weather_clean_architecture/features/weather/domain/usecases/get_current_weather.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';


void main() {
  late MockWeatherRepository mockWeatherRepository;
  late GetCurrentWeather usecase;

  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    usecase = GetCurrentWeather(mockWeatherRepository);
  });

  const testWeatherDetail = Weather(
    cityName: 'Teresina',
    main: 'Clouds',
    description: 'few clouds',
    iconCode: '02d',
    temperature: 302.28,
    pressure: 1009,
    humidity: 70,
  );

  const tCityName = 'Jakarta';

  test(
    'deve obter detalhes meteorológicos atuais do repositório',
    () async {
      when(mockWeatherRepository.getCurrentWeather(tCityName))
          .thenAnswer((_) async => const Right(testWeatherDetail));

      final result = await usecase.execute(tCityName);

      expect(result, Right(testWeatherDetail));
    },
  );
}