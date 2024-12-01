import 'package:flutter/material.dart';
import 'package:life_expectancy/Calculate.dart';
import 'package:life_expectancy/Constans.dart';
import 'package:life_expectancy/MyWidgets.dart';
import 'package:life_expectancy/UserData.dart';

class Resultpage extends StatelessWidget {
  final UserData _user_1;

  Resultpage(this._user_1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SONUÇ SAYFASI"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '<====== Belirtilen İstatistikler ======>\n${Calculate.dataResult(_user_1)}',
                    style: kAppTextStyle,
                  ),
                  Container(
                    width: 200,
                    child: Divider(
                      height: 10,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Yaşam Süresi: ${Calculate.ageCalculate(_user_1).round().toString()}',
                    style: kAppTextStyle,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: MyContainerWidget(
              child: TextButton(
                child: Text(
                  "Geri Dön",
                  style: kAppTextStyle,
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  print("Geri Dönme Butonu aktif ");
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
