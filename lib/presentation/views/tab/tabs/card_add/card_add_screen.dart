import 'package:flutter/material.dart';
import 'package:flutter_contest/presentation/views/tab/tabs/card_add/widgets/card_item.dart';
import 'package:flutter_contest/presentation/views/tab/tabs/card_add/widgets/card_types_item.dart';
import 'package:flutter_contest/presentation/views/tab/tabs/card_add/widgets/my_text_field.dart';
import 'package:flutter_contest/presentation/views/widgets/global_button.dart';
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

  @override
  void initState() {
    cardMaskFormatter = MaskTextInputFormatter(
      mask: '#### #### #### ####',
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
              cardHolderName: userNameController.text,
              expireDate: expireDateController.text,
              cardNumber: cardNumberController.text,
              cardName: cardNameController.text,
            ),
            MyTextField(
              controller: cardNumberController,
              text: "Karta raqami",
              inputFormatters: [cardMaskFormatter],
              textInputType: const TextInputType.numberWithOptions(signed: false, decimal: true),
              onChanged: (String value) {
                setState(() {});
              },
            ),
            MyTextField(controller: expireDateController, text: "Amal qilish muddati", onChanged: (String v) { setState(() {}); }),
            MyTextField(controller: cardNameController, text: "Karta nomi", onChanged: (String v) { setState(() {}); }),
            MyTextField(controller: userNameController, text: "Karta egasi to'liq ismi sharifi", onChanged: (String v) { setState(() {}); }),
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
