// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class RBI {
  bool verifyPin(int pin);
  double checkbalance({required int pin});
  Future<double> withdraw({required int pin, required double amount});
  double deposit({required int pin, required double amount});

}


class Bank extends RBI {
  final int _pin;
  double _balance;

  Bank(this._balance,this._pin);

  @override
  double checkbalance({required int pin}) {
    if(verifyPin(pin)) {
      return _balance;
    } throw Exception();
  }

  @override
  double deposit({required int pin, required double amount}) {
    if(verifyPin(pin) && (amount > 100)) {
      _balance += amount;
      return _balance;
    } throw Exception();
  }

  @override
  verifyPin(int pin) {
    if(pin == _pin) {
      return true;
    }
    return false;
  }


// Asynchronous method
  @override
  Future<double> withdraw({required int pin, required double amount}) async {
    await Future.delayed(Duration(microseconds: 1500));
    if(verifyPin(pin) && (_balance > amount)) {
      _balance -= amount;
      return _balance;
    } throw Exception();

  }
  
}
