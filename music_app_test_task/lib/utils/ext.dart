extension IntExtension on int {
  String get toMinutesRepresentation {
    int minutes = this ~/ 60;
    int remainingSeconds = this % 60;
    String secondsString =
        remainingSeconds < 10 ? "0$remainingSeconds" : "$remainingSeconds";
    return "$minutes:$secondsString min";
  }
}

extension StringExtension on String {
  String get toInitialsRepresentation {
    List<String> words = this.split(" ");
    String initials = "";
    for (var word in words) {
      initials += word[0];
    }
    return initials;
  }
}
