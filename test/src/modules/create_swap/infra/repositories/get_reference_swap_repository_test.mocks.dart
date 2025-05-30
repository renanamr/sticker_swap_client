// Mocks generated by Mockito 5.4.2 from annotations
// in sticker_swap_client/test/src/modules/create_swap/infra/repositories/get_reference_swap_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:sticker_swap_client/src/core/entities/album.dart' as _i4;
import 'package:sticker_swap_client/src/modules/create_swap/infra/datasources/interface_get_reference_swap_datasource.dart'
    as _i2;

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

/// A class which mocks [IGetReferenceSwapDatasource].
///
/// See the documentation for Mockito's code generation for more information.
class MockIGetReferenceSwapDatasource extends _i1.Mock
    implements _i2.IGetReferenceSwapDatasource {
  @override
  _i3.Future<Map<String, _i4.Album>> getReference({
    required String? idSender,
    required String? idOtherUser,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getReference,
          [],
          {
            #idSender: idSender,
            #idOtherUser: idOtherUser,
          },
        ),
        returnValue:
            _i3.Future<Map<String, _i4.Album>>.value(<String, _i4.Album>{}),
        returnValueForMissingStub:
            _i3.Future<Map<String, _i4.Album>>.value(<String, _i4.Album>{}),
      ) as _i3.Future<Map<String, _i4.Album>>);
}
