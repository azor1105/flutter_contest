import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_contest/data/models/card_model/card_model.dart';
import 'package:flutter_contest/data/models/status.dart';
import 'package:flutter_contest/data/repos/card_repo/card_repo.dart';

part 'card_state.dart';

class CardCubit extends Cubit<CardState> {
  CardCubit(CardRepo cardRepo)
      : _cardRepo = cardRepo,
        super(CardState(cards: []));

  final CardRepo _cardRepo;
  late StreamSubscription _subscription;

  Future<void> getUserCards({required String userId}) async {
    emit(state.copyWith(status: Status.loading));
    _subscription = _cardRepo.getUserCards(userId: userId).listen(
      (items) {
        emit(state.copyWith(status: Status.success, cards: items));
      },
      onError: (error) {
        emit(state.copyWith(
            status: Status.failure, errorText: error.toString()));
      },
    );
  }
}
