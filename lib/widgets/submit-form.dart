import 'package:aog/widgets/input.widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

import 'loading-button.widget.dart';

class SubmitForm extends StatelessWidget {
  var gasCtrl = new MoneyMaskedTextController();
  var alcoolCtrl = new MoneyMaskedTextController();
  var busy = false;
  Function submitFunc;
  SubmitForm({
    @required this.gasCtrl,
    @required this.alcoolCtrl,
    @required this.busy,
    @required this.submitFunc,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(
            ctrl: gasCtrl,
            label: "Gasolina",
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: 30,
            right: 30,
          ),
          child: Input(
            ctrl: alcoolCtrl,
            label: "Álccol",
          ),
        ),
        SizedBox(
          height: 25,
        ),
        LoadingButton(
          busy: busy,
          text: "CALCULAR",
          func: submitFunc,
          invert: false,
        ),
      ],
    );
  }
}
