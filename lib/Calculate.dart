import 'package:life_expectancy/UserData.dart';

class Calculate {
  UserData _userD;

  Calculate(this._userD);
  static String dataResult(UserData _userD) {
    return '''
Cinsiyet: ${_userD.selectedGender}
Sigara Miktarı: ${_userD.cigaretteQuantity.round()}
Spor Süresi: ${_userD.sporTime}
Boy: ${_userD.length}
Kilo: ${_userD.weight}
''';
  }

  static double ageCalculate(UserData _userD) {
    double age;
    age = 90 + _userD.sporTime - _userD.cigaretteQuantity;
    age += _userD.length / _userD.weight;

    if (_userD.selectedGender == "Kadın") {
      // Koşullu ifade düzeltildi
      return age + 3;
    } else {
      return age;
    }
  }
}
