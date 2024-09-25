import 'dart:math';

class RandomString {
  static String generate({int num = 1000000000}) {
    // it shoud be lesthan 1000000000 greater than 100000
    return String.fromCharCodes(
            List.generate(3, (index) => Random().nextInt(26) + 65)) +
        (Random().nextInt(num) + num).toString();
  }
}
