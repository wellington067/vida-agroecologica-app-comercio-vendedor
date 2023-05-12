import 'package:flutter/material.dart';
import 'package:thunderapp/shared/constants/app_number_constants.dart';
import 'package:thunderapp/shared/constants/style_constants.dart';

class DropDownEditProduct extends StatelessWidget {
  final dropValue = ValueNotifier('');
  final dropOpcoes = ['Melancia', 'Manga', 'Banana', 'Maçã'];

  DropDownEditProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 4),
          child: Text(
            'Nome do produto',
            style: TextStyle(color: kTextButtonColor),
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          width: size.width,
          height: size.height * 0.06,
          child: ValueListenableBuilder(
              valueListenable: dropValue,
              builder: (BuildContext context, String value, _) {
                return DropdownButtonFormField<String>(
                  isExpanded: true,
                  decoration: const InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border:  OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6),),
                      borderSide: BorderSide(color: kTextButtonColor),
                    ),
                  ),
                  icon: Icon(Icons.keyboard_arrow_down, color: kPrimaryColor, size: size.width * 0.05,),
                  hint: Text('Selecione'),
                  value: (value.isEmpty) ? null : value,
                  onChanged: (escolha) => dropValue.value = escolha.toString(),
                  items: dropOpcoes
                      .map(
                        (op) => DropdownMenuItem(
                          child: Text(op),
                          value: op,
                        ),
                      )
                      .toList(),
                );
              }),
        ),
      ],
    );
  }
}