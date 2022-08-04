

import 'package:testing_future_example/banking_system/bank.dart';

import '../locator.dart';

class ATM {

  final bank = getIt<Bank>();

  // ATM(this.bank);
  
  double checkBalance({required int pin}) {
   double balance = bank.checkbalance(pin: pin);
   return balance;
  }

  Future<double> withdraw({required int pin, required double amount}) async {
    double balance = await bank.withdraw(pin: pin, amount: amount);
    return balance;
  }

  double deposit({required int pin, required double amount}) {
    double balance = bank.deposit(pin: pin, amount: amount);
    return balance;
  }
}


