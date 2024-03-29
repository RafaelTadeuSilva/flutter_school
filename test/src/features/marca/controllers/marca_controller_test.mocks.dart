// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_school/test/src/features/marca/controllers/marca_controller_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:flutter_school/export.dart' as _i7;
import 'package:flutter_school/src/features/marca/repositories/marca_repository.dart'
    as _i4;
import 'package:flutter_school/src/shared/api_client/api_client.dart' as _i2;
import 'package:flutter_school/src/shared/either.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i5;

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

class _FakeApiClient_0 extends _i1.SmartFake implements _i2.ApiClient {
  _FakeApiClient_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<E extends Exception, S> extends _i1.SmartFake
    implements _i3.Either<E, S> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MarcaRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMarcaRepository extends _i1.Mock implements _i4.MarcaRepository {
  @override
  String get tabela => (super.noSuchMethod(
        Invocation.getter(#tabela),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.getter(#tabela),
        ),
        returnValueForMissingStub: _i5.dummyValue<String>(
          this,
          Invocation.getter(#tabela),
        ),
      ) as String);

  @override
  _i2.ApiClient get client => (super.noSuchMethod(
        Invocation.getter(#client),
        returnValue: _FakeApiClient_0(
          this,
          Invocation.getter(#client),
        ),
        returnValueForMissingStub: _FakeApiClient_0(
          this,
          Invocation.getter(#client),
        ),
      ) as _i2.ApiClient);

  @override
  _i6.Future<_i3.Either<Exception, List<_i7.Marca>>> listMarcas() =>
      (super.noSuchMethod(
        Invocation.method(
          #listMarcas,
          [],
        ),
        returnValue: _i6.Future<_i3.Either<Exception, List<_i7.Marca>>>.value(
            _FakeEither_1<Exception, List<_i7.Marca>>(
          this,
          Invocation.method(
            #listMarcas,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i3.Either<Exception, List<_i7.Marca>>>.value(
                _FakeEither_1<Exception, List<_i7.Marca>>(
          this,
          Invocation.method(
            #listMarcas,
            [],
          ),
        )),
      ) as _i6.Future<_i3.Either<Exception, List<_i7.Marca>>>);
}
