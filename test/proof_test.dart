import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:dart_merkle_lib/src/dart_merkle_lib_base.dart';
import 'package:dart_merkle_lib/src/proof.dart' as p;
import 'package:test/test.dart';

import 'common_helper.dart';
import 'fixtures.dart';

void main() {
  test('proofs, for each fixture', () {
    for (Fixture f in fixtures) {
      for (Uint8List v in f.values) {
        List<Uint8List?>? proof = p.merkleProof(f.tree, v);
        expect(proof, equals(f.proofs[hex.encode(v)]));

        // map to Buffers for verify
        expect(p.verify(proof!, getDigestFn(f)), isTrue);
      }
    }
  });

  test('various node count proofs', () {
    int maxNodes = 200;
    List<Uint8List> leaves = [];
    for (var i = 0; i < maxNodes; ++i) {
      var b = Uint8List(32);
      b.buffer.asByteData().setUint32(0, i);
      leaves.add(b);
    }

    for (var k = 0; k < maxNodes; ++k) {
      var bag = leaves.sublist(0, k);
      var tree = merkle(bag, getDigestFnStr('sha1'));

      for (var v in bag) {
        var proof = p.merkleProof(tree, v);

        expect(proof, isNotNull);

        expect(p.verify(proof!, getDigestFnStr('sha1')), isTrue);
      }
    }
  });
}
