String formatPhoneNumber(String input) {
  RegExp regExp = RegExp(r'^(\d{3})(\d{3})(\d{4})$');
  return input.replaceAllMapped(regExp, (match) => '${match[1]} ${match[2]} ${match[3]}');
}
