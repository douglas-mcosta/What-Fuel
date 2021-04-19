import 'package:aog/widgets/logo.widgets.dart';
import 'package:aog/widgets/submit-form.dart';
import 'package:aog/widgets/success.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _color = Colors.deepPurple;
  var _gasCtrl = new MoneyMaskedTextController();
  var _alcoolCtrl = new MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  var _resultText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: AnimatedContainer(
          duration: Duration(milliseconds: 1200),
          color: _color,
          child: ListView(
            children: [
              Logo(),
              _completed
                  ? Success(
                      reset: reset,
                      result: _resultText,
                    )
                  : SubmitForm(
                      alcoolCtrl: _alcoolCtrl,
                      gasCtrl: _gasCtrl,
                      busy: _busy,
                      submitFunc: calculate,
                    )
            ],
          ),
        ));
  }

  Future calculate() {
    double alcool =
        double.parse(_alcoolCtrl.text.replaceAll(new RegExp(r'[,.]'), ''));

    double gas =
        double.parse(_gasCtrl.text.replaceAll(new RegExp(r'[,.]'), ''));

    double result = alcool / gas;
    setState(() {
      _color = Colors.deepPurpleAccent;
      _busy = true;
      _completed = false;
    });
    return new Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        if (alcool == 0 || gas == 0) {
          _resultText = "Informe os valores";
        } else if (result >= 0.7) {
          _resultText = "Compensa utilizar Gasolina!";
        } else {
          _resultText = "Compensa utilizar Álcool!";
        }
        _busy = true;
        _completed = true;
      });
    });
  }

  reset() {
    setState(() {
      _alcoolCtrl = new MoneyMaskedTextController();
      _gasCtrl = new MoneyMaskedTextController();
      _completed = false;
      _busy = false;
      _color = Colors.deepPurple;
    });
  }
}
