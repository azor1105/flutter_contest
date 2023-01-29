part of 'country_cubit.dart';

class CountryState extends Equatable {
  const CountryState({
    required this.countries,
    this.status = Status.pure,
    this.errorText = '',
  });

  final List<CountriesModel> countries;
  final Status status;
  final String errorText;

  CountryState copyWith({
    List<CountriesModel>? countries,
    Status? status,
    String? errorText,
  }) =>
      CountryState(
        countries: countries ?? this.countries,
        errorText: errorText ?? this.errorText,
        status: status ?? this.status,
      );

  @override
  List<Object> get props => [countries, status, errorText];
}
