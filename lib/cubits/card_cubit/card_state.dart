part of 'card_cubit.dart';

class CardState extends Equatable {
  const CardState({
    required this.cards,
    this.status = Status.pure,
    this.errorText = '',
  });

  final List<CardModel> cards;
  final Status status;
  final String errorText;

  CardState copyWith({
    List<CardModel>? cards,
    Status? status,
    String? errorText,
  }) =>
      CardState(
        cards: cards ?? this.cards,
        errorText: errorText ?? this.errorText,
        status: status ?? this.status,
      );

  @override
  List<Object> get props => [cards, status, errorText];
}
