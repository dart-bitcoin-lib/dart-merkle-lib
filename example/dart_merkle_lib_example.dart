import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:dart_merkle_lib/dart_merkle_lib.dart';
import 'package:dart_merkle_lib/src/fast_root.dart';
import 'package:dart_merkle_lib/src/proof.dart';

Uint8List sha256(Uint8List data) {
  return Uint8List.fromList(crypto.sha256.convert(data.toList()).bytes);
}

List<Uint8List> data = [
  'cafebeef',
  'ffffffff',
  'aaaaaaaa',
  'bbbbbbbb',
  'cccccccc'
].map((x) => Uint8List.fromList(hex.decode(x))).toList();

// ... now, the examples

/// Tree Example
void treeExample() {
  print('Start Tree Example');
  List<Uint8List> tree = merkle(data, sha256);

  print('[\n\t"${tree.map((x) => hex.encode(x)).join('",\n\t"')}"\n]');
  // => [
  // 	"cafebeef",
  // 	"ffffffff",
  // 	"aaaaaaaa",
  // 	"bbbbbbbb",
  // 	"cccccccc",
  // 	"bda5c39dec343da54ce91c57bf8e796c2ca16a1bd8cae6a2cefbdd16efc32578",
  // 	"8b722baf6775a313f1032ba9984c0dce32ff3c40d7a67b5df8de4dbaa43a3db0",
  // 	"3d2f424783df5853c8d7121b1371650c04241f318e1b0cd46bedbc805b9164c3",
  // 	"bb232963fd0efdeacb0fd76e26cf69055fa5facc19a5f5c2f2f27a6925d1db2f",
  // 	"2256e70bea2c591190a0d4d6c1415acd7458fae84d8d85cdc68b851da27777d4",
  // 	"c2692b0e127b3b774a92f6e1d8ff8c3a5ea9eef9a1d389fe294f0a7a2fec9be1"
  // ]
  print('End Tree Example');
}

///Root only (equivalent to `tree[tree.length - 1]`)
void rootOnlyExample() {
  print('Start Root Only Example');
  Uint8List root = fastRoot(data, sha256);
  print(hex.encode(root));
  // => 'c2692b0e127b3b774a92f6e1d8ff8c3a5ea9eef9a1d389fe294f0a7a2fec9be1'
  print('End Root Only Example');
}

/// Proof (with verify)
void proofExample() {
  print('Start Proof Example');
  List<Uint8List> tree = merkle(data, sha256);
  List<Uint8List?>? proof = merkleProof(tree, data[0]);

  if (proof == null) {
    throw Exception('No proof exists!');
  }

  print(
      '[\n\t${proof.map((x) => x == null ? 'null' : '"' + hex.encode(x)).join(',\n\t') + '"'}\n]');
  // => [
  //   'cafebeef',
  //   'ffffffff',
  //   null,
  //   '8b722baf6775a313f1032ba9984c0dce32ff3c40d7a67b5df8de4dbaa43a3db0',
  //   null,
  //   '2256e70bea2c591190a0d4d6c1415acd7458fae84d8d85cdc68b851da27777d4',
  //   'c2692b0e127b3b774a92f6e1d8ff8c3a5ea9eef9a1d389fe294f0a7a2fec9be1'
  // ]

  print(verify(proof, sha256));
  // => true
  print('End Proof Example');
}

void main() {
  treeExample();
  print('\n----------------------------------------------------\n');
  rootOnlyExample();
  print('\n----------------------------------------------------\n');
  proofExample();
}
