import 'package:flutter/material.dart';
import 'package:life_expectancy/Constans.dart';
import 'package:life_expectancy/ResultPage.dart';
import 'package:life_expectancy/UserData.dart';

import 'MyWidgets.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String selectedGender = "";
  double cigaretteQuantity = 0;
  double sporTime = 0;
  int length = 170;
  int weight = 75;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Yaşam Beklentisi",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          //backgroundColor: Colors.black,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainerWidget(
                      child: buildRowFAButton("BOY"),
                    ),
                  ),
                  Expanded(
                    child: MyContainerWidget(
                      child: buildRowFAButton("KİLO"),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: MyContainerWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Haftada Kaç Gün Spor Yapıyorsun ??",
                      style: kAppTextStyle,
                    ),
                    Text(
                      sporTime.toInt().toString(),
                      style: kAppTextStyle,
                    ),
                    Container(
                      width: 50,
                      child: Divider(
                        height: 5,
                        color: Colors.black,
                      ),
                    ),
                    Slider.adaptive(
                      min: 0, //sliedrın alcağı max ve min degerler
                      max: 7,
                      value: sporTime,
                      onChanged: (double newValue) {
                        setState(() {
                          sporTime = newValue;
                        });
                      },
                      activeColor: Colors.blueGrey,
                      inactiveColor: Colors.brown,
                      divisions: 7, //bölmelere ayırıp mıknatıs gibi iş görür
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: MyContainerWidget(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Günde Kaç Sigara İçiyorsunuz ??",
                      style: kAppTextStyle,
                    ),
                    Text(
                      cigaretteQuantity.toInt().toString(),
                      style: kAppTextStyle,
                    ),
                    Container(
                      width: 50,
                      child: Divider(
                        height: 5,
                        color: Colors.black,
                      ),
                    ),
                    Slider.adaptive(
                      min: 0, //sliedrın alcağı max ve min degerler
                      max: 30,
                      value: cigaretteQuantity,
                      onChanged: (double newValue) {
                        setState(() {
                          cigaretteQuantity = newValue;
                        });
                      },
                      activeColor: Colors.blueGrey,
                      inactiveColor: Colors.brown,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: MyContainerWidget(
                      onPress: () {
                        setState(() {
                          selectedGender = "Kadın";
                        });
                      },
                      MyWColor: selectedGender == "Kadın"
                          ? Colors.white
                          : Colors.white70,
                      child: MaleOrFemale(Icons.female, "Kadın", Colors.pink),
                    ),
                  ),
                  Expanded(
                    child: MyContainerWidget(
                      onPress: () {
                        setState(() {
                          selectedGender = "Erkek";
                        });
                      },
                      MyWColor: selectedGender == "Erkek"
                          ? Colors.white
                          : Colors.white70,
                      child: MaleOrFemale(Icons.male, "Erkek", Colors.blue),
                    ),
                  ),
                ],
              ),
            ),
            MyContainerWidget(
              child: TextButton(
                child: Text(
                  "Hesapla",
                  style: kAppTextStyle,
                  textAlign: TextAlign.center,
                ),
                onPressed: () {
                  print("Genel Hesaplama işlemi ");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Resultpage(
                        UserData(
                          cigaretteQuantity: cigaretteQuantity,
                          length: length,
                          selectedGender: selectedGender,
                          sporTime: sporTime,
                          weight: weight,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ));
  }

  Row buildRowFAButton(String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            text,
            style: kAppTextStyle,
          ),
        ),
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            text == "BOY" ? length.toString() : weight.toString(),
            style: TextStyle(
                color: Colors.black, fontSize: 30, fontStyle: FontStyle.normal),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.add_box_outlined,
                color: Colors.black,
                size: 30,
                weight: 30,
              ),
              onPressed: () {
                setState(() {
                  text == "BOY" ? length++ : weight++;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            FloatingActionButton(
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.indeterminate_check_box_outlined,
                color: Colors.black,
                size: 30,
                weight: 30,
              ),
              onPressed: () {
                setState(() {
                  text == "BOY" ? length-- : weight--;
                });
              },
            )
          ],
        )
      ],
    );
  }
}

/*
      floatingActionButton: Theme(
        data: ThemeData(
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.transparent,
          ),
        ),
        child: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
*/
