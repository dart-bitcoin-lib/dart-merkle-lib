import 'dart:typed_data';

import 'package:convert/convert.dart';

class Fixture {
  String? description;
  String hash;
  List<Uint8List> values;
  List<Uint8List> tree;

  Map<String, List<Uint8List?>> proofs;

  Fixture(
      {this.description,
      required this.hash,
      required this.values,
      required this.tree,
      required this.proofs});
}

Uint8List? b(String? str) {
  if (str == null) {
    return null;
  }
  return Uint8List.fromList(hex.decode(str));
}

List<Fixture> fixtures = [
  Fixture(
      hash: "sha1",
      values: ["00000000000000000000"].map((e) => b(e)!).toList(),
      tree: ["00000000000000000000"].map((e) => b(e)!).toList(),
      proofs: {
        "00000000000000000000":
            ["00000000000000000000"].map((e) => b(e)).toList()
      }),
  Fixture(
      hash: "sha1",
      values: ["00000000000000000000", "11111111111111111111"]
          .map((e) => b(e)!)
          .toList(),
      tree: [
        "00000000000000000000",
        "11111111111111111111",
        "16cac45ad1b51b6ee19919042c55c487ffee7950"
      ].map((e) => b(e)!).toList(),
      proofs: {
        "00000000000000000000": [
          "00000000000000000000",
          "11111111111111111111",
          "16cac45ad1b51b6ee19919042c55c487ffee7950"
        ].map((e) => b(e)).toList(),
        "11111111111111111111": [
          "00000000000000000000",
          "11111111111111111111",
          "16cac45ad1b51b6ee19919042c55c487ffee7950"
        ].map((e) => b(e)).toList()
      }),
  Fixture(
      hash: "sha1",
      values: [
        "00000000000000000000",
        "11111111111111111111",
        "22222222222222222222"
      ].map((e) => b(e)!).toList(),
      tree: [
        "00000000000000000000",
        "11111111111111111111",
        "22222222222222222222",
        "16cac45ad1b51b6ee19919042c55c487ffee7950",
        "f8d1291ae0429b9955baacbd869fa0cef4817a3f",
        "1c844bf279c4e0e56bb68ebf6e177b19fdd7a99e"
      ].map((e) => b(e)!).toList(),
      proofs: {
        "00000000000000000000": [
          "00000000000000000000",
          "11111111111111111111",
          null,
          "f8d1291ae0429b9955baacbd869fa0cef4817a3f",
          "1c844bf279c4e0e56bb68ebf6e177b19fdd7a99e"
        ].map((e) => b(e)).toList(),
        "11111111111111111111": [
          "00000000000000000000",
          "11111111111111111111",
          null,
          "f8d1291ae0429b9955baacbd869fa0cef4817a3f",
          "1c844bf279c4e0e56bb68ebf6e177b19fdd7a99e"
        ].map((e) => b(e)).toList(),
        "22222222222222222222": [
          "22222222222222222222",
          "22222222222222222222",
          "16cac45ad1b51b6ee19919042c55c487ffee7950",
          null,
          "1c844bf279c4e0e56bb68ebf6e177b19fdd7a99e"
        ].map((e) => b(e)).toList()
      }),
  Fixture(
      description:
          "https://en.bitcoin.it/wiki/Common_Vulnerabilities_and_Exposures#CVE-2012-2459",
      hash: "sha1",
      values: [
        "00000000000000000000",
        "11111111111111111111",
        "22222222222222222222",
        "33333333333333333333"
      ].map((e) => b(e)!).toList(),
      tree: [
        "00000000000000000000",
        "11111111111111111111",
        "22222222222222222222",
        "33333333333333333333",
        "16cac45ad1b51b6ee19919042c55c487ffee7950",
        "0464b06c3142ba87681e69cbbf8a53811bd6de60",
        "344cb065f27ca59078ac23588ce59f3b8319b0bc"
      ].map((e) => b(e)!).toList(),
      proofs: {
        "00000000000000000000": [
          "00000000000000000000",
          "11111111111111111111",
          null,
          "0464b06c3142ba87681e69cbbf8a53811bd6de60",
          "344cb065f27ca59078ac23588ce59f3b8319b0bc"
        ].map((e) => b(e)).toList(),
        "11111111111111111111": [
          "00000000000000000000",
          "11111111111111111111",
          null,
          "0464b06c3142ba87681e69cbbf8a53811bd6de60",
          "344cb065f27ca59078ac23588ce59f3b8319b0bc"
        ].map((e) => b(e)).toList(),
        "22222222222222222222": [
          "22222222222222222222",
          "33333333333333333333",
          "16cac45ad1b51b6ee19919042c55c487ffee7950",
          null,
          "344cb065f27ca59078ac23588ce59f3b8319b0bc"
        ].map((e) => b(e)).toList(),
        "33333333333333333333": [
          "22222222222222222222",
          "33333333333333333333",
          "16cac45ad1b51b6ee19919042c55c487ffee7950",
          null,
          "344cb065f27ca59078ac23588ce59f3b8319b0bc"
        ].map((e) => b(e)).toList()
      }),
  Fixture(
      hash: "sha1",
      values: [
        "00000000000000000000",
        "11111111111111111111",
        "22222222222222222222",
        "33333333333333333333",
        "44444444444444444444"
      ].map((e) => b(e)!).toList(),
      tree: [
        "00000000000000000000",
        "11111111111111111111",
        "22222222222222222222",
        "33333333333333333333",
        "44444444444444444444",
        "16cac45ad1b51b6ee19919042c55c487ffee7950",
        "0464b06c3142ba87681e69cbbf8a53811bd6de60",
        "d58044c4a9fe607a487371cddefe02b7c7274dd3",
        "344cb065f27ca59078ac23588ce59f3b8319b0bc",
        "027d6606ed12efaae8921ae0516e882d7f2ada48",
        "ade3102099a56fa5eb01f994f4664d5bccdfcb7b"
      ].map((e) => b(e)!).toList(),
      proofs: {
        "00000000000000000000": [
          "00000000000000000000",
          "11111111111111111111",
          null,
          "0464b06c3142ba87681e69cbbf8a53811bd6de60",
          null,
          "027d6606ed12efaae8921ae0516e882d7f2ada48",
          "ade3102099a56fa5eb01f994f4664d5bccdfcb7b"
        ].map((e) => b(e)).toList(),
        "11111111111111111111": [
          "00000000000000000000",
          "11111111111111111111",
          null,
          "0464b06c3142ba87681e69cbbf8a53811bd6de60",
          null,
          "027d6606ed12efaae8921ae0516e882d7f2ada48",
          "ade3102099a56fa5eb01f994f4664d5bccdfcb7b"
        ].map((e) => b(e)).toList(),
        "22222222222222222222": [
          "22222222222222222222",
          "33333333333333333333",
          "16cac45ad1b51b6ee19919042c55c487ffee7950",
          null,
          null,
          "027d6606ed12efaae8921ae0516e882d7f2ada48",
          "ade3102099a56fa5eb01f994f4664d5bccdfcb7b"
        ].map((e) => b(e)).toList(),
        "33333333333333333333": [
          "22222222222222222222",
          "33333333333333333333",
          "16cac45ad1b51b6ee19919042c55c487ffee7950",
          null,
          null,
          "027d6606ed12efaae8921ae0516e882d7f2ada48",
          "ade3102099a56fa5eb01f994f4664d5bccdfcb7b"
        ].map((e) => b(e)).toList(),
        "44444444444444444444": [
          "44444444444444444444",
          "44444444444444444444",
          null,
          "d58044c4a9fe607a487371cddefe02b7c7274dd3",
          "344cb065f27ca59078ac23588ce59f3b8319b0bc",
          null,
          "ade3102099a56fa5eb01f994f4664d5bccdfcb7b"
        ].map((e) => b(e)).toList()
      }),
  Fixture(
      hash: "sha1",
      values: [
        "00000000000000000000",
        "11111111111111111111",
        "22222222222222222222",
        "33333333333333333333",
        "44444444444444444444",
        "55555555555555555555"
      ].map((e) => b(e)!).toList(),
      tree: [
        "00000000000000000000",
        "11111111111111111111",
        "22222222222222222222",
        "33333333333333333333",
        "44444444444444444444",
        "55555555555555555555",
        "16cac45ad1b51b6ee19919042c55c487ffee7950",
        "0464b06c3142ba87681e69cbbf8a53811bd6de60",
        "b84c0e962dafb602d2af3bc8bfa987527492ffaa",
        "344cb065f27ca59078ac23588ce59f3b8319b0bc",
        "2f1fdadec94361860096781f082768c560412d8b",
        "690cca6b95c9547099227b65977ef9d77bfbf829"
      ].map((e) => b(e)!).toList(),
      proofs: {
        "00000000000000000000": [
          "00000000000000000000",
          "11111111111111111111",
          null,
          "0464b06c3142ba87681e69cbbf8a53811bd6de60",
          null,
          "2f1fdadec94361860096781f082768c560412d8b",
          "690cca6b95c9547099227b65977ef9d77bfbf829"
        ].map((e) => b(e)).toList(),
        "11111111111111111111": [
          "00000000000000000000",
          "11111111111111111111",
          null,
          "0464b06c3142ba87681e69cbbf8a53811bd6de60",
          null,
          "2f1fdadec94361860096781f082768c560412d8b",
          "690cca6b95c9547099227b65977ef9d77bfbf829"
        ].map((e) => b(e)).toList(),
        "22222222222222222222": [
          "22222222222222222222",
          "33333333333333333333",
          "16cac45ad1b51b6ee19919042c55c487ffee7950",
          null,
          null,
          "2f1fdadec94361860096781f082768c560412d8b",
          "690cca6b95c9547099227b65977ef9d77bfbf829"
        ].map((e) => b(e)).toList(),
        "33333333333333333333": [
          "22222222222222222222",
          "33333333333333333333",
          "16cac45ad1b51b6ee19919042c55c487ffee7950",
          null,
          null,
          "2f1fdadec94361860096781f082768c560412d8b",
          "690cca6b95c9547099227b65977ef9d77bfbf829"
        ].map((e) => b(e)).toList(),
        "44444444444444444444": [
          "44444444444444444444",
          "55555555555555555555",
          null,
          "b84c0e962dafb602d2af3bc8bfa987527492ffaa",
          "344cb065f27ca59078ac23588ce59f3b8319b0bc",
          null,
          "690cca6b95c9547099227b65977ef9d77bfbf829"
        ].map((e) => b(e)).toList(),
        "55555555555555555555": [
          "44444444444444444444",
          "55555555555555555555",
          null,
          "b84c0e962dafb602d2af3bc8bfa987527492ffaa",
          "344cb065f27ca59078ac23588ce59f3b8319b0bc",
          null,
          "690cca6b95c9547099227b65977ef9d77bfbf829"
        ].map((e) => b(e)).toList()
      }),
  Fixture(
      hash: "sha1",
      values: [
        "00000000000000000000",
        "11111111111111111111",
        "22222222222222222222",
        "33333333333333333333",
        "44444444444444444444",
        "55555555555555555555",
        "66666666666666666666",
        "77777777777777777777",
        "88888888888888888888",
        "99999999999999999999"
      ].map((e) => b(e)!).toList(),
      tree: [
        "00000000000000000000",
        "11111111111111111111",
        "22222222222222222222",
        "33333333333333333333",
        "44444444444444444444",
        "55555555555555555555",
        "66666666666666666666",
        "77777777777777777777",
        "88888888888888888888",
        "99999999999999999999",
        "16cac45ad1b51b6ee19919042c55c487ffee7950",
        "0464b06c3142ba87681e69cbbf8a53811bd6de60",
        "b84c0e962dafb602d2af3bc8bfa987527492ffaa",
        "4910621cbc06fbf490d45e9f07baecd74b2dda5e",
        "4e5166f96629e30736234e45bc348f1b4da7b363",
        "344cb065f27ca59078ac23588ce59f3b8319b0bc",
        "092408a2b5d5c702043d668c3cb21509d2638093",
        "3b28b39c9ba8c3d0d15fe939b4cac62809a5a578",
        "811d211b34a0a41f37f0307f23a628595d93acf5",
        "6a10489666eec0b5f149c07407fd848cf9c22905",
        "5afa2d7b1930c4e4e2adc2a04ff309179e561dc7"
      ].map((e) => b(e)!).toList(),
      proofs: {
        "00000000000000000000": [
          "00000000000000000000",
          "11111111111111111111",
          null,
          "0464b06c3142ba87681e69cbbf8a53811bd6de60",
          null,
          "092408a2b5d5c702043d668c3cb21509d2638093",
          null,
          "6a10489666eec0b5f149c07407fd848cf9c22905",
          "5afa2d7b1930c4e4e2adc2a04ff309179e561dc7"
        ].map((e) => b(e)).toList(),
        "11111111111111111111": [
          "00000000000000000000",
          "11111111111111111111",
          null,
          "0464b06c3142ba87681e69cbbf8a53811bd6de60",
          null,
          "092408a2b5d5c702043d668c3cb21509d2638093",
          null,
          "6a10489666eec0b5f149c07407fd848cf9c22905",
          "5afa2d7b1930c4e4e2adc2a04ff309179e561dc7"
        ].map((e) => b(e)).toList(),
        "22222222222222222222": [
          "22222222222222222222",
          "33333333333333333333",
          "16cac45ad1b51b6ee19919042c55c487ffee7950",
          null,
          null,
          "092408a2b5d5c702043d668c3cb21509d2638093",
          null,
          "6a10489666eec0b5f149c07407fd848cf9c22905",
          "5afa2d7b1930c4e4e2adc2a04ff309179e561dc7"
        ].map((e) => b(e)).toList(),
        "33333333333333333333": [
          "22222222222222222222",
          "33333333333333333333",
          "16cac45ad1b51b6ee19919042c55c487ffee7950",
          null,
          null,
          "092408a2b5d5c702043d668c3cb21509d2638093",
          null,
          "6a10489666eec0b5f149c07407fd848cf9c22905",
          "5afa2d7b1930c4e4e2adc2a04ff309179e561dc7"
        ].map((e) => b(e)).toList(),
        "44444444444444444444": [
          "44444444444444444444",
          "55555555555555555555",
          null,
          "4910621cbc06fbf490d45e9f07baecd74b2dda5e",
          "344cb065f27ca59078ac23588ce59f3b8319b0bc",
          null,
          null,
          "6a10489666eec0b5f149c07407fd848cf9c22905",
          "5afa2d7b1930c4e4e2adc2a04ff309179e561dc7"
        ].map((e) => b(e)).toList(),
        "55555555555555555555": [
          "44444444444444444444",
          "55555555555555555555",
          null,
          "4910621cbc06fbf490d45e9f07baecd74b2dda5e",
          "344cb065f27ca59078ac23588ce59f3b8319b0bc",
          null,
          null,
          "6a10489666eec0b5f149c07407fd848cf9c22905",
          "5afa2d7b1930c4e4e2adc2a04ff309179e561dc7"
        ].map((e) => b(e)).toList(),
        "66666666666666666666": [
          "66666666666666666666",
          "77777777777777777777",
          "b84c0e962dafb602d2af3bc8bfa987527492ffaa",
          null,
          "344cb065f27ca59078ac23588ce59f3b8319b0bc",
          null,
          null,
          "6a10489666eec0b5f149c07407fd848cf9c22905",
          "5afa2d7b1930c4e4e2adc2a04ff309179e561dc7"
        ].map((e) => b(e)).toList(),
        "77777777777777777777": [
          "66666666666666666666",
          "77777777777777777777",
          "b84c0e962dafb602d2af3bc8bfa987527492ffaa",
          null,
          "344cb065f27ca59078ac23588ce59f3b8319b0bc",
          null,
          null,
          "6a10489666eec0b5f149c07407fd848cf9c22905",
          "5afa2d7b1930c4e4e2adc2a04ff309179e561dc7"
        ].map((e) => b(e)).toList(),
        "88888888888888888888": [
          "88888888888888888888",
          "99999999999999999999",
          null,
          "4e5166f96629e30736234e45bc348f1b4da7b363",
          null,
          "3b28b39c9ba8c3d0d15fe939b4cac62809a5a578",
          "811d211b34a0a41f37f0307f23a628595d93acf5",
          null,
          "5afa2d7b1930c4e4e2adc2a04ff309179e561dc7"
        ].map((e) => b(e)).toList(),
        "99999999999999999999": [
          "88888888888888888888",
          "99999999999999999999",
          null,
          "4e5166f96629e30736234e45bc348f1b4da7b363",
          null,
          "3b28b39c9ba8c3d0d15fe939b4cac62809a5a578",
          "811d211b34a0a41f37f0307f23a628595d93acf5",
          null,
          "5afa2d7b1930c4e4e2adc2a04ff309179e561dc7"
        ].map((e) => b(e)).toList()
      }),
  Fixture(
      hash: "sha1",
      values: [
        "00000000000000000000",
        "11111111111111111111",
        "22222222222222222222",
        "33333333333333333333",
        "44444444444444444444",
        "55555555555555555555",
        "66666666666666666666",
        "77777777777777777777",
        "88888888888888888888",
        "99999999999999999999",
        "aaaaaaaaaaaaaaaaaaaa"
      ].map((e) => b(e)!).toList(),
      tree: [
        "00000000000000000000",
        "11111111111111111111",
        "22222222222222222222",
        "33333333333333333333",
        "44444444444444444444",
        "55555555555555555555",
        "66666666666666666666",
        "77777777777777777777",
        "88888888888888888888",
        "99999999999999999999",
        "aaaaaaaaaaaaaaaaaaaa",
        "16cac45ad1b51b6ee19919042c55c487ffee7950",
        "0464b06c3142ba87681e69cbbf8a53811bd6de60",
        "b84c0e962dafb602d2af3bc8bfa987527492ffaa",
        "4910621cbc06fbf490d45e9f07baecd74b2dda5e",
        "4e5166f96629e30736234e45bc348f1b4da7b363",
        "e5fefec5e0b8312c80c24e958cc9db10940175be",
        "344cb065f27ca59078ac23588ce59f3b8319b0bc",
        "092408a2b5d5c702043d668c3cb21509d2638093",
        "716e46b6c9eebb8f267e3bccaf56853ca75cefe5",
        "811d211b34a0a41f37f0307f23a628595d93acf5",
        "98d89a44825d3aaa241f3ce943ecc7094c2c0e6d",
        "5bfe703ec54a975877b0a8e50b44bff1a3ea9919"
      ].map((e) => b(e)!).toList(),
      proofs: {
        "00000000000000000000": [
          "00000000000000000000",
          "11111111111111111111",
          null,
          "0464b06c3142ba87681e69cbbf8a53811bd6de60",
          null,
          "092408a2b5d5c702043d668c3cb21509d2638093",
          null,
          "98d89a44825d3aaa241f3ce943ecc7094c2c0e6d",
          "5bfe703ec54a975877b0a8e50b44bff1a3ea9919"
        ].map((e) => b(e)).toList(),
        "11111111111111111111": [
          "00000000000000000000",
          "11111111111111111111",
          null,
          "0464b06c3142ba87681e69cbbf8a53811bd6de60",
          null,
          "092408a2b5d5c702043d668c3cb21509d2638093",
          null,
          "98d89a44825d3aaa241f3ce943ecc7094c2c0e6d",
          "5bfe703ec54a975877b0a8e50b44bff1a3ea9919"
        ].map((e) => b(e)).toList(),
        "22222222222222222222": [
          "22222222222222222222",
          "33333333333333333333",
          "16cac45ad1b51b6ee19919042c55c487ffee7950",
          null,
          null,
          "092408a2b5d5c702043d668c3cb21509d2638093",
          null,
          "98d89a44825d3aaa241f3ce943ecc7094c2c0e6d",
          "5bfe703ec54a975877b0a8e50b44bff1a3ea9919"
        ].map((e) => b(e)).toList(),
        "33333333333333333333": [
          "22222222222222222222",
          "33333333333333333333",
          "16cac45ad1b51b6ee19919042c55c487ffee7950",
          null,
          null,
          "092408a2b5d5c702043d668c3cb21509d2638093",
          null,
          "98d89a44825d3aaa241f3ce943ecc7094c2c0e6d",
          "5bfe703ec54a975877b0a8e50b44bff1a3ea9919"
        ].map((e) => b(e)).toList(),
        "44444444444444444444": [
          "44444444444444444444",
          "55555555555555555555",
          null,
          "4910621cbc06fbf490d45e9f07baecd74b2dda5e",
          "344cb065f27ca59078ac23588ce59f3b8319b0bc",
          null,
          null,
          "98d89a44825d3aaa241f3ce943ecc7094c2c0e6d",
          "5bfe703ec54a975877b0a8e50b44bff1a3ea9919"
        ].map((e) => b(e)).toList(),
        "55555555555555555555": [
          "44444444444444444444",
          "55555555555555555555",
          null,
          "4910621cbc06fbf490d45e9f07baecd74b2dda5e",
          "344cb065f27ca59078ac23588ce59f3b8319b0bc",
          null,
          null,
          "98d89a44825d3aaa241f3ce943ecc7094c2c0e6d",
          "5bfe703ec54a975877b0a8e50b44bff1a3ea9919"
        ].map((e) => b(e)).toList(),
        "66666666666666666666": [
          "66666666666666666666",
          "77777777777777777777",
          "b84c0e962dafb602d2af3bc8bfa987527492ffaa",
          null,
          "344cb065f27ca59078ac23588ce59f3b8319b0bc",
          null,
          null,
          "98d89a44825d3aaa241f3ce943ecc7094c2c0e6d",
          "5bfe703ec54a975877b0a8e50b44bff1a3ea9919"
        ].map((e) => b(e)).toList(),
        "77777777777777777777": [
          "66666666666666666666",
          "77777777777777777777",
          "b84c0e962dafb602d2af3bc8bfa987527492ffaa",
          null,
          "344cb065f27ca59078ac23588ce59f3b8319b0bc",
          null,
          null,
          "98d89a44825d3aaa241f3ce943ecc7094c2c0e6d",
          "5bfe703ec54a975877b0a8e50b44bff1a3ea9919"
        ].map((e) => b(e)).toList(),
        "88888888888888888888": [
          "88888888888888888888",
          "99999999999999999999",
          null,
          "e5fefec5e0b8312c80c24e958cc9db10940175be",
          null,
          "716e46b6c9eebb8f267e3bccaf56853ca75cefe5",
          "811d211b34a0a41f37f0307f23a628595d93acf5",
          null,
          "5bfe703ec54a975877b0a8e50b44bff1a3ea9919"
        ].map((e) => b(e)).toList(),
        "99999999999999999999": [
          "88888888888888888888",
          "99999999999999999999",
          null,
          "e5fefec5e0b8312c80c24e958cc9db10940175be",
          null,
          "716e46b6c9eebb8f267e3bccaf56853ca75cefe5",
          "811d211b34a0a41f37f0307f23a628595d93acf5",
          null,
          "5bfe703ec54a975877b0a8e50b44bff1a3ea9919"
        ].map((e) => b(e)).toList(),
        "aaaaaaaaaaaaaaaaaaaa": [
          "aaaaaaaaaaaaaaaaaaaa",
          "aaaaaaaaaaaaaaaaaaaa",
          "4e5166f96629e30736234e45bc348f1b4da7b363",
          null,
          null,
          "716e46b6c9eebb8f267e3bccaf56853ca75cefe5",
          "811d211b34a0a41f37f0307f23a628595d93acf5",
          null,
          "5bfe703ec54a975877b0a8e50b44bff1a3ea9919"
        ].map((e) => b(e)).toList()
      }),
  Fixture(
      hash: "sha1",
      values: [
        "00000000000000000000",
        "11111111111111111111",
        "22222222222222222222",
        "33333333333333333333",
        "44444444444444444444",
        "55555555555555555555",
        "66666666666666666666",
        "77777777777777777777",
        "88888888888888888888",
        "99999999999999999999",
        "aaaaaaaaaaaaaaaaaaaa",
        "bbbbbbbbbbbbbbbbbbbb",
        "cccccccccccccccccccc",
        "dddddddddddddddddddd",
        "eeeeeeeeeeeeeeeeeeee"
      ].map((e) => b(e)!).toList(),
      tree: [
        "00000000000000000000",
        "11111111111111111111",
        "22222222222222222222",
        "33333333333333333333",
        "44444444444444444444",
        "55555555555555555555",
        "66666666666666666666",
        "77777777777777777777",
        "88888888888888888888",
        "99999999999999999999",
        "aaaaaaaaaaaaaaaaaaaa",
        "bbbbbbbbbbbbbbbbbbbb",
        "cccccccccccccccccccc",
        "dddddddddddddddddddd",
        "eeeeeeeeeeeeeeeeeeee",
        "16cac45ad1b51b6ee19919042c55c487ffee7950",
        "0464b06c3142ba87681e69cbbf8a53811bd6de60",
        "b84c0e962dafb602d2af3bc8bfa987527492ffaa",
        "4910621cbc06fbf490d45e9f07baecd74b2dda5e",
        "4e5166f96629e30736234e45bc348f1b4da7b363",
        "703d43d0a04e7a1029d5af81c1fb15ab10245a66",
        "1c793e530d678e7b7471f1446d02f0145c73213c",
        "70c2d7dd2b1656816783d80523ff5f1e15913c7a",
        "344cb065f27ca59078ac23588ce59f3b8319b0bc",
        "092408a2b5d5c702043d668c3cb21509d2638093",
        "2dbf0b142f81b40f9aecb98f5df9fe686c680a67",
        "9ccd6b805e9df90f504617bbac1df9a7f124c479",
        "811d211b34a0a41f37f0307f23a628595d93acf5",
        "001232e0bcc661c98bdbeadfec4b758ffa61a229",
        "3aff25eb92d88d83a4dd4caa4169107b0b55458a"
      ].map((e) => b(e)!).toList(),
      proofs: {
        "00000000000000000000": [
          "00000000000000000000",
          "11111111111111111111",
          null,
          "0464b06c3142ba87681e69cbbf8a53811bd6de60",
          null,
          "092408a2b5d5c702043d668c3cb21509d2638093",
          null,
          "001232e0bcc661c98bdbeadfec4b758ffa61a229",
          "3aff25eb92d88d83a4dd4caa4169107b0b55458a"
        ].map((e) => b(e)).toList(),
        "11111111111111111111": [
          "00000000000000000000",
          "11111111111111111111",
          null,
          "0464b06c3142ba87681e69cbbf8a53811bd6de60",
          null,
          "092408a2b5d5c702043d668c3cb21509d2638093",
          null,
          "001232e0bcc661c98bdbeadfec4b758ffa61a229",
          "3aff25eb92d88d83a4dd4caa4169107b0b55458a"
        ].map((e) => b(e)).toList(),
        "22222222222222222222": [
          "22222222222222222222",
          "33333333333333333333",
          "16cac45ad1b51b6ee19919042c55c487ffee7950",
          null,
          null,
          "092408a2b5d5c702043d668c3cb21509d2638093",
          null,
          "001232e0bcc661c98bdbeadfec4b758ffa61a229",
          "3aff25eb92d88d83a4dd4caa4169107b0b55458a"
        ].map((e) => b(e)).toList(),
        "33333333333333333333": [
          "22222222222222222222",
          "33333333333333333333",
          "16cac45ad1b51b6ee19919042c55c487ffee7950",
          null,
          null,
          "092408a2b5d5c702043d668c3cb21509d2638093",
          null,
          "001232e0bcc661c98bdbeadfec4b758ffa61a229",
          "3aff25eb92d88d83a4dd4caa4169107b0b55458a"
        ].map((e) => b(e)).toList(),
        "44444444444444444444": [
          "44444444444444444444",
          "55555555555555555555",
          null,
          "4910621cbc06fbf490d45e9f07baecd74b2dda5e",
          "344cb065f27ca59078ac23588ce59f3b8319b0bc",
          null,
          null,
          "001232e0bcc661c98bdbeadfec4b758ffa61a229",
          "3aff25eb92d88d83a4dd4caa4169107b0b55458a"
        ].map((e) => b(e)).toList(),
        "55555555555555555555": [
          "44444444444444444444",
          "55555555555555555555",
          null,
          "4910621cbc06fbf490d45e9f07baecd74b2dda5e",
          "344cb065f27ca59078ac23588ce59f3b8319b0bc",
          null,
          null,
          "001232e0bcc661c98bdbeadfec4b758ffa61a229",
          "3aff25eb92d88d83a4dd4caa4169107b0b55458a"
        ].map((e) => b(e)).toList(),
        "66666666666666666666": [
          "66666666666666666666",
          "77777777777777777777",
          "b84c0e962dafb602d2af3bc8bfa987527492ffaa",
          null,
          "344cb065f27ca59078ac23588ce59f3b8319b0bc",
          null,
          null,
          "001232e0bcc661c98bdbeadfec4b758ffa61a229",
          "3aff25eb92d88d83a4dd4caa4169107b0b55458a"
        ].map((e) => b(e)).toList(),
        "77777777777777777777": [
          "66666666666666666666",
          "77777777777777777777",
          "b84c0e962dafb602d2af3bc8bfa987527492ffaa",
          null,
          "344cb065f27ca59078ac23588ce59f3b8319b0bc",
          null,
          null,
          "001232e0bcc661c98bdbeadfec4b758ffa61a229",
          "3aff25eb92d88d83a4dd4caa4169107b0b55458a"
        ].map((e) => b(e)).toList(),
        "88888888888888888888": [
          "88888888888888888888",
          "99999999999999999999",
          null,
          "703d43d0a04e7a1029d5af81c1fb15ab10245a66",
          null,
          "9ccd6b805e9df90f504617bbac1df9a7f124c479",
          "811d211b34a0a41f37f0307f23a628595d93acf5",
          null,
          "3aff25eb92d88d83a4dd4caa4169107b0b55458a"
        ].map((e) => b(e)).toList(),
        "99999999999999999999": [
          "88888888888888888888",
          "99999999999999999999",
          null,
          "703d43d0a04e7a1029d5af81c1fb15ab10245a66",
          null,
          "9ccd6b805e9df90f504617bbac1df9a7f124c479",
          "811d211b34a0a41f37f0307f23a628595d93acf5",
          null,
          "3aff25eb92d88d83a4dd4caa4169107b0b55458a"
        ].map((e) => b(e)).toList(),
        "aaaaaaaaaaaaaaaaaaaa": [
          "aaaaaaaaaaaaaaaaaaaa",
          "bbbbbbbbbbbbbbbbbbbb",
          "4e5166f96629e30736234e45bc348f1b4da7b363",
          null,
          null,
          "9ccd6b805e9df90f504617bbac1df9a7f124c479",
          "811d211b34a0a41f37f0307f23a628595d93acf5",
          null,
          "3aff25eb92d88d83a4dd4caa4169107b0b55458a"
        ].map((e) => b(e)).toList(),
        "bbbbbbbbbbbbbbbbbbbb": [
          "aaaaaaaaaaaaaaaaaaaa",
          "bbbbbbbbbbbbbbbbbbbb",
          "4e5166f96629e30736234e45bc348f1b4da7b363",
          null,
          null,
          "9ccd6b805e9df90f504617bbac1df9a7f124c479",
          "811d211b34a0a41f37f0307f23a628595d93acf5",
          null,
          "3aff25eb92d88d83a4dd4caa4169107b0b55458a"
        ].map((e) => b(e)).toList(),
        "cccccccccccccccccccc": [
          "cccccccccccccccccccc",
          "dddddddddddddddddddd",
          null,
          "70c2d7dd2b1656816783d80523ff5f1e15913c7a",
          "2dbf0b142f81b40f9aecb98f5df9fe686c680a67",
          null,
          "811d211b34a0a41f37f0307f23a628595d93acf5",
          null,
          "3aff25eb92d88d83a4dd4caa4169107b0b55458a"
        ].map((e) => b(e)).toList(),
        "dddddddddddddddddddd": [
          "cccccccccccccccccccc",
          "dddddddddddddddddddd",
          null,
          "70c2d7dd2b1656816783d80523ff5f1e15913c7a",
          "2dbf0b142f81b40f9aecb98f5df9fe686c680a67",
          null,
          "811d211b34a0a41f37f0307f23a628595d93acf5",
          null,
          "3aff25eb92d88d83a4dd4caa4169107b0b55458a"
        ].map((e) => b(e)).toList(),
        "eeeeeeeeeeeeeeeeeeee": [
          "eeeeeeeeeeeeeeeeeeee",
          "eeeeeeeeeeeeeeeeeeee",
          "1c793e530d678e7b7471f1446d02f0145c73213c",
          null,
          "2dbf0b142f81b40f9aecb98f5df9fe686c680a67",
          null,
          "811d211b34a0a41f37f0307f23a628595d93acf5",
          null,
          "3aff25eb92d88d83a4dd4caa4169107b0b55458a"
        ].map((e) => b(e)).toList()
      }),
  Fixture(
      hash: "sha1",
      values: [
        "00000000000000000000",
        "11111111111111111111",
        "22222222222222222222",
        "33333333333333333333",
        "44444444444444444444",
        "55555555555555555555",
        "66666666666666666666",
        "77777777777777777777",
        "88888888888888888888",
        "99999999999999999999",
        "aaaaaaaaaaaaaaaaaaaa",
        "bbbbbbbbbbbbbbbbbbbb",
        "cccccccccccccccccccc",
        "dddddddddddddddddddd",
        "eeeeeeeeeeeeeeeeeeee",
        "ffffffffffffffffffff"
      ].map((e) => b(e)!).toList(),
      tree: [
        "00000000000000000000",
        "11111111111111111111",
        "22222222222222222222",
        "33333333333333333333",
        "44444444444444444444",
        "55555555555555555555",
        "66666666666666666666",
        "77777777777777777777",
        "88888888888888888888",
        "99999999999999999999",
        "aaaaaaaaaaaaaaaaaaaa",
        "bbbbbbbbbbbbbbbbbbbb",
        "cccccccccccccccccccc",
        "dddddddddddddddddddd",
        "eeeeeeeeeeeeeeeeeeee",
        "ffffffffffffffffffff",
        "16cac45ad1b51b6ee19919042c55c487ffee7950",
        "0464b06c3142ba87681e69cbbf8a53811bd6de60",
        "b84c0e962dafb602d2af3bc8bfa987527492ffaa",
        "4910621cbc06fbf490d45e9f07baecd74b2dda5e",
        "4e5166f96629e30736234e45bc348f1b4da7b363",
        "703d43d0a04e7a1029d5af81c1fb15ab10245a66",
        "1c793e530d678e7b7471f1446d02f0145c73213c",
        "98b45c956b61a79507eee405e595e35be0473004",
        "344cb065f27ca59078ac23588ce59f3b8319b0bc",
        "092408a2b5d5c702043d668c3cb21509d2638093",
        "2dbf0b142f81b40f9aecb98f5df9fe686c680a67",
        "992ed87dea2722d78f36cc74594418be0128917c",
        "811d211b34a0a41f37f0307f23a628595d93acf5",
        "44898cf19d2612ef0bf5383d5546c428e0cb2a74",
        "34e10d9bdc1bfb4623b7880b48b07ba59f2b4929"
      ].map((e) => b(e)!).toList(),
      proofs: {
        "00000000000000000000": [
          "00000000000000000000",
          "11111111111111111111",
          null,
          "0464b06c3142ba87681e69cbbf8a53811bd6de60",
          null,
          "092408a2b5d5c702043d668c3cb21509d2638093",
          null,
          "44898cf19d2612ef0bf5383d5546c428e0cb2a74",
          "34e10d9bdc1bfb4623b7880b48b07ba59f2b4929"
        ].map((e) => b(e)).toList(),
        "11111111111111111111": [
          "00000000000000000000",
          "11111111111111111111",
          null,
          "0464b06c3142ba87681e69cbbf8a53811bd6de60",
          null,
          "092408a2b5d5c702043d668c3cb21509d2638093",
          null,
          "44898cf19d2612ef0bf5383d5546c428e0cb2a74",
          "34e10d9bdc1bfb4623b7880b48b07ba59f2b4929"
        ].map((e) => b(e)).toList(),
        "22222222222222222222": [
          "22222222222222222222",
          "33333333333333333333",
          "16cac45ad1b51b6ee19919042c55c487ffee7950",
          null,
          null,
          "092408a2b5d5c702043d668c3cb21509d2638093",
          null,
          "44898cf19d2612ef0bf5383d5546c428e0cb2a74",
          "34e10d9bdc1bfb4623b7880b48b07ba59f2b4929"
        ].map((e) => b(e)).toList(),
        "33333333333333333333": [
          "22222222222222222222",
          "33333333333333333333",
          "16cac45ad1b51b6ee19919042c55c487ffee7950",
          null,
          null,
          "092408a2b5d5c702043d668c3cb21509d2638093",
          null,
          "44898cf19d2612ef0bf5383d5546c428e0cb2a74",
          "34e10d9bdc1bfb4623b7880b48b07ba59f2b4929"
        ].map((e) => b(e)).toList(),
        "44444444444444444444": [
          "44444444444444444444",
          "55555555555555555555",
          null,
          "4910621cbc06fbf490d45e9f07baecd74b2dda5e",
          "344cb065f27ca59078ac23588ce59f3b8319b0bc",
          null,
          null,
          "44898cf19d2612ef0bf5383d5546c428e0cb2a74",
          "34e10d9bdc1bfb4623b7880b48b07ba59f2b4929"
        ].map((e) => b(e)).toList(),
        "55555555555555555555": [
          "44444444444444444444",
          "55555555555555555555",
          null,
          "4910621cbc06fbf490d45e9f07baecd74b2dda5e",
          "344cb065f27ca59078ac23588ce59f3b8319b0bc",
          null,
          null,
          "44898cf19d2612ef0bf5383d5546c428e0cb2a74",
          "34e10d9bdc1bfb4623b7880b48b07ba59f2b4929"
        ].map((e) => b(e)).toList(),
        "66666666666666666666": [
          "66666666666666666666",
          "77777777777777777777",
          "b84c0e962dafb602d2af3bc8bfa987527492ffaa",
          null,
          "344cb065f27ca59078ac23588ce59f3b8319b0bc",
          null,
          null,
          "44898cf19d2612ef0bf5383d5546c428e0cb2a74",
          "34e10d9bdc1bfb4623b7880b48b07ba59f2b4929"
        ].map((e) => b(e)).toList(),
        "77777777777777777777": [
          "66666666666666666666",
          "77777777777777777777",
          "b84c0e962dafb602d2af3bc8bfa987527492ffaa",
          null,
          "344cb065f27ca59078ac23588ce59f3b8319b0bc",
          null,
          null,
          "44898cf19d2612ef0bf5383d5546c428e0cb2a74",
          "34e10d9bdc1bfb4623b7880b48b07ba59f2b4929"
        ].map((e) => b(e)).toList(),
        "88888888888888888888": [
          "88888888888888888888",
          "99999999999999999999",
          null,
          "703d43d0a04e7a1029d5af81c1fb15ab10245a66",
          null,
          "992ed87dea2722d78f36cc74594418be0128917c",
          "811d211b34a0a41f37f0307f23a628595d93acf5",
          null,
          "34e10d9bdc1bfb4623b7880b48b07ba59f2b4929"
        ].map((e) => b(e)).toList(),
        "99999999999999999999": [
          "88888888888888888888",
          "99999999999999999999",
          null,
          "703d43d0a04e7a1029d5af81c1fb15ab10245a66",
          null,
          "992ed87dea2722d78f36cc74594418be0128917c",
          "811d211b34a0a41f37f0307f23a628595d93acf5",
          null,
          "34e10d9bdc1bfb4623b7880b48b07ba59f2b4929"
        ].map((e) => b(e)).toList(),
        "aaaaaaaaaaaaaaaaaaaa": [
          "aaaaaaaaaaaaaaaaaaaa",
          "bbbbbbbbbbbbbbbbbbbb",
          "4e5166f96629e30736234e45bc348f1b4da7b363",
          null,
          null,
          "992ed87dea2722d78f36cc74594418be0128917c",
          "811d211b34a0a41f37f0307f23a628595d93acf5",
          null,
          "34e10d9bdc1bfb4623b7880b48b07ba59f2b4929"
        ].map((e) => b(e)).toList(),
        "bbbbbbbbbbbbbbbbbbbb": [
          "aaaaaaaaaaaaaaaaaaaa",
          "bbbbbbbbbbbbbbbbbbbb",
          "4e5166f96629e30736234e45bc348f1b4da7b363",
          null,
          null,
          "992ed87dea2722d78f36cc74594418be0128917c",
          "811d211b34a0a41f37f0307f23a628595d93acf5",
          null,
          "34e10d9bdc1bfb4623b7880b48b07ba59f2b4929"
        ].map((e) => b(e)).toList(),
        "cccccccccccccccccccc": [
          "cccccccccccccccccccc",
          "dddddddddddddddddddd",
          null,
          "98b45c956b61a79507eee405e595e35be0473004",
          "2dbf0b142f81b40f9aecb98f5df9fe686c680a67",
          null,
          "811d211b34a0a41f37f0307f23a628595d93acf5",
          null,
          "34e10d9bdc1bfb4623b7880b48b07ba59f2b4929"
        ].map((e) => b(e)).toList(),
        "dddddddddddddddddddd": [
          "cccccccccccccccccccc",
          "dddddddddddddddddddd",
          null,
          "98b45c956b61a79507eee405e595e35be0473004",
          "2dbf0b142f81b40f9aecb98f5df9fe686c680a67",
          null,
          "811d211b34a0a41f37f0307f23a628595d93acf5",
          null,
          "34e10d9bdc1bfb4623b7880b48b07ba59f2b4929"
        ].map((e) => b(e)).toList(),
        "eeeeeeeeeeeeeeeeeeee": [
          "eeeeeeeeeeeeeeeeeeee",
          "ffffffffffffffffffff",
          "1c793e530d678e7b7471f1446d02f0145c73213c",
          null,
          "2dbf0b142f81b40f9aecb98f5df9fe686c680a67",
          null,
          "811d211b34a0a41f37f0307f23a628595d93acf5",
          null,
          "34e10d9bdc1bfb4623b7880b48b07ba59f2b4929"
        ].map((e) => b(e)).toList(),
        "ffffffffffffffffffff": [
          "eeeeeeeeeeeeeeeeeeee",
          "ffffffffffffffffffff",
          "1c793e530d678e7b7471f1446d02f0145c73213c",
          null,
          "2dbf0b142f81b40f9aecb98f5df9fe686c680a67",
          null,
          "811d211b34a0a41f37f0307f23a628595d93acf5",
          null,
          "34e10d9bdc1bfb4623b7880b48b07ba59f2b4929"
        ].map((e) => b(e)).toList()
      }),
  Fixture(
      hash: "sha1",
      values: [
        "00000000000000000000",
        "11111111111111111111",
        "22222222222222222222",
        "22222222222222222222"
      ].map((e) => b(e)!).toList(),
      tree: [
        "00000000000000000000",
        "11111111111111111111",
        "22222222222222222222",
        "22222222222222222222",
        "16cac45ad1b51b6ee19919042c55c487ffee7950",
        "f8d1291ae0429b9955baacbd869fa0cef4817a3f",
        "1c844bf279c4e0e56bb68ebf6e177b19fdd7a99e"
      ].map((e) => b(e)!).toList(),
      proofs: {
        "00000000000000000000": [
          "00000000000000000000",
          "11111111111111111111",
          null,
          "f8d1291ae0429b9955baacbd869fa0cef4817a3f",
          "1c844bf279c4e0e56bb68ebf6e177b19fdd7a99e"
        ].map((e) => b(e)).toList(),
        "11111111111111111111": [
          "00000000000000000000",
          "11111111111111111111",
          null,
          "f8d1291ae0429b9955baacbd869fa0cef4817a3f",
          "1c844bf279c4e0e56bb68ebf6e177b19fdd7a99e"
        ].map((e) => b(e)).toList(),
        "22222222222222222222": [
          "22222222222222222222",
          "22222222222222222222",
          "16cac45ad1b51b6ee19919042c55c487ffee7950",
          null,
          "1c844bf279c4e0e56bb68ebf6e177b19fdd7a99e"
        ].map((e) => b(e)).toList()
      })
];
