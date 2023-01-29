part of 'app_cubit.dart';

class AppState extends Equatable {
  final ConnectivityResult? result;

  const AppState({this.result});

  AppState copyWith({ConnectivityResult? result}) =>
      AppState(result: result ?? this.result);

  @override
  List<Object?> get props => [result];
}
