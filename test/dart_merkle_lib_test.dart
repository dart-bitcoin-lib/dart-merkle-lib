import 'dart:typed_data';

import 'package:dart_merkle_lib/dart_merkle_lib.dart';
import 'package:dart_merkle_lib/src/fast_root.dart';
import 'package:dart_merkle_lib/src/typedefs.dart';
import 'package:test/test.dart';

import 'common_helper.dart';
import 'fixtures.dart';

void main() {
  test('throws on bad types', () {
    for (Fixture f in fixtures) {
      Uint8List fRoot = f.tree[f.tree.length - 1];

      DigestFn digest = getDigestFn(f);
      List<Uint8List> tree = merkle(f.values, digest);
      Uint8List root = fastRoot(f.values, digest);

      expect(tree, equals(f.tree));
      expect(root, equals(fRoot));
    }
  });
}
