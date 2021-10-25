import 'dart:typed_data';

import 'package:dart_merkle_lib/src/typedefs.dart';

/// constant-space merkle root calculation algorithm
Uint8List fastRoot(List<Uint8List> values, DigestFn digestFn) {
  int length = values.length;
  List<Uint8List> results = List.from(values);

  while (length > 1) {
    var j = 0;

    for (var i = 0; i < length; i += 2, ++j) {
      var left = results[i];
      var right = i + 1 == length ? left : results[i + 1];
      var data = Uint8List(left.length + right.length)
        ..setAll(0, left)
        ..setAll(left.length, right);

      results[j] = digestFn(data);
    }

    length = j;
  }

  return results[0];
}
