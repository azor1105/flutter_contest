import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contest/data/models/status.dart';
import 'package:flutter_contest/data/repos/card_repo/card_repo.dart';
import 'package:flutter_contest/presentation/utils/assets.dart';
import 'package:flutter_contest/presentation/utils/constants/color_const.dart';
import 'package:flutter_contest/presentation/utils/constants/route_names.dart';
import 'package:flutter_contest/presentation/utils/utils.dart';
import 'package:flutter_contest/presentation/views/tab/tabs/card/cubit/card_cubit.dart';
import 'package:flutter_contest/presentation/views/tab/tabs/card/views/widgets/card_item.dart';
import 'package:flutter_contest/presentation/views/tab/tabs/card/views/widgets/delete_dialog.dart';
import 'package:lottie/lottie.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CardCubit(CardRepo(fireStore: FirebaseFirestore.instance))
            ..getUserCards(),
      child: Scaffold(
        backgroundColor: ColorConst.white,
        appBar: AppBar(
          title: const Text("Card Screen"),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.cardAdd);
              },
              icon: const Icon(Icons.add),
            ),
            const SizedBox(width: 10),
          ],
        ),
        body: BlocBuilder<CardCubit, CardState>(builder: (context, state) {
          var st = state.status;

          if (st == Status.loading) {
            return Utils.showLoader();
          } else if (st == Status.success) {
            return state.cards.isNotEmpty
                ? ListView(
                    children: List.generate(state.cards.length, (index) {
                      var card = state.cards[index];

                      return CardItem(
                        buttonsVisible: true,
                        cardHolderName: card.owner,
                        expireDate: card.expireDate.toString(),
                        cardNumber: card.cardNumber,
                        cardName: card.cardName,
                        cardType: card.cardType,
                        gradient: card.gradient,
                        onEditTap: () {
                          Navigator.pushNamed(context, RouteNames.cardEdit,
                              arguments: card);
                        },
                        onDeleteTap: () async {
                          showDeleteDialog(
                            context,
                            onDeleteTap: () async {
                              CardRepo(
                                fireStore: FirebaseFirestore.instance,
                              ).deleteCard(docId: card.cardId);
                              Utils.getMyToast(
                                message: "Muvaffaqiyatli o'chirildi",
                              );
                              Navigator.pop(context);
                            },
                          );
                        },
                      );
                    }),
                  )
                : Center(child: Lottie.asset(Assets.noCardLottie));
          } else if (st == Status.failure) {
            return Center(child: Text(state.errorText));
          }
          return const SizedBox();
        }),
      ),
    );
  }
}
