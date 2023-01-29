import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_contest/data/models/countries/countries_model.dart';
import 'package:flutter_contest/data/models/status.dart';
import 'package:flutter_contest/data/repos/country/country_repo.dart';
import 'package:flutter_contest/data/services/hive/country_hive/country_hive.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  CountryCubit(CountryRepo countryRepo)
      : _countryRepo = countryRepo,
        super(const CountryState(countries: []));

  final CountryRepo _countryRepo;

  Future<void> getCountries() async {
    emit(state.copyWith(status: Status.loading));
    try {
      var countries = await _countryRepo.getCountries();
      await CountryHiveService.updateValues(countries);
      emit(
        state.copyWith(
          status: Status.success,
          countries: countries,
        ),
      );
    }   catch (e) {
      emit(
        state.copyWith(
          status: Status.failure,
          errorText: e.toString(),
        ),
      );
    }
  }
}
