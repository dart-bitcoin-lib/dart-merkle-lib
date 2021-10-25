import 'dart:typed_data';

import 'package:crypto/crypto.dart' as crypto;
import 'package:dart_merkle_lib/src/typedefs.dart';

import 'fixtures.dart';

extension ListEquals on List {
  bool equals(List list) {
    if (length != list.length) return false;
    return every((item) => list.contains(item));
  }
}

DigestFn getDigestFn(Fixture f) {
  return getDigestFnStr(f.hash);
}

DigestFn getDigestFnStr(String hash) {
  return (Uint8List x) {
    switch (hash) {
      case 'sha1':
        return Uint8List.fromList(crypto.sha1.convert(x).bytes);
      case 'md5':
        return Uint8List.fromList(crypto.md5.convert(x).bytes);
      case 'sha256':
        return Uint8List.fromList(crypto.sha256.convert(x).bytes);
      case 'sha512':
        return Uint8List.fromList(crypto.sha512.convert(x).bytes);
    }
    return Uint8List(0);
  };
}
