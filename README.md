# merkle-lib

A performance conscious library for merkle root and tree calculations.

## Warnings

This implementation is vulnerable to a forgery
attack [as a second pre-image attack](https://en.wikipedia.org/wiki/Merkle_tree#Second_preimage_attack), see
these[\[1\]](https://crypto.stackexchange.com/questions/2106/what-is-the-purpose-of-using-different-hash-functions-for-the-leaves-and-interna) [\[2\]](https://crypto.stackexchange.com/questions/43430/what-is-the-reason-to-separate-domains-in-the-internal-hash-algorithm-of-a-merkl/44971#44971)
crypto.stackexchange questions for an explanation. To avoid this vulnerability, you should pre-hash your leaves *using a
different hash function* than the function provided such that `H(x) != H'(x)`.

Additionally, this implementation is vulnerable to a forgery
attack [for an unbalanced merkle tree](https://bitcointalk.org/?topic=102395), wherein, in an unbalanced merkle tree,
the last leaf node can be duplicated to create an artificial balanced tree, resulting in the same root hash. To avoid
this vulnerability [in this implementation], do not accept unbalanced merkle trees in your application.

## Examples

Preamble

``` dart
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;

Uint8List sha256(data) {
  return Uint8List.fromList(crypto.sha1.convert(data).bytes);
}

List<Uint8List> data = [
  'cafebeef',
  'ffffffff',
  'aaaaaaaa',
  'bbbbbbbb',
  'cccccccc'
].map((x) => Uint8List.fromList(hex.decode(x))).toList();

// ... now, the examples
```

### [Tree]((example/dart_merkle_lib_example.dart#L24))

``` dart
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
```

### [Root only (equivalent to `tree[tree.length - 1]`)](example/dart_merkle_lib_example.dart#L46)

``` dart
  Uint8List root = fastRoot(data, sha256);
  print(hex.encode(root));
  // => 'c2692b0e127b3b774a92f6e1d8ff8c3a5ea9eef9a1d389fe294f0a7a2fec9be1'
```

### [Proof (with verify)](example/dart_merkle_lib_example.dart#L55)

``` dart
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
// => true
```