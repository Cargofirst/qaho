import 'dart:math';

void main() {
  for (int i = 0; i < 1000; i++) {
    final sessionId = String.fromCharCodes(
            List.generate(3, (index) => Random().nextInt(26) + 65)) +
        (Random().nextInt(1000000000) + 1000000000).toString();
  }
}
