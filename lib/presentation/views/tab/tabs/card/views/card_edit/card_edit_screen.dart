import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contest/data/models/card_model/card_model.dart';
import 'package:flutter_contest/data/repos/card_repo/card_repo.dart';
import 'package:flutter_contest/presentation/utils/constants/color_const.dart';
import 'package:flutter_contest/presentation/utils/utils.dart';
import 'package:flutter_contest/presentation/views/tab/tabs/card/views/widgets/card_item.dart';
import 'package:flutter_contest/presentation/views/tab/tabs/card/views/widgets/gradient_item.dart';
import 'package:flutter_contest/presentation/views/tab/tabs/card/views/widgets/my_text_field.dart';
import 'package:flutter_contest/presentation/views/widgets/global_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardEditScreen extends StatefulWidget {
  const CardEditScreen({super.key, required this.card});

  final CardModel card;

  @override
  State<CardEditScreen> createState() => _CardEditScreenState();
}

class _CardEditScreenState extends State<CardEditScreen> {
  TextEditingController cardNameC = TextEditingController();
  TextEditingController userNameC = TextEditingController();

  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = widget.card.index;
    cardNameC.text = widget.card.cardName;
    userNameC.text = widget.card.owner;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var card = widget.card;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Kartani tahrirlang!"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardItem(
              cardType: card.cardType,
              cardHolderName: userNameC.text,
              expireDate: card.expireDate,
              cardNumber: card.cardNumber,
              cardName: cardNameC.text,
              gradient: ColorConst.myGradients[selectedIndex],
            ),
            SizedBox(
              height: 100.h,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: List.generate(10, (index) {
                  return GradientItem(
                    onTap: () {
                      selectedIndex = index;
                      setState(() {});
                    },
                    gradient: ColorConst.myGradients[index],
                    isSelected: selectedIndex == index,
                  );
                }),
              ),
            ),
            MyTextField(
              controller: cardNameC,
              text: "Karta nomi",
              onChanged: (String v) {
                setState(() {});
              },
            ),
            MyTextField(
                controller: userNameC,
                text: "Karta egasi to'liq ismi sharifi",
                onChanged: (String v) {
                  setState(() {});
                }),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            GlobalButton(
              onTap: () async {
                if (cardNameC.text.isNotEmpty && userNameC.text.isNotEmpty) {
                  var cardModel = CardModel(
                    cardId: card.cardId,
                    gradient: ColorConst.myGradients[selectedIndex],
                    cardNumber: card.cardNumber,
                    cardName: cardNameC.text,
                    moneyAmount: card.moneyAmount,
                    owner: userNameC.text,
                    expireDate: card.expireDate,
                    iconImage: card.iconImage,
                    userId: card.userId,
                    cardType: card.cardType,
                    index: selectedIndex,
                  );
                  CardRepo(fireStore: FirebaseFirestore.instance)
                      .updateCardData(
                    cardModel: cardModel,
                    docId: card.cardId,
                  );
                  Utils.getMyToast(message: "Muvaffaqiyatli yangilandi");
                  Navigator.pop(context);
                } else {
                  Utils.getMyToast(message: "Hammasini to'ldiring");
                }
              },
              buttonText: "Yangilash",
            ),
          ],
        ),
      ),
    );
  }
}
