// Mocks generated by Mockito 5.3.0 from annotations
// in testing_future_example/test/banking_system_test/atm_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:testing_future_example/banking_system/bank.dart' as _i2;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [Bank].
///
/// See the documentation for Mockito's code generation for more information.
class MockBank extends _i1.Mock implements _i2.Bank {
  MockBank() {
    _i1.throwOnMissingStub(this);
  }

  @override
  double checkbalance({int? pin}) =>
      (super.noSuchMethod(Invocation.method(#checkbalance, [], {#pin: pin}),
          returnValue: 0.0) as double);
  @override
  double deposit({int? pin, double? amount}) => (super.noSuchMethod(
      Invocation.method(#deposit, [], {#pin: pin, #amount: amount}),
      returnValue: 0.0) as double);
  @override
  bool verifyPin(int? pin) =>
      (super.noSuchMethod(Invocation.method(#verifyPin, [pin]),
          returnValue: false) as bool);
  @override
  _i3.Future<double> withdraw({int? pin, double? amount}) =>
      (super.noSuchMethod(
          Invocation.method(#withdraw, [], {#pin: pin, #amount: amount}),
          returnValue: _i3.Future<double>.value(0.0)) as _i3.Future<double>);
}