String encode(String input, int shift) {
  List<int> buffer = input.codeUnits;

  for (int i = 0; i < buffer.length; i++) {
    int letter = buffer[i];

    if ((letter >= 'A'.codeUnitAt(0) && letter <= 'Z'.codeUnitAt(0)) ||
        (letter >= 'a'.codeUnitAt(0) && letter <= 'z'.codeUnitAt(0))) {
      int letterOffset = (letter >= 'A'.codeUnitAt(0) && letter <= 'Z'.codeUnitAt(0))
          ? 'A'.codeUnitAt(0)
          : 'a'.codeUnitAt(0);
      letter = (letter + shift - letterOffset) % 26 + letterOffset;
    } else if (letter >= '0'.codeUnitAt(0) && letter <= '9'.codeUnitAt(0)) {
      int digitOffset = '0'.codeUnitAt(0);
      letter = (letter + shift - digitOffset) % 10 + digitOffset;
    }

    buffer[i] = letter;
  }

  return String.fromCharCodes(buffer);
}

String decode(String input, int shift) {
  return encode(input, -shift);
}

