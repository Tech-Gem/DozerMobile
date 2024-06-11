// Mocks generated by Mockito 5.4.4 from annotations
// in dozer_mobile/test/features/signup/auth_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:ui' as _i9;

import 'package:dozer_mobile/core/data/apis/api_response_status.dart' as _i7;
import 'package:dozer_mobile/core/data/repositories/auth_repository.dart'
    as _i4;
import 'package:dozer_mobile/presentation/sign_up/controllers/sign_up_controller.dart'
    as _i3;
import 'package:dozer_mobile/presentation/verify_otp/controllers/verify_otp_controller.dart'
    as _i6;
import 'package:flutter/material.dart' as _i10;
import 'package:get/get.dart' as _i2;
import 'package:get/get_state_manager/src/simple/list_notifier.dart' as _i8;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeRx_0<T> extends _i1.SmartFake implements _i2.Rx<T> {
  _FakeRx_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSignUpController_1 extends _i1.SmartFake
    implements _i3.SignUpController {
  _FakeSignUpController_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeInternalFinalCallback_2<T> extends _i1.SmartFake
    implements _i2.InternalFinalCallback<T> {
  _FakeInternalFinalCallback_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRxString_3 extends _i1.SmartFake implements _i2.RxString {
  _FakeRxString_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRxBool_4 extends _i1.SmartFake implements _i2.RxBool {
  _FakeRxBool_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthenticationRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthenticationRepository extends _i1.Mock
    implements _i4.AuthenticationRepository {
  MockAuthenticationRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<bool> sendOtp(String? phoneNumber) => (super.noSuchMethod(
        Invocation.method(
          #sendOtp,
          [phoneNumber],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<bool> verifyOtp(
    String? phoneNumber,
    String? code,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #verifyOtp,
          [
            phoneNumber,
            code,
          ],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<bool> resendOtp(String? phoneNumber) => (super.noSuchMethod(
        Invocation.method(
          #resendOtp,
          [phoneNumber],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<bool> registerUser(
    String? phoneNumber,
    String? email,
    String? password,
    String? firstName,
    String? lastName,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #registerUser,
          [
            phoneNumber,
            email,
            password,
            firstName,
            lastName,
          ],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<bool> login(
    String? phoneNumber,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #login,
          [
            phoneNumber,
            password,
          ],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);

  @override
  _i5.Future<bool> resetPassword(String? phoneNumber) => (super.noSuchMethod(
        Invocation.method(
          #resetPassword,
          [phoneNumber],
        ),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}

/// A class which mocks [VerifyOtpController].
///
/// See the documentation for Mockito's code generation for more information.
class MockVerifyOtpController extends _i1.Mock
    implements _i6.VerifyOtpController {
  MockVerifyOtpController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Rx<_i7.Status> get verificationStatus => (super.noSuchMethod(
        Invocation.getter(#verificationStatus),
        returnValue: _FakeRx_0<_i7.Status>(
          this,
          Invocation.getter(#verificationStatus),
        ),
      ) as _i2.Rx<_i7.Status>);

  @override
  _i3.SignUpController get signUpController => (super.noSuchMethod(
        Invocation.getter(#signUpController),
        returnValue: _FakeSignUpController_1(
          this,
          Invocation.getter(#signUpController),
        ),
      ) as _i3.SignUpController);

  @override
  _i2.InternalFinalCallback<void> get onStart => (super.noSuchMethod(
        Invocation.getter(#onStart),
        returnValue: _FakeInternalFinalCallback_2<void>(
          this,
          Invocation.getter(#onStart),
        ),
      ) as _i2.InternalFinalCallback<void>);

  @override
  _i2.InternalFinalCallback<void> get onDelete => (super.noSuchMethod(
        Invocation.getter(#onDelete),
        returnValue: _FakeInternalFinalCallback_2<void>(
          this,
          Invocation.getter(#onDelete),
        ),
      ) as _i2.InternalFinalCallback<void>);

  @override
  bool get initialized => (super.noSuchMethod(
        Invocation.getter(#initialized),
        returnValue: false,
      ) as bool);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  int get listeners => (super.noSuchMethod(
        Invocation.getter(#listeners),
        returnValue: 0,
      ) as int);

  @override
  _i5.Future<void> verifyOtp(
    String? phoneNumber,
    String? code,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #verifyOtp,
          [
            phoneNumber,
            code,
          ],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> registerUser() => (super.noSuchMethod(
        Invocation.method(
          #registerUser,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> resendOtp() => (super.noSuchMethod(
        Invocation.method(
          #resendOtp,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  void update([
    List<Object>? ids,
    bool? condition = true,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #update,
          [
            ids,
            condition,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onInit() => super.noSuchMethod(
        Invocation.method(
          #onInit,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onReady() => super.noSuchMethod(
        Invocation.method(
          #onReady,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onClose() => super.noSuchMethod(
        Invocation.method(
          #onClose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void $configureLifeCycle() => super.noSuchMethod(
        Invocation.method(
          #$configureLifeCycle,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Disposer addListener(_i8.GetStateUpdate? listener) => (super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValue: () {},
      ) as _i8.Disposer);

  @override
  void removeListener(_i9.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void refresh() => super.noSuchMethod(
        Invocation.method(
          #refresh,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void refreshGroup(Object? id) => super.noSuchMethod(
        Invocation.method(
          #refreshGroup,
          [id],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyChildrens() => super.noSuchMethod(
        Invocation.method(
          #notifyChildrens,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListenerId(
    Object? id,
    _i9.VoidCallback? listener,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #removeListenerId,
          [
            id,
            listener,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Disposer addListenerId(
    Object? key,
    _i8.GetStateUpdate? listener,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addListenerId,
          [
            key,
            listener,
          ],
        ),
        returnValue: () {},
      ) as _i8.Disposer);

  @override
  void disposeId(Object? id) => super.noSuchMethod(
        Invocation.method(
          #disposeId,
          [id],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [SignUpController].
///
/// See the documentation for Mockito's code generation for more information.
class MockSignUpController extends _i1.Mock implements _i3.SignUpController {
  MockSignUpController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Rx<_i10.TextEditingController> get firstNameController =>
      (super.noSuchMethod(
        Invocation.getter(#firstNameController),
        returnValue: _FakeRx_0<_i10.TextEditingController>(
          this,
          Invocation.getter(#firstNameController),
        ),
      ) as _i2.Rx<_i10.TextEditingController>);

  @override
  _i2.Rx<_i10.TextEditingController> get lastNameController =>
      (super.noSuchMethod(
        Invocation.getter(#lastNameController),
        returnValue: _FakeRx_0<_i10.TextEditingController>(
          this,
          Invocation.getter(#lastNameController),
        ),
      ) as _i2.Rx<_i10.TextEditingController>);

  @override
  _i2.Rx<_i10.TextEditingController> get phoneNumberController =>
      (super.noSuchMethod(
        Invocation.getter(#phoneNumberController),
        returnValue: _FakeRx_0<_i10.TextEditingController>(
          this,
          Invocation.getter(#phoneNumberController),
        ),
      ) as _i2.Rx<_i10.TextEditingController>);

  @override
  _i2.Rx<_i10.TextEditingController> get emailController => (super.noSuchMethod(
        Invocation.getter(#emailController),
        returnValue: _FakeRx_0<_i10.TextEditingController>(
          this,
          Invocation.getter(#emailController),
        ),
      ) as _i2.Rx<_i10.TextEditingController>);

  @override
  _i2.Rx<_i10.TextEditingController> get passwordController =>
      (super.noSuchMethod(
        Invocation.getter(#passwordController),
        returnValue: _FakeRx_0<_i10.TextEditingController>(
          this,
          Invocation.getter(#passwordController),
        ),
      ) as _i2.Rx<_i10.TextEditingController>);

  @override
  _i2.RxString get fullNameError => (super.noSuchMethod(
        Invocation.getter(#fullNameError),
        returnValue: _FakeRxString_3(
          this,
          Invocation.getter(#fullNameError),
        ),
      ) as _i2.RxString);

  @override
  _i2.RxString get phoneNumberError => (super.noSuchMethod(
        Invocation.getter(#phoneNumberError),
        returnValue: _FakeRxString_3(
          this,
          Invocation.getter(#phoneNumberError),
        ),
      ) as _i2.RxString);

  @override
  _i2.RxString get emailError => (super.noSuchMethod(
        Invocation.getter(#emailError),
        returnValue: _FakeRxString_3(
          this,
          Invocation.getter(#emailError),
        ),
      ) as _i2.RxString);

  @override
  _i2.RxString get passwordError => (super.noSuchMethod(
        Invocation.getter(#passwordError),
        returnValue: _FakeRxString_3(
          this,
          Invocation.getter(#passwordError),
        ),
      ) as _i2.RxString);

  @override
  _i2.Rx<_i7.Status> get status => (super.noSuchMethod(
        Invocation.getter(#status),
        returnValue: _FakeRx_0<_i7.Status>(
          this,
          Invocation.getter(#status),
        ),
      ) as _i2.Rx<_i7.Status>);

  @override
  _i2.RxBool get passwordVisibility => (super.noSuchMethod(
        Invocation.getter(#passwordVisibility),
        returnValue: _FakeRxBool_4(
          this,
          Invocation.getter(#passwordVisibility),
        ),
      ) as _i2.RxBool);

  @override
  _i2.InternalFinalCallback<void> get onStart => (super.noSuchMethod(
        Invocation.getter(#onStart),
        returnValue: _FakeInternalFinalCallback_2<void>(
          this,
          Invocation.getter(#onStart),
        ),
      ) as _i2.InternalFinalCallback<void>);

  @override
  _i2.InternalFinalCallback<void> get onDelete => (super.noSuchMethod(
        Invocation.getter(#onDelete),
        returnValue: _FakeInternalFinalCallback_2<void>(
          this,
          Invocation.getter(#onDelete),
        ),
      ) as _i2.InternalFinalCallback<void>);

  @override
  bool get initialized => (super.noSuchMethod(
        Invocation.getter(#initialized),
        returnValue: false,
      ) as bool);

  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  int get listeners => (super.noSuchMethod(
        Invocation.getter(#listeners),
        returnValue: 0,
      ) as int);

  @override
  _i5.Future<void> signUp() => (super.noSuchMethod(
        Invocation.method(
          #signUp,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  bool validateFields(
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? email,
    String? password,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #validateFields,
          [
            firstName,
            lastName,
            phoneNumber,
            email,
            password,
          ],
        ),
        returnValue: false,
      ) as bool);

  @override
  void togglePasswordVisibility() => super.noSuchMethod(
        Invocation.method(
          #togglePasswordVisibility,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onClose() => super.noSuchMethod(
        Invocation.method(
          #onClose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void update([
    List<Object>? ids,
    bool? condition = true,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #update,
          [
            ids,
            condition,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onInit() => super.noSuchMethod(
        Invocation.method(
          #onInit,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void onReady() => super.noSuchMethod(
        Invocation.method(
          #onReady,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void $configureLifeCycle() => super.noSuchMethod(
        Invocation.method(
          #$configureLifeCycle,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Disposer addListener(_i8.GetStateUpdate? listener) => (super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValue: () {},
      ) as _i8.Disposer);

  @override
  void removeListener(_i9.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void refresh() => super.noSuchMethod(
        Invocation.method(
          #refresh,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void refreshGroup(Object? id) => super.noSuchMethod(
        Invocation.method(
          #refreshGroup,
          [id],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyChildrens() => super.noSuchMethod(
        Invocation.method(
          #notifyChildrens,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListenerId(
    Object? id,
    _i9.VoidCallback? listener,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #removeListenerId,
          [
            id,
            listener,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.Disposer addListenerId(
    Object? key,
    _i8.GetStateUpdate? listener,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addListenerId,
          [
            key,
            listener,
          ],
        ),
        returnValue: () {},
      ) as _i8.Disposer);

  @override
  void disposeId(Object? id) => super.noSuchMethod(
        Invocation.method(
          #disposeId,
          [id],
        ),
        returnValueForMissingStub: null,
      );
}