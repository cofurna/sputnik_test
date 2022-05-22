extension StringExt on String {
  String get abbreviation {
    String abbreviation = '';
    for (int index = 0; index < length; index++) {
      if (this[index] == this[index].toUpperCase() && this[index] != ' ') {
        abbreviation += this[index];
      }
    }
    return abbreviation;
  }
}
