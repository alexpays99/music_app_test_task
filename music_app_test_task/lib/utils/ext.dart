extension IntExtension on int {
  String get toMinutesRepresentation {
    int minutes = this ~/ 60;
    int remainingSeconds = this % 60;
    String secondsString =
        remainingSeconds < 10 ? "0$remainingSeconds" : "$remainingSeconds";
    return "$minutes:$secondsString min";
  }
}
