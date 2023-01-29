import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contest/data/models/card_model/card_model.dart';
import 'package:flutter_contest/data/repos/card_repo/card_repo.dart';
import 'package:flutter_contest/presentation/utils/constants/color_const.dart';
import 'package:flutter_contest/presentation/utils/utils.dart';
import 'package:flutter_contest/presentation/views/tab/tabs/card/widgets/card_item.dart';
import 'package:flutter_contest/presentation/views/tab/tabs/card/widgets/card_types_item.dart';
import 'package:flutter_contest/presentation/views/tab/tabs/card/widgets/my_text_field.dart';
import 'package:flutter_contest/presentation/views/widgets/global_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CardAddScreen extends StatefulWidget {
  const CardAddScreen({super.key});

  @override
  State<CardAddScreen> createState() => _CardAddScreenState();
}

class _CardAddScreenState extends State<CardAddScreen> {
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expireDateController = TextEditingController();
  TextEditingController cardNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  late MaskTextInputFormatter cardMaskFormatter;
  late MaskTextInputFormatter dateMaskFormatter;

  String cardType = "";
  int selectedIndex = 0;

  @override
  void initState() {
    cardMaskFormatter = MaskTextInputFormatter(
      mask: '#### #### #### ####',
      filter: {
        "#": RegExp(r'[0-9]'),
      },
    );
    dateMaskFormatter = MaskTextInputFormatter(
      mask: '##/##',
      filter: {
        "#": RegExp(r'[0-9]'),
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Karta qo'shing"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardItem(
              cardType: cardType,
              cardHolderName: userNameController.text,
              expireDate: expireDateController.text,
              cardNumber: cardNumberController.text,
              cardName: cardNameController.text,
              gradient: ColorConst.myGradients[selectedIndex],
            ),
            SizedBox(
              height: 100.h,
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: List.generate(10, (index) {
                  return GestureDetector(
                    onTap: () {
                      selectedIndex = index;
                      setState(() {});
                    },
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            height: 50.w,
                            width: 50.w,
                            margin: EdgeInsets.only(right: 8.w),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: ColorConst.myGradients[index],
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: selectedIndex == index,
                          child: const Positioned(
                            bottom: 0,
                            top: 0,
                            left: 10,
                            child: Icon(
                              Icons.done,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }),
              ),
            ),
            MyTextField(
              controller: cardNumberController,
              text: "Karta raqami",
              inputFormatters: [cardMaskFormatter],
              textInputType: const TextInputType.numberWithOptions(
                  signed: false, decimal: true),
              onChanged: (String value) {
                setState(() {});
              },
            ),
            MyTextField(
              textInputType: const TextInputType.numberWithOptions(
                  signed: false, decimal: true),
              controller: expireDateController,
              text: "Amal qilish muddati",
              onChanged: (String value) {
                var text = expireDateController.text;
                if ((text.length == 5 &&
                        DateTime(int.parse("20${text[3]}${text[4]}"),
                                    int.parse("${text[0]}${text[1]}"))
                                .compareTo(DateTime.now()) <
                            0) ||
                    (text.length == 2 && int.parse(text[0] + text[1]) > 12)) {
                  expireDateController.clear();
                  Utils.getMyToast(
                      message: "Karta amal qilish muddatini to'g'ri kiriting");
                }
                setState(() {});
              },
              inputFormatters: [dateMaskFormatter],
            ),
            MyTextField(
              controller: cardNameController,
              text: "Karta nomi",
              onChanged: (String v) {
                setState(() {});
              },
            ),
            MyTextField(
                controller: userNameController,
                text: "Karta egasi to'liq ismi sharifi",
                onChanged: (String v) {
                  setState(() {});
                }),
            CardTypeItem(
              valueChanged: (String kardType) {
                setState(() {
                  cardType = kardType;
                });
              },
            ),
            GlobalButton(
              onTap: () async {
                if (cardNumberController.text.isNotEmpty &&
                    expireDateController.text.length == 5 &&
                    cardNameController.text.isNotEmpty &&
                    userNameController.text.isNotEmpty &&
                    cardType.isNotEmpty) {
                  var cardModel = CardModel(
                    index: selectedIndex,
                    cardId: '',
                    gradient: ColorConst.myGradients[selectedIndex],
                    cardNumber: cardNumberController.text,
                    cardName: cardNameController.text,
                    moneyAmount: '100000',
                    owner: userNameController.text,
                    expireDate: expireDateController.text,
                    iconImage: '',
                    userId: '',
                    cardType: cardType,
                  );
                  CardRepo(fireStore: FirebaseFirestore.instance).addCard(
                    cardModel: cardModel,
                  );
                  Utils.getMyToast(message: "Muvaffaqiyatli qo'shildi");
                  Navigator.pop(context);
                } else {
                  Utils.getMyToast(message: "Hammasini to'ldiring");
                }
              },
              buttonText: "Qo'shish",
            ),
          ],
        ),
      ),
    );
  }
}
