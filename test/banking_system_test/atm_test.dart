import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:testing_future_example/banking_system/atm.dart';
import 'package:testing_future_example/banking_system/bank.dart';
import 'package:testing_future_example/locator.dart';

import 'atm_test.mocks.dart';




@GenerateMocks([Bank, RBI])
void main() {
  late Bank bank;
  late ATM atm;

  // setup();
      // getIt.unregister<Bank>();
       getIt.registerSingleton<Bank>(MockBank());
      bank = getIt<Bank>();
      getIt.registerSingleton<ATM>(ATM());
      atm = getIt<ATM>();
      
      

  setUp(
    () {
      // bank = MockBank();
      // atm = ATM();
      getIt.unregister<Bank>();
      getIt.unregister<ATM>();
      setup();   
    },
  );

  group(
    'Testing of ATM',
    () {



      group(
        'Testing of checkBalance() ',
        () {
          test(
            'if password is correct',
            () {
              when(bank.checkbalance(pin: 1234)).thenReturn(50000.0);
              verifyNever(bank.checkbalance(pin: 1234));
              final result = atm.checkBalance(pin: 1234);
              verify(bank.checkbalance(pin: 1234));
              expect(result, 50000.0);
            },
          );

          test(
            'if password is incorrect',
            () {
              when(bank.checkbalance(pin: 1234)).thenThrow(Exception());
              verifyNever(bank.checkbalance(pin: 1234));   
              expect(() => atm.checkBalance(pin: 1234), throwsException);
              verify(bank.checkbalance(pin: 1234));
            },
          );
        },
      );



    group('Testing of withdraw() ', () {

      test('if password is correct', () async {
        when(bank.withdraw(pin: 1234, amount: 3000.0)).thenAnswer((_) async {
          return 47000.0;
        });
        verifyNever(bank.withdraw(pin: 1234,amount: 3000.0));
        final result = await atm.withdraw(pin: 1234, amount: 3000);
        expect(result, 47000.0);
        verify(bank.withdraw(pin: 1234,amount: 3000.0));
      },);

      test('if password is incorrect', () async {
        when(bank.withdraw(pin: 1267, amount: 3000.0)).thenThrow(Exception());
        verifyNever(bank.withdraw(pin: 1267,amount: 3000.0));
        expect(() => atm.withdraw(pin: 1267, amount: 3000.0), throwsException);
         verify(bank.withdraw(pin: 1267,amount: 3000.0));   
      },);
      
    },);





    group('Testing of deposit() ', () {

      test('if password is correct', () {
        when(bank.deposit(pin: 1234, amount: 3000.0)).thenReturn(53000.0);
        final result = atm.deposit(pin: 1234, amount: 3000.0);
        expect(result, 53000.0);
        verify(bank.deposit(pin: 1234, amount: 3000.0));
        
      },);


      test('if password is incorrect', () {
        when(bank.deposit(pin: 1233, amount: 3000.0)).thenThrow(Exception());
        verifyNever(bank.deposit(pin: 1233,amount: 3000.0));
        expect(() => atm.deposit(pin: 1233, amount: 3000.0), throwsException);
        verify(bank.deposit(pin: 1233,amount: 3000.0));
      },);
      
    },);
    },
  );



  


// here ATM is dependeing on Bank, method of ATM internally call method of Bank so here we are testing 
// both the functionality of Bank class and ATM class. actually in testing we concentrate on one class only
// this is not we actually do in testing.


  group('testing without stubbing the method', () {
    

    test('checkBalance() ', () {
    double result = getIt.get<ATM>().checkBalance(pin: 1234);
    expect(result, 50000.0);
    expect(() => getIt.get<ATM>().checkBalance(pin: 9876), throwsException);
  },);

    test('withdraw() ', () async {
      double result = await getIt.get<ATM>().withdraw(pin: 1234, amount: 3000.0);
      expect(result, 47000.0);
      expect(() => getIt.get<ATM>().withdraw(pin: 9876, amount: 3000.0), throwsException);
      expect(() => getIt.get<ATM>().withdraw(pin: 1234, amount: 60000.0 ), throwsException);
    },);

    test('deposit() ', () {
      double result = getIt.get<ATM>().deposit(pin: 1234, amount: 6000.0);
      expect(result, 56000.0);
       expect(() => getIt.get<ATM>().deposit(pin: 9876, amount: 3000.0), throwsException);
      expect(() => getIt.get<ATM>().deposit(pin: 1234, amount: 50.0), throwsException);
    },);
    
  },);

  
}


