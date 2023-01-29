import 'package:flutter/material.dart';
import 'package:flutter_contest/presentation/views/tab/tabs/card_add/widgets/card_item.dart';
import 'package:flutter_contest/presentation/views/tab/tabs/card_add/widgets/card_types_item.dart';
import 'package:flutter_contest/presentation/views/tab/tabs/card_add/widgets/my_text_field.dart';
import 'package:flutter_contest/presentation/views/widgets/global_button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CardAddSceen extends StatefulWidget {
  const CardAddSceen({super.key});

  @override
  State<CardAddSceen> createState() => _CardAddSceenState();
}

class _CardAddSceenState extends State<CardAddSceen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController cardNumberController = TextEditingController();
    TextEditingController expireDateController = TextEditingController();
    TextEditingController cardNameController = TextEditingController();
    TextEditingController userNameController = TextEditingController();
    late MaskTextInputFormatter cardMaskFormatter;

    String expiryDate = '';
    String cardNumber = '';
    String shadowText = "XXXX XXXX XXXX XXXX";

    String updateShadowText(String currentText) {
      shadowText = "XXXX XXXX XXXX XXXX";
      shadowText = shadowText.substring(currentText.length, shadowText.length);
      return currentText + shadowText;
    }

    @override
    void initState() {
      cardMaskFormatter = MaskTextInputFormatter(
        mask: '#### #### #### ####',
        filter: {
          "#": RegExp(r'[0-9]'),
        },
      );
      cardNameController.text = cardMaskFormatter.maskText('');
      updateShadowText('');
      super.initState();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Karta qo'shing"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CardItem(
              cardHolderName: cardNumberController.text,
              expireDate: expireDateController.text,
              cardNumber: (cardNum) {
                cardNumber = cardNum;
              },
            ),
            MyTextField(controller: cardNumberController, text: "Karta raqami", inputFormatters: [cardMaskFormatter], textInputType: const TextInputType.numberWithOptions(
        signed: false,
        decimal: true,
      ),
    onChanged: (String value) {
        setState(() {
          if (value.length == 19) {
            // cardFocusNode.unfocus();
          }
          // widget.cardText.call(value);
          shadowText = updateShadowText(value);
        });
      },
    ),
            MyTextField(controller: expireDateController, text: "Amal qilish muddati"),
            MyTextField(controller: cardNameController, text: "Karta nomi"),
            MyTextField(controller: userNameController, text: "Karta egasi to'liq ismi sharifi"),
            const CardTypeItem(),
            GlobalButton(
              onTap: () {},
              buttonText: "Qo'shish",
            ),
          ],
        ),
      ),
    );
  }
}
