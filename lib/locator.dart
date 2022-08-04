import 'package:get_it/get_it.dart';
import 'package:testing_future_example/banking_system/atm.dart';
import 'package:testing_future_example/banking_system/bank.dart';

final getIt = GetIt.instance;

void setup(){
  getIt.registerSingleton<Bank>(Bank(50000.0,1234));
  getIt.registerSingleton<ATM>(ATM());
}